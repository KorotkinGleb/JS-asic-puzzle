# Remove only the high-fanout top-input nodes and their edges from the DOT
# emitted by Yosys.  Module boxes and every recovered register-state edge are
# preserved.  This is a visualization filter; it does not modify Verilog.

/^n[0-9]+ \[ shape=octagon, label="(I|clk|enable|rst_n|net_806)"/ {
    hidden[$1] = 1
    next
}

{
    for (node in hidden) {
        pattern = "(^|[^[:alnum:]_])" node "([^[:alnum:]_]|$)"
        if ($0 ~ pattern)
            next
    }
    print
}
