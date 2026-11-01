from pathlib import Path
import unittest

from soft.context import find_named_nets, load_context
from soft.dag import CircuitDAG
from soft.printing import format_trace_tree
from soft.registers import discover_registers
from soft.netlist import (
    generate_cell_models,
    generate_structural_block_design,
    generate_structural_complete_top,
    generate_structural_output_logic_module,
    generate_structural_register_module,
)
from soft.verilog import (
    generate_block_design,
    generate_complete_top,
    generate_net_module,
    generate_register_module,
)


PROJECT_ROOT = Path(__file__).resolve().parents[2]


class PipelineSmokeTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.context = load_context(PROJECT_ROOT / "puzzle.gds")
        cls.dag = CircuitDAG(cls.context)
        cls.catalog = discover_registers(cls.context)

    def test_extraction_and_native_labels(self):
        labels = {item.name: item.net for item in find_named_nets(self.context)}
        self.assertEqual(len(self.context.elements), 728)
        self.assertEqual(labels["I"], 520)
        self.assertEqual(labels["success"], 2380)

    def test_register_catalog_covers_every_ff(self):
        physical_ffs = {
            element.instance_id
            for element in self.context.elements
            if element.symbol_kind == "flip-flop"
        }
        self.assertEqual(set(self.catalog.by_instance), physical_ffs)
        self.assertEqual(self.catalog.get("shift_register").width, 12)

    def test_success_trace_stops_at_register(self):
        generated = generate_net_module(self.dag, self.catalog, 2380)
        self.assertEqual(generated.combinational_cell_count, 0)
        self.assertIn("input wire [2:0] register_09", generated.text)
        self.assertIn("assign success = register_09[2]", generated.text)
        tree = format_trace_tree(self.dag, generated.trace, self.catalog)
        self.assertIn("success (net_2380)", tree)
        self.assertIn("register_09[2]", tree)

    def test_register_merges_all_d_cones(self):
        generated = generate_register_module(self.dag, self.catalog, "register_10")
        self.assertIn("output reg [7:0] register_10", generated.text)
        self.assertNotIn("register_10_d", generated.text)
        self.assertIn("input wire I", generated.text)
        self.assertGreater(generated.combinational_cell_count, 100)

    def test_complete_top_has_native_interface_and_all_state(self):
        generated = generate_complete_top(self.dag, self.catalog)
        self.assertIn("input wire I", generated.text)
        self.assertIn("input wire enable", generated.text)
        self.assertIn("output wire [7:0] O", generated.text)
        self.assertIn("output wire success", generated.text)
        self.assertEqual(len(generated.registers), len(self.catalog.registers))

    def test_block_top_instantiates_every_recovered_register(self):
        design = generate_block_design(self.dag, self.catalog)
        self.assertIn("module recovered_block_top", design.top.text)
        self.assertIn("recovered_shift_register u_shift_register", design.top.text)
        self.assertIn("recovered_register_10 u_register_10", design.top.text)
        self.assertIn("recovered_output_logic u_output_logic", design.top.text)
        self.assertNotIn("assign net_", design.top.text)
        self.assertEqual(
            len(design.register_modules), len(self.catalog.registers)
        )

    def test_structural_backend_uses_only_wires_and_instances(self):
        register = generate_structural_register_module(
            self.dag, self.catalog, "register_02"
        )
        output_logic = generate_structural_output_logic_module(
            self.dag, self.catalog
        )
        top = generate_structural_complete_top(self.dag, self.catalog)
        block_design = generate_structural_block_design(self.dag, self.catalog)

        for generated in (register, output_logic, top, block_design.top):
            self.assertNotIn("assign ", generated.text)
            self.assertNotIn("always @", generated.text)

        self.assertIn("sky130_fd_sc_hd__dfxtp_2 u_234_state", register.text)
        self.assertIn("sky130_fd_sc_hd__a22o_2", output_logic.text)
        self.assertIn("soft_netlist_buf", output_logic.text)

        models = {model.module_name: model.text for model in generate_cell_models(self.dag)}
        self.assertIn("sky130_fd_sc_hd__dfrtp_2", models)
        self.assertIn("always @(posedge CLK or negedge RESET_B)", models["sky130_fd_sc_hd__dfrtp_2"])
        self.assertIn("assign X =", models["sky130_fd_sc_hd__a22o_2"])


if __name__ == "__main__":
    unittest.main()
