// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_10_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [7:0] register_group_10_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire [3:0] register_group_04_q,  // inferred group; index order follows instance IDs
    output wire [7:0] register_group_10_d  // complete recovered destination D vector
);

  wire to_ff_2709_d;
  wire to_ff_8085_d;
  wire to_ff_8086_d;
  wire to_ff_8090_d;
  wire to_ff_8091_d;
  wire to_ff_8199_d;
  wire to_ff_8214_d;
  wire to_ff_8219_d;

  // Recovered D-pin mapping for register_group_10_q
  assign register_group_10_d[0] = to_ff_2709_d;  // u_2709.D / net_1132
  assign register_group_10_d[1] = to_ff_8085_d;  // u_8085.D / net_840
  assign register_group_10_d[2] = to_ff_8086_d;  // u_8086.D / net_1039
  assign register_group_10_d[3] = to_ff_8090_d;  // u_8090.D / net_892
  assign register_group_10_d[4] = to_ff_8091_d;  // u_8091.D / net_1109
  assign register_group_10_d[5] = to_ff_8199_d;  // u_8199.D / net_857
  assign register_group_10_d[6] = to_ff_8214_d;  // u_8214.D / net_939
  assign register_group_10_d[7] = to_ff_8219_d;  // u_8219.D / net_1015


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_04_q: state/counter register candidate; confidence=0.950
  //   [0] = u_6435.Q (was ff_6435_q, extracted net_206)
  //   [1] = u_6436.Q (was ff_6436_q, extracted net_173)
  //   [2] = u_6442.Q (was ff_6442_q, extracted net_171)
  //   [3] = u_6451.Q (was ff_6451_q, extracted net_205)

  // register_group_10_q: state/counter register candidate; confidence=0.844
  //   [0] = u_2709.Q (was ff_2709_q, extracted net_1129)
  //   [1] = u_8085.Q (was ff_8085_q, extracted net_837)
  //   [2] = u_8086.Q (was ff_8086_q, extracted net_1012)
  //   [3] = u_8090.Q (was ff_8090_q, extracted net_942)
  //   [4] = u_8091.Q (was ff_8091_q, extracted net_1110)
  //   [5] = u_8199.Q (was ff_8199_q, extracted net_839)
  //   [6] = u_8214.Q (was ff_8214_q, extracted net_796)
  //   [7] = u_8219.Q (was ff_8219_q, extracted net_1031)


  wire net_1;
  wire net_2;
  wire net_4;
  wire net_5;
  wire net_6;
  wire net_8;
  wire net_9;
  wire net_11;
  wire net_12;
  wire net_14;
  wire net_15;
  wire net_16;
  wire net_17;
  wire net_18;
  wire net_20;
  wire net_22;
  wire net_28;
  wire net_29;
  wire net_30;
  wire net_31;
  wire net_36;
  wire net_37;
  wire net_38;
  wire net_39;
  wire net_40;
  wire net_41;
  wire net_42;
  wire net_44;
  wire net_45;
  wire net_46;
  wire net_48;
  wire net_50;
  wire net_51;
  wire net_52;
  wire net_58;
  wire net_59;
  wire net_60;
  wire net_62;
  wire net_69;
  wire net_71;
  wire net_72;
  wire net_74;
  wire net_76;
  wire net_77;
  wire net_78;
  wire net_79;
  wire net_90;
  wire net_91;
  wire net_94;
  wire net_95;
  wire net_96;
  wire net_106;
  wire net_107;
  wire net_108;
  wire net_111;
  wire net_113;
  wire net_119;
  wire net_120;
  wire net_128;
  wire net_134;
  wire net_135;
  wire net_136;
  wire net_138;
  wire net_141;
  wire net_145;
  wire net_170;
  wire net_172;
  wire net_178;
  wire net_181;
  wire net_184;
  wire net_185;
  wire net_196;
  wire net_202;
  wire net_203;
  wire net_204;
  wire net_208;
  wire net_213;
  wire net_216;
  wire net_218;
  wire net_219;
  wire net_232;
  wire net_233;
  wire net_234;
  wire net_235;
  wire net_236;
  wire net_237;
  wire net_238;
  wire net_239;
  wire net_250;
  wire net_256;
  wire net_264;
  wire net_265;
  wire net_275;
  wire net_277;
  wire net_279;
  wire net_280;
  wire net_282;
  wire net_302;
  wire net_303;
  wire net_305;
  wire net_312;
  wire net_313;
  wire net_316;
  wire net_324;
  wire net_325;
  wire net_326;
  wire net_327;
  wire net_328;
  wire net_329;
  wire net_349;
  wire net_350;
  wire net_352;
  wire net_354;
  wire net_355;
  wire net_370;
  wire net_374;
  wire net_398;
  wire net_400;
  wire net_402;
  wire net_403;
  wire net_404;
  wire net_406;
  wire net_416;
  wire net_417;
  wire net_418;
  wire net_419;
  wire net_442;
  wire net_443;
  wire net_446;
  wire net_447;
  wire net_462;
  wire net_463;
  wire net_465;
  wire net_466;
  wire net_467;
  wire net_497;
  wire net_501;
  wire net_502;
  wire net_507;
  wire net_509;
  wire net_548;
  wire net_549;
  wire net_559;
  wire net_562;
  wire net_584;
  wire net_586;
  wire net_604;
  wire net_643;
  wire net_767;
  wire net_776;
  wire net_779;
  wire net_787;
  wire net_838;
  wire net_908;
  wire net_938;
  wire net_941;
  wire net_979;
  wire net_1011;
  wire net_1013;
  wire net_1108;
  wire net_1131;
  wire net_1133;

  // to_ff_8085_d drives u_8085.D
  // to_ff_8199_d drives u_8199.D
  // to_ff_8090_d drives u_8090.D
  // to_ff_8214_d drives u_8214.D
  // to_ff_8219_d drives u_8219.D
  // to_ff_8086_d drives u_8086.D
  // to_ff_8091_d drives u_8091.D
  // to_ff_2709_d drives u_2709.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_72 (
      .A1(I),
      .A2(net_604),
      .A3(net_1131),
      .B1(register_group_10_q[0]),
      .X(net_1133)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_75 (
      .A1(register_group_10_q[4]),
      .A2(net_1108),
      .B1(net_1133),
      .X(to_ff_2709_d)
  );

  // and4b_2: X=(!A_N&B&C&D)
  sky130_fd_sc_hd__and4b_2 u_2707 (
      .A_N(net_584),
      .B(net_559),
      .C(net_643),
      .D(net_497),
      .X(net_1131)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_2717 (
      .A(I),
      .B(net_604),
      .C(register_group_10_q[0]),
      .D(net_1131),
      .Y(net_1108)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6872 (
      .A(net_15),
      .B(net_36),
      .Y(net_232)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6921 (
      .A(net_69),
      .B(net_106),
      .Y(net_134)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6936 (
      .A(net_136),
      .B(net_50),
      .Y(net_202)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_6945 (
      .A(net_279),
      .B(net_280),
      .Y(net_74)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6946 (
      .A(net_237),
      .B(net_586),
      .X(net_12)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_6947 (
      .A1(net_203),
      .A2(net_14),
      .B1(net_74),
      .C1(net_196),
      .X(net_239)
  );

  // o311a_2: X=(A1&B1&C1) | (A2&B1&C1) | (A3&B1&C1)
  sky130_fd_sc_hd__o311a_2 u_6948 (
      .A1(net_202),
      .A2(net_12),
      .A3(net_45),
      .B1(net_74),
      .C1(net_216),
      .X(net_264)
  );

  // o2bb2a_2: X=(!A1_N&B1) | (!A2_N&B1) | (!A1_N&B2) | (!A2_N&B2)
  sky130_fd_sc_hd__o2bb2a_2 u_6949 (
      .A1_N(register_group_03_q[0]),
      .A2_N(net_178),
      .B1(net_204),
      .B2(register_group_04_q[1]),
      .X(net_265)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6950 (
      .A(register_group_04_q[2]),
      .B(register_group_04_q[1]),
      .X(net_236)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_6952 (
      .A1(net_138),
      .A2(net_238),
      .B1(net_234),
      .X(net_237)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_6953 (
      .A(register_group_04_q[0]),
      .B(net_236),
      .Y(net_235)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_6954 (
      .A1(register_group_04_q[3]),
      .A2(register_group_04_q[1]),
      .A3(register_group_04_q[0]),
      .B1(net_275),
      .X(net_277)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_6955 (
      .A1(register_group_04_q[3]),
      .A2(net_236),
      .B1(net_172),
      .Y(net_178)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_6956 (
      .A(register_group_04_q[2]),
      .B(register_group_04_q[1]),
      .Y(net_350)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6957 (
      .A(register_group_04_q[3]),
      .B(net_235),
      .Y(net_233)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_6960 (
      .A0(net_14),
      .A1(net_50),
      .S(net_17),
      .X(net_305)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_6962 (
      .A(net_41),
      .Y(net_282)
  );

  // o22ai_2: Y=(!B1&!B2) | (!A1&!A2)
  sky130_fd_sc_hd__o22ai_2 u_6963 (
      .A1(net_50),
      .A2(net_39),
      .B1(net_96),
      .B2(net_312),
      .Y(net_256)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_6964 (
      .A(net_138),
      .B(net_181),
      .Y(net_50)
  );

  // a211o_2: X=(A1&A2) | (B1) | (C1)
  sky130_fd_sc_hd__a211o_2 u_6968 (
      .A1(net_50),
      .A2(net_42),
      .B1(net_91),
      .C1(net_12),
      .X(net_250)
  );

  // o21ai_2: Y=(!A1&!A2) | (!B1)
  sky130_fd_sc_hd__o21ai_2 u_6977 (
      .A1(net_15),
      .A2(net_185),
      .B1(net_12),
      .Y(net_77)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_6978 (
      .A1(net_400),
      .A2(net_466),
      .B1(net_509),
      .C1(net_417),
      .X(net_584)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_6979 (
      .A1(net_12),
      .A2(net_256),
      .B1(net_446),
      .B2(net_447),
      .C1(net_507),
      .X(net_465)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_6980 (
      .A(net_354),
      .B(net_265),
      .Y(net_181)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_6981 (
      .A(net_416),
      .B(net_398),
      .Y(net_507)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6982 (
      .A(net_279),
      .B(net_280),
      .X(net_312)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6983 (
      .A(net_416),
      .B(net_398),
      .X(net_400)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_6984 (
      .A(net_507),
      .B(net_239),
      .C(net_316),
      .X(net_403)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_6987 (
      .A1(net_400),
      .A2(net_549),
      .B1(net_465),
      .C1(net_417),
      .X(net_559)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_7374 (
      .A(net_548),
      .B(net_501),
      .Y(net_586)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_7375 (
      .A(net_354),
      .B(net_265),
      .Y(net_238)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_7376 (
      .A1(net_237),
      .A2(net_586),
      .B1(net_548),
      .X(net_279)
  );

  // a211o_2: X=(A1&A2) | (B1) | (C1)
  sky130_fd_sc_hd__a211o_2 u_7379 (
      .A1(net_12),
      .A2(net_22),
      .B1(net_305),
      .C1(net_74),
      .X(net_325)
  );

  // o22ai_2: Y=(!B1&!B2) | (!A1&!A2)
  sky130_fd_sc_hd__o22ai_2 u_7380 (
      .A1(register_group_04_q[3]),
      .A2(net_235),
      .B1(net_324),
      .B2(net_277),
      .Y(net_303)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_7381 (
      .A1(net_302),
      .A2(net_275),
      .B1(net_352),
      .X(net_398)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_7382 (
      .A(net_442),
      .B(net_502),
      .C(net_463),
      .X(net_501)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_7383 (
      .A(net_233),
      .B(net_275),
      .C(net_370),
      .X(net_463)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_7400 (
      .A(net_462),
      .B(net_208),
      .Y(net_417)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_7404 (
      .A(net_74),
      .B(net_29),
      .C(net_562),
      .X(net_406)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7414 (
      .A1(net_279),
      .A2(net_303),
      .B1(net_213),
      .Y(net_416)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_7415 (
      .A(net_354),
      .B(net_265),
      .Y(net_234)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_7416 (
      .A_N(net_213),
      .B(net_303),
      .X(net_280)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_7417 (
      .A(net_350),
      .B(net_235),
      .C(net_349),
      .X(net_370)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_7435 (
      .A(net_416),
      .B(net_398),
      .Y(net_462)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_7454 (
      .A(net_350),
      .B(net_349),
      .Y(net_275)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_7465 (
      .A(register_group_04_q[3]),
      .B(register_group_04_q[1]),
      .Y(net_302)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7546 (
      .A1(register_group_04_q[0]),
      .A2(net_302),
      .B1(net_275),
      .Y(net_352)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7548 (
      .A1(register_group_04_q[3]),
      .A2(register_group_04_q[0]),
      .B1(register_group_04_q[1]),
      .Y(net_324)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7560 (
      .A1(net_442),
      .A2(net_502),
      .B1(net_463),
      .Y(net_548)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_7563 (
      .A1(net_400),
      .A2(net_419),
      .B1(net_355),
      .C1(net_417),
      .X(net_497)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_7564 (
      .A(register_group_03_q[1]),
      .B(net_443),
      .Y(net_354)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_7565 (
      .A(net_302),
      .B(net_326),
      .Y(net_443)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_7566 (
      .A(register_group_04_q[3]),
      .B(register_group_04_q[0]),
      .Y(net_349)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_7567 (
      .A(register_group_04_q[0]),
      .B(net_236),
      .X(net_326)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_7656 (
      .A_N(net_302),
      .B(net_326),
      .Y(net_442)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_7660 (
      .A(register_group_03_q[1]),
      .B(net_443),
      .Y(net_502)
  );

  // o21ai_2: Y=(!A1&!A2) | (!B1)
  sky130_fd_sc_hd__o21ai_2 u_7764 (
      .A1(net_312),
      .A2(net_329),
      .B1(net_111),
      .Y(net_549)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_7766 (
      .A(net_62),
      .B(net_128),
      .X(net_327)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7767 (
      .A1(net_203),
      .A2(net_94),
      .B1(net_74),
      .Y(net_316)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_7768 (
      .A1(net_312),
      .A2(net_374),
      .B1(net_406),
      .X(net_419)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_7769 (
      .A(net_50),
      .B(net_282),
      .C(net_5),
      .X(net_16)
  );

  // o21ai_2: Y=(!A1&!A2) | (!B1)
  sky130_fd_sc_hd__o21ai_2 u_7816 (
      .A1(net_14),
      .A2(net_16),
      .B1(net_12),
      .Y(net_562)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_7819 (
      .A0(net_418),
      .A1(net_44),
      .S(net_312),
      .X(net_466)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_7820 (
      .A1(net_312),
      .A2(net_95),
      .A3(net_467),
      .B1(net_400),
      .X(net_404)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_7823 (
      .A0(net_327),
      .A1(net_313),
      .S(net_12),
      .X(net_328)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_7824 (
      .A1(net_264),
      .A2(net_404),
      .B1(net_417),
      .C1(net_403),
      .X(net_643)
  );

  // o211ai_2: Y=(!A1&!A2) | (!B1) | (!C1)
  sky130_fd_sc_hd__o211ai_2 u_7825 (
      .A1(net_312),
      .A2(net_328),
      .B1(net_325),
      .C1(net_400),
      .Y(net_355)
  );

  // o32a_2: X=(A1&B1) | (A1&B2) | (A2&B1) | (A3&B1) | (A2&B2) | (A3&B2)
  sky130_fd_sc_hd__o32a_2 u_7832 (
      .A1(net_12),
      .A2(net_45),
      .A3(net_402),
      .B1(net_134),
      .B2(net_184),
      .X(net_418)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_7852 (
      .A1(net_312),
      .A2(net_219),
      .B1(net_12),
      .Y(net_447)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_7854 (
      .A(net_312),
      .B(net_232),
      .X(net_446)
  );

  // a211o_2: X=(A1&A2) | (B1) | (C1)
  sky130_fd_sc_hd__a211o_2 u_7914 (
      .A1(net_312),
      .A2(net_119),
      .B1(net_79),
      .C1(net_507),
      .X(net_509)
  );

  // o32a_2: X=(A1&B1) | (A1&B2) | (A2&B1) | (A3&B1) | (A2&B2) | (A3&B2)
  sky130_fd_sc_hd__o32a_2 u_8011 (
      .A1(net_12),
      .A2(net_45),
      .A3(net_31),
      .B1(net_184),
      .B2(net_90),
      .X(net_329)
  );

  // a21bo_2: X=(A1&A2) | (!B1_N)
  sky130_fd_sc_hd__a21bo_2 u_8044 (
      .A1(net_12),
      .A2(net_170),
      .B1_N(net_250),
      .X(net_374)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_8190 (
      .A1(register_group_10_q[3]),
      .A2(net_941),
      .B1(net_908),
      .X(to_ff_8214_d)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_8191 (
      .A(I),
      .B(net_604),
      .Y(net_779)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_8192 (
      .A1(register_group_10_q[5]),
      .A2(net_838),
      .B1(net_787),
      .X(to_ff_8199_d)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_8196 (
      .A1(register_group_10_q[5]),
      .A2(net_838),
      .B1(register_group_10_q[1]),
      .X(to_ff_8085_d)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_8200 (
      .A1(I),
      .A2(net_604),
      .A3(net_776),
      .B1(register_group_10_q[6]),
      .X(net_908)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_8202 (
      .A_N(register_group_10_q[4]),
      .B(net_1108),
      .Y(to_ff_8091_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_8211 (
      .A1(register_group_10_q[2]),
      .A2(net_1013),
      .B1(net_1011),
      .X(to_ff_8219_d)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_8212 (
      .A(I),
      .B(net_604),
      .C(register_group_10_q[7]),
      .D(net_979),
      .Y(net_1013)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_8213 (
      .A_N(net_643),
      .B_N(net_584),
      .C(net_559),
      .D(net_497),
      .X(net_979)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_8215 (
      .A_N(register_group_10_q[2]),
      .B(net_1013),
      .Y(to_ff_8086_d)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_8275 (
      .A1(I),
      .A2(net_604),
      .A3(net_979),
      .B1(register_group_10_q[7]),
      .X(net_1011)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_8290 (
      .A(register_group_10_q[5]),
      .Y(net_938)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_8321 (
      .A_N(register_group_10_q[3]),
      .B(net_941),
      .Y(to_ff_8090_d)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_8427 (
      .A(I),
      .B(net_604),
      .C(register_group_10_q[6]),
      .D(net_776),
      .Y(net_941)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_8428 (
      .A_N(net_497),
      .B_N(net_584),
      .C(net_559),
      .D(net_643),
      .X(net_776)
  );

  // or4b_2: X=(A) | (B) | (C) | (!D_N)
  sky130_fd_sc_hd__or4b_2 u_8437 (
      .A(net_497),
      .B(net_643),
      .C(net_584),
      .D_N(net_559),
      .X(net_767)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_8461 (
      .A(register_group_10_q[1]),
      .B(net_938),
      .C(net_767),
      .D(net_779),
      .X(net_787)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_8490 (
      .A(net_767),
      .B(net_779),
      .Y(net_838)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_8995 (
      .A(net_135),
      .B(net_72),
      .X(net_8)
  );

  // o22a_2: X=(A1&B1) | (A2&B1) | (A1&B2) | (A2&B2)
  sky130_fd_sc_hd__o22a_2 u_8996 (
      .A1(net_15),
      .A2(net_17),
      .B1(net_4),
      .B2(net_40),
      .X(net_18)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_8997 (
      .A1(net_20),
      .A2(net_8),
      .B1(net_50),
      .C1(net_136),
      .X(net_48)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_8998 (
      .A_N(register_group_04_q[2]),
      .B_N(register_group_04_q[3]),
      .C(register_group_04_q[1]),
      .D(register_group_04_q[0]),
      .X(net_213)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_8999 (
      .A(net_135),
      .B(net_72),
      .Y(net_38)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_9000 (
      .A(net_138),
      .B(net_181),
      .X(net_15)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_9001 (
      .A(net_12),
      .B(net_14),
      .C(net_48),
      .X(net_94)
  );

  // a22o_2: X=(B1&B2) | (A1&A2)
  sky130_fd_sc_hd__a22o_2 u_9002 (
      .A1(net_39),
      .A2(net_14),
      .B1(net_2),
      .B2(net_50),
      .X(net_313)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9003 (
      .A(net_50),
      .B(net_52),
      .Y(net_402)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9004 (
      .A(net_12),
      .B(net_218),
      .Y(net_216)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9005 (
      .A(net_50),
      .B(net_69),
      .Y(net_14)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9006 (
      .A(net_15),
      .B(net_22),
      .Y(net_62)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_9007 (
      .A(net_20),
      .B(net_15),
      .C(net_2),
      .X(net_96)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_9008 (
      .A(net_20),
      .B(net_6),
      .C(net_78),
      .X(net_113)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_9009 (
      .A(net_2),
      .Y(net_185)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9010 (
      .A(net_50),
      .B(net_39),
      .Y(net_106)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_9012 (
      .A1(net_20),
      .A2(net_106),
      .B1(net_51),
      .X(net_30)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_9013 (
      .A(net_50),
      .B(net_22),
      .X(net_4)
  );

  // a21bo_2: X=(A1&A2) | (!B1_N)
  sky130_fd_sc_hd__a21bo_2 u_9043 (
      .A1(net_38),
      .A2(net_51),
      .B1_N(net_120),
      .X(net_95)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_9044 (
      .A1(net_15),
      .A2(net_36),
      .A3(net_5),
      .B1(net_46),
      .X(net_60)
  );

  // o31ai_2: Y=(!A1&!A2&!A3) | (!B1)
  sky130_fd_sc_hd__o31ai_2 u_9045 (
      .A1(net_20),
      .A2(net_15),
      .A3(net_8),
      .B1(net_136),
      .Y(net_145)
  );

  // a32o_2: X=(A1&A2&A3) | (B1&B2)
  sky130_fd_sc_hd__a32o_2 u_9046 (
      .A1(net_12),
      .A2(net_106),
      .A3(net_4),
      .B1(net_18),
      .B2(net_120),
      .X(net_119)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_9047 (
      .A_N(net_46),
      .B(net_22),
      .Y(net_17)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_9049 (
      .A1(net_15),
      .A2(net_41),
      .B1(net_22),
      .X(net_128)
  );

  // o31ai_2: Y=(!A1&!A2&!A3) | (!B1)
  sky130_fd_sc_hd__o31ai_2 u_9062 (
      .A1(net_50),
      .A2(net_78),
      .A3(net_185),
      .B1(net_12),
      .Y(net_184)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_9063 (
      .A0(net_52),
      .A1(net_113),
      .S(net_15),
      .X(net_218)
  );

  // o21ba_2: X=(A1&!B1_N) | (A2&!B1_N)
  sky130_fd_sc_hd__o21ba_2 u_9115 (
      .A1(net_50),
      .A2(net_42),
      .B1_N(net_170),
      .X(net_219)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9127 (
      .A(net_12),
      .B(net_145),
      .Y(net_467)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_9198 (
      .A1(net_50),
      .A2(net_46),
      .B1(net_52),
      .Y(net_31)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_9245 (
      .A1(net_15),
      .A2(net_1),
      .B1(net_4),
      .X(net_76)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_9265 (
      .A(net_50),
      .B(net_6),
      .X(net_51)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_9336 (
      .A1(net_20),
      .A2(net_2),
      .B1(net_15),
      .X(net_91)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_9337 (
      .A(net_12),
      .B(net_232),
      .C(net_62),
      .X(net_196)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_9338 (
      .A(net_8),
      .B(net_6),
      .X(net_2)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9340 (
      .A(net_135),
      .B(net_41),
      .Y(net_42)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9341 (
      .A(register_group_03_q[3]),
      .B(net_9),
      .Y(net_28)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_9342 (
      .A(net_12),
      .B(net_74),
      .C(net_113),
      .D(net_91),
      .X(net_111)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_9343 (
      .A1(register_group_04_q[2]),
      .A2(register_group_04_q[3]),
      .B1(register_group_04_q[1]),
      .C1(register_group_04_q[0]),
      .X(net_208)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_9344 (
      .A_N(net_72),
      .B(net_59),
      .X(net_11)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9345 (
      .A(net_38),
      .B(net_6),
      .Y(net_69)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9346 (
      .A(net_71),
      .B(net_58),
      .Y(net_59)
  );

  // a311o_2: X=(A1&A2&A3) | (B1) | (C1)
  sky130_fd_sc_hd__a311o_2 u_9347 (
      .A1(net_135),
      .A2(net_12),
      .A3(net_11),
      .B1(net_14),
      .C1(net_16),
      .X(net_29)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_9348 (
      .A1(net_15),
      .A2(net_69),
      .B1(net_12),
      .Y(net_120)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_9351 (
      .A(net_36),
      .B(net_5),
      .X(net_1)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_9353 (
      .A(register_group_03_q[0]),
      .B(net_178),
      .X(net_141)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_9354 (
      .A(register_group_04_q[2]),
      .B(register_group_04_q[3]),
      .X(net_9)
  );

  // a32o_2: X=(A1&A2&A3) | (B1&B2)
  sky130_fd_sc_hd__a32o_2 u_9355 (
      .A1(register_group_03_q[3]),
      .A2(net_9),
      .A3(net_141),
      .B1(net_135),
      .B2(net_72),
      .X(net_138)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_9356 (
      .A(register_group_03_q[3]),
      .B(net_9),
      .Y(net_71)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_9357 (
      .A0(net_30),
      .A1(net_60),
      .S(net_12),
      .X(net_44)
  );

  // o221a_2: X=(A1&B1&C1) | (A2&B1&C1) | (A1&B2&C1) | (A2&B2&C1)
  sky130_fd_sc_hd__o221a_2 u_9358 (
      .A1(net_78),
      .A2(net_77),
      .B1(net_76),
      .B2(net_12),
      .C1(net_74),
      .X(net_79)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_9360 (
      .A(net_28),
      .B(net_141),
      .Y(net_135)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_9470 (
      .A(register_group_03_q[2]),
      .B(register_group_04_q[2]),
      .X(net_108)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_9540 (
      .A(net_50),
      .B(net_38),
      .C(net_46),
      .X(net_45)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9597 (
      .A(net_107),
      .B(net_59),
      .Y(net_41)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9598 (
      .A(net_135),
      .B(net_20),
      .Y(net_136)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9602 (
      .A(net_71),
      .B(net_37),
      .Y(net_20)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9605 (
      .A(net_38),
      .B(net_6),
      .Y(net_39)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_9607 (
      .A(net_108),
      .B(net_107),
      .X(net_37)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9608 (
      .A(register_group_03_q[2]),
      .B(register_group_04_q[2]),
      .Y(net_58)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_9611 (
      .A(net_20),
      .B(net_38),
      .C(net_6),
      .X(net_52)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_9612 (
      .A(net_8),
      .B(net_11),
      .X(net_22)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9614 (
      .A(net_12),
      .B(net_106),
      .Y(net_203)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_9615 (
      .A(net_37),
      .B(net_11),
      .X(net_46)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9622 (
      .A(register_group_04_q[2]),
      .B(register_group_04_q[3]),
      .Y(net_204)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9636 (
      .A(register_group_03_q[2]),
      .B(register_group_04_q[2]),
      .Y(net_107)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9637 (
      .A(register_group_04_q[3]),
      .B(register_group_04_q[1]),
      .Y(net_172)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9705 (
      .A(net_135),
      .B(net_11),
      .Y(net_36)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9714 (
      .A(net_136),
      .B(net_15),
      .Y(net_170)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9730 (
      .A(net_108),
      .B(net_107),
      .Y(net_40)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9760 (
      .A(net_15),
      .B(net_69),
      .Y(net_90)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_9763 (
      .A(net_37),
      .B(net_38),
      .Y(net_5)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9790 (
      .A(net_38),
      .B(net_41),
      .Y(net_78)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9810 (
      .A(net_40),
      .B(net_11),
      .Y(net_6)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_9818 (
      .A(net_71),
      .B(net_58),
      .Y(net_72)
  );

endmodule
