// Combinational RTL recovered from a GDS backward DAG trace.
// Inputs stop only at recovered register Q pins or pure top inputs.
module recovered_net_1131_value_logic (
    input wire [3:0] register_03,  // recovered register boundary
    input wire [3:0] register_04,  // recovered register boundary
    output wire net_1131_value
);

  // Extracted combinational nets.
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
  wire net_643;
  wire net_1131;

  // Liberty Boolean functions recovered from standard cells.
  // u_6950: sky130_fd_sc_hd__xor2_2
  assign net_236 = (register_04[2]&!register_04[1]) | (!register_04[2]&register_04[1]);
  // u_6956: sky130_fd_sc_hd__nand2_2
  assign net_350 = (!register_04[2]) | (!register_04[1]);
  // u_7465: sky130_fd_sc_hd__nand2_2
  assign net_302 = (!register_04[3]) | (!register_04[1]);
  // u_7548: sky130_fd_sc_hd__a21oi_2
  assign net_324 = (!register_04[3]&!register_04[1]) | (!register_04[0]&!register_04[1]);
  // u_7566: sky130_fd_sc_hd__xnor2_2
  assign net_349 = (!register_04[3]&!register_04[0]) | (register_04[3]&register_04[0]);
  // u_8998: sky130_fd_sc_hd__and4bb_2
  assign net_213 = (!register_04[2]&!register_04[3]&register_04[1]&register_04[0]);
  // u_9343: sky130_fd_sc_hd__o211a_2
  assign net_208 = (register_04[2]&register_04[1]&register_04[0]) | (register_04[3]&register_04[1]&register_04[0]);
  // u_9354: sky130_fd_sc_hd__xor2_2
  assign net_9 = (register_04[2]&!register_04[3]) | (!register_04[2]&register_04[3]);
  // u_9470: sky130_fd_sc_hd__and2_2
  assign net_108 = (register_03[2]&register_04[2]);
  // u_9608: sky130_fd_sc_hd__nand2_2
  assign net_58 = (!register_03[2]) | (!register_04[2]);
  // u_9622: sky130_fd_sc_hd__nand2_2
  assign net_204 = (!register_04[2]) | (!register_04[3]);
  // u_9636: sky130_fd_sc_hd__nor2_2
  assign net_107 = (!register_03[2]&!register_04[2]);
  // u_9637: sky130_fd_sc_hd__nor2_2
  assign net_172 = (!register_04[3]&!register_04[1]);
  // u_6953: sky130_fd_sc_hd__nand2_2
  assign net_235 = (!register_04[0]) | (!net_236);
  // u_7567: sky130_fd_sc_hd__xor2_2
  assign net_326 = (register_04[0]&!net_236) | (!register_04[0]&net_236);
  // u_7454: sky130_fd_sc_hd__nor2_2
  assign net_275 = (!net_350&!net_349);
  // u_9341: sky130_fd_sc_hd__nand2_2
  assign net_28 = (!register_03[3]) | (!net_9);
  // u_9356: sky130_fd_sc_hd__xnor2_2
  assign net_71 = (!register_03[3]&!net_9) | (register_03[3]&net_9);
  // u_9607: sky130_fd_sc_hd__or2_2
  assign net_37 = (net_108) | (net_107);
  // u_9730: sky130_fd_sc_hd__nor2_2
  assign net_40 = (!net_108&!net_107);
  // u_6955: sky130_fd_sc_hd__a21oi_2
  assign net_178 = (!register_04[3]&!net_172) | (!net_236&!net_172);
  // u_6957: sky130_fd_sc_hd__nor2_2
  assign net_233 = (!register_04[3]&!net_235);
  // u_7417: sky130_fd_sc_hd__and3_2
  assign net_370 = (net_350&net_235&net_349);
  // u_7565: sky130_fd_sc_hd__xnor2_2
  assign net_443 = (!net_302&!net_326) | (net_302&net_326);
  // u_7656: sky130_fd_sc_hd__nand2b_2
  assign net_442 = (net_302) | (!net_326);
  // u_6954: sky130_fd_sc_hd__a31o_2
  assign net_277 = (register_04[3]&register_04[1]&register_04[0]) | (net_275);
  // u_7546: sky130_fd_sc_hd__a21oi_2
  assign net_352 = (!register_04[0]&!net_275) | (!net_302&!net_275);
  // u_9346: sky130_fd_sc_hd__nand2_2
  assign net_59 = (!net_71) | (!net_58);
  // u_9818: sky130_fd_sc_hd__nor2_2
  assign net_72 = (!net_71&!net_58);
  // u_9602: sky130_fd_sc_hd__nor2_2
  assign net_20 = (!net_71&!net_37);
  // u_6949: sky130_fd_sc_hd__o2bb2a_2
  assign net_265 = (!register_03[0]&net_204) | (!net_178&net_204) | (!register_03[0]&register_04[1]) | (!net_178&register_04[1]);
  // u_9353: sky130_fd_sc_hd__xor2_2
  assign net_141 = (register_03[0]&!net_178) | (!register_03[0]&net_178);
  // u_7383: sky130_fd_sc_hd__or3_2
  assign net_463 = (net_233) | (net_275) | (net_370);
  // u_7564: sky130_fd_sc_hd__xnor2_2
  assign net_354 = (!register_03[1]&!net_443) | (register_03[1]&net_443);
  // u_7660: sky130_fd_sc_hd__nand2_2
  assign net_502 = (!register_03[1]) | (!net_443);
  // u_7380: sky130_fd_sc_hd__o22ai_2
  assign net_303 = (!net_324&!net_277) | (!register_04[3]&!net_235);
  // u_7381: sky130_fd_sc_hd__a21o_2
  assign net_398 = (net_302&net_275) | (net_352);
  // u_9597: sky130_fd_sc_hd__nor2_2
  assign net_41 = (!net_107&!net_59);
  // u_9344: sky130_fd_sc_hd__and2b_2
  assign net_11 = (!net_72&net_59);
  // u_9360: sky130_fd_sc_hd__xnor2_2
  assign net_135 = (!net_28&!net_141) | (net_28&net_141);
  // u_6980: sky130_fd_sc_hd__xnor2_2
  assign net_181 = (!net_354&!net_265) | (net_354&net_265);
  // u_7375: sky130_fd_sc_hd__nand2_2
  assign net_238 = (!net_354) | (!net_265);
  // u_7415: sky130_fd_sc_hd__nor2_2
  assign net_234 = (!net_354&!net_265);
  // u_7382: sky130_fd_sc_hd__and3_2
  assign net_501 = (net_442&net_502&net_463);
  // u_7560: sky130_fd_sc_hd__a21oi_2
  assign net_548 = (!net_442&!net_463) | (!net_502&!net_463);
  // u_7416: sky130_fd_sc_hd__and2b_2
  assign net_280 = (!net_213&net_303);
  // u_6962: sky130_fd_sc_hd__inv_2
  assign net_282 = (!net_41);
  // u_9615: sky130_fd_sc_hd__and2_2
  assign net_46 = (net_37&net_11);
  // u_9810: sky130_fd_sc_hd__nor2_2
  assign net_6 = (!net_40&!net_11);
  // u_8995: sky130_fd_sc_hd__xor2_2
  assign net_8 = (net_135&!net_72) | (!net_135&net_72);
  // u_8999: sky130_fd_sc_hd__xnor2_2
  assign net_38 = (!net_135&!net_72) | (net_135&net_72);
  // u_9340: sky130_fd_sc_hd__nand2_2
  assign net_42 = (!net_135) | (!net_41);
  // u_9355: sky130_fd_sc_hd__a32o_2
  assign net_138 = (register_03[3]&net_9&net_141) | (net_135&net_72);
  // u_9598: sky130_fd_sc_hd__nand2_2
  assign net_136 = (!net_135) | (!net_20);
  // u_9705: sky130_fd_sc_hd__nand2_2
  assign net_36 = (!net_135) | (!net_11);
  // u_7374: sky130_fd_sc_hd__nor2_2
  assign net_586 = (!net_548&!net_501);
  // u_9338: sky130_fd_sc_hd__or2_2
  assign net_2 = (net_8) | (net_6);
  // u_9612: sky130_fd_sc_hd__or2_2
  assign net_22 = (net_8) | (net_11);
  // u_9345: sky130_fd_sc_hd__nor2_2
  assign net_69 = (!net_38&!net_6);
  // u_9605: sky130_fd_sc_hd__nand2_2
  assign net_39 = (!net_38) | (!net_6);
  // u_9611: sky130_fd_sc_hd__or3_2
  assign net_52 = (net_20) | (net_38) | (net_6);
  // u_9763: sky130_fd_sc_hd__nand2_2
  assign net_5 = (!net_37) | (!net_38);
  // u_9790: sky130_fd_sc_hd__nor2_2
  assign net_78 = (!net_38&!net_41);
  // u_6952: sky130_fd_sc_hd__a21o_2
  assign net_237 = (net_138&net_238) | (net_234);
  // u_6964: sky130_fd_sc_hd__xnor2_2
  assign net_50 = (!net_138&!net_181) | (net_138&net_181);
  // u_9000: sky130_fd_sc_hd__xor2_2
  assign net_15 = (net_138&!net_181) | (!net_138&net_181);
  // u_9009: sky130_fd_sc_hd__inv_2
  assign net_185 = (!net_2);
  // u_9047: sky130_fd_sc_hd__nand2b_2
  assign net_17 = (net_46) | (!net_22);
  // u_9351: sky130_fd_sc_hd__and2_2
  assign net_1 = (net_36&net_5);
  // u_9008: sky130_fd_sc_hd__or3_2
  assign net_113 = (net_20) | (net_6) | (net_78);
  // u_6946: sky130_fd_sc_hd__xor2_2
  assign net_12 = (net_237&!net_586) | (!net_237&net_586);
  // u_7376: sky130_fd_sc_hd__a21o_2
  assign net_279 = (net_237&net_586) | (net_548);
  // u_6936: sky130_fd_sc_hd__nor2_2
  assign net_202 = (!net_136&!net_50);
  // u_7769: sky130_fd_sc_hd__and3_2
  assign net_16 = (net_50&net_282&net_5);
  // u_8997: sky130_fd_sc_hd__o211a_2
  assign net_48 = (net_20&net_50&net_136) | (net_8&net_50&net_136);
  // u_9003: sky130_fd_sc_hd__nor2_2
  assign net_402 = (!net_50&!net_52);
  // u_9005: sky130_fd_sc_hd__nor2_2
  assign net_14 = (!net_50&!net_69);
  // u_9010: sky130_fd_sc_hd__nand2_2
  assign net_106 = (!net_50) | (!net_39);
  // u_9013: sky130_fd_sc_hd__or2_2
  assign net_4 = (net_50) | (net_22);
  // u_9198: sky130_fd_sc_hd__a21oi_2
  assign net_31 = (!net_50&!net_52) | (!net_46&!net_52);
  // u_9265: sky130_fd_sc_hd__or2_2
  assign net_51 = (net_50) | (net_6);
  // u_9540: sky130_fd_sc_hd__and3_2
  assign net_45 = (net_50&net_38&net_46);
  // u_6872: sky130_fd_sc_hd__nor2_2
  assign net_232 = (!net_15&!net_36);
  // u_9006: sky130_fd_sc_hd__nor2_2
  assign net_62 = (!net_15&!net_22);
  // u_9007: sky130_fd_sc_hd__or3_2
  assign net_96 = (net_20) | (net_15) | (net_2);
  // u_9044: sky130_fd_sc_hd__a31o_2
  assign net_60 = (net_15&net_36&net_5) | (net_46);
  // u_9045: sky130_fd_sc_hd__o31ai_2
  assign net_145 = (!net_20&!net_15&!net_8) | (!net_136);
  // u_9049: sky130_fd_sc_hd__o21a_2
  assign net_128 = (net_15&net_22) | (net_41&net_22);
  // u_9336: sky130_fd_sc_hd__o21a_2
  assign net_91 = (net_20&net_15) | (net_2&net_15);
  // u_9714: sky130_fd_sc_hd__nor2_2
  assign net_170 = (!net_136&!net_15);
  // u_9760: sky130_fd_sc_hd__nor2_2
  assign net_90 = (!net_15&!net_69);
  // u_9063: sky130_fd_sc_hd__mux2_1
  assign net_218 = (net_52&!net_15) | (net_113&net_15);
  // u_6977: sky130_fd_sc_hd__o21ai_2
  assign net_77 = (!net_15&!net_185) | (!net_12);
  // u_9062: sky130_fd_sc_hd__o31ai_2
  assign net_184 = (!net_50&!net_78&!net_185) | (!net_12);
  // u_9348: sky130_fd_sc_hd__a21oi_2
  assign net_120 = (!net_15&!net_12) | (!net_69&!net_12);
  // u_6945: sky130_fd_sc_hd__xnor2_2
  assign net_74 = (!net_279&!net_280) | (net_279&net_280);
  // u_6982: sky130_fd_sc_hd__xor2_2
  assign net_312 = (net_279&!net_280) | (!net_279&net_280);
  // u_7414: sky130_fd_sc_hd__a21oi_2
  assign net_416 = (!net_279&!net_213) | (!net_303&!net_213);
  // u_6960: sky130_fd_sc_hd__mux2_1
  assign net_305 = (net_14&!net_17) | (net_50&net_17);
  // u_7816: sky130_fd_sc_hd__o21ai_2
  assign net_562 = (!net_14&!net_16) | (!net_12);
  // u_9001: sky130_fd_sc_hd__or3_2
  assign net_94 = (net_12) | (net_14) | (net_48);
  // u_9002: sky130_fd_sc_hd__a22o_2
  assign net_313 = (net_2&net_50) | (net_39&net_14);
  // u_9347: sky130_fd_sc_hd__a311o_2
  assign net_29 = (net_135&net_12&net_11) | (net_14) | (net_16);
  // u_6921: sky130_fd_sc_hd__nor2_2
  assign net_134 = (!net_69&!net_106);
  // u_9614: sky130_fd_sc_hd__nand2_2
  assign net_203 = (!net_12) | (!net_106);
  // u_8996: sky130_fd_sc_hd__o22a_2
  assign net_18 = (net_15&net_4) | (net_17&net_4) | (net_15&net_40) | (net_17&net_40);
  // u_9245: sky130_fd_sc_hd__o21a_2
  assign net_76 = (net_15&net_4) | (net_1&net_4);
  // u_9012: sky130_fd_sc_hd__o21a_2
  assign net_30 = (net_20&net_51) | (net_106&net_51);
  // u_9337: sky130_fd_sc_hd__or3_2
  assign net_196 = (net_12) | (net_232) | (net_62);
  // u_9127: sky130_fd_sc_hd__nand2_2
  assign net_467 = (!net_12) | (!net_145);
  // u_7766: sky130_fd_sc_hd__or2_2
  assign net_327 = (net_62) | (net_128);
  // u_6968: sky130_fd_sc_hd__a211o_2
  assign net_250 = (net_50&net_42) | (net_91) | (net_12);
  // u_9115: sky130_fd_sc_hd__o21ba_2
  assign net_219 = (net_50&!net_170) | (net_42&!net_170);
  // u_9004: sky130_fd_sc_hd__nand2_2
  assign net_216 = (!net_12) | (!net_218);
  // u_8011: sky130_fd_sc_hd__o32a_2
  assign net_329 = (net_12&net_184) | (net_12&net_90) | (net_45&net_184) | (net_31&net_184) | (net_45&net_90) | (net_31&net_90);
  // u_9043: sky130_fd_sc_hd__a21bo_2
  assign net_95 = (net_38&net_51) | (!net_120);
  // u_9342: sky130_fd_sc_hd__or4_2
  assign net_111 = (net_12) | (net_74) | (net_113) | (net_91);
  // u_6963: sky130_fd_sc_hd__o22ai_2
  assign net_256 = (!net_96&!net_312) | (!net_50&!net_39);
  // u_7854: sky130_fd_sc_hd__or2_2
  assign net_446 = (net_312) | (net_232);
  // u_6981: sky130_fd_sc_hd__xnor2_2
  assign net_507 = (!net_416&!net_398) | (net_416&net_398);
  // u_6983: sky130_fd_sc_hd__xor2_2
  assign net_400 = (net_416&!net_398) | (!net_416&net_398);
  // u_7435: sky130_fd_sc_hd__nor2_2
  assign net_462 = (!net_416&!net_398);
  // u_7379: sky130_fd_sc_hd__a211o_2
  assign net_325 = (net_12&net_22) | (net_305) | (net_74);
  // u_7404: sky130_fd_sc_hd__and3_2
  assign net_406 = (net_74&net_29&net_562);
  // u_7832: sky130_fd_sc_hd__o32a_2
  assign net_418 = (net_12&net_134) | (net_12&net_184) | (net_45&net_134) | (net_402&net_134) | (net_45&net_184) | (net_402&net_184);
  // u_7767: sky130_fd_sc_hd__a21oi_2
  assign net_316 = (!net_203&!net_74) | (!net_94&!net_74);
  // u_9046: sky130_fd_sc_hd__a32o_2
  assign net_119 = (net_12&net_106&net_4) | (net_18&net_120);
  // u_9358: sky130_fd_sc_hd__o221a_2
  assign net_79 = (net_78&net_76&net_74) | (net_77&net_76&net_74) | (net_78&net_12&net_74) | (net_77&net_12&net_74);
  // u_9357: sky130_fd_sc_hd__mux2_1
  assign net_44 = (net_30&!net_12) | (net_60&net_12);
  // u_6947: sky130_fd_sc_hd__o211a_2
  assign net_239 = (net_203&net_74&net_196) | (net_14&net_74&net_196);
  // u_7823: sky130_fd_sc_hd__mux2_1
  assign net_328 = (net_327&!net_12) | (net_313&net_12);
  // u_8044: sky130_fd_sc_hd__a21bo_2
  assign net_374 = (net_12&net_170) | (!net_250);
  // u_7852: sky130_fd_sc_hd__a21oi_2
  assign net_447 = (!net_312&!net_12) | (!net_219&!net_12);
  // u_6948: sky130_fd_sc_hd__o311a_2
  assign net_264 = (net_202&net_74&net_216) | (net_12&net_74&net_216) | (net_45&net_74&net_216);
  // u_7764: sky130_fd_sc_hd__o21ai_2
  assign net_549 = (!net_312&!net_329) | (!net_111);
  // u_7820: sky130_fd_sc_hd__a31o_2
  assign net_404 = (net_312&net_95&net_467) | (net_400);
  // u_7400: sky130_fd_sc_hd__nor2_2
  assign net_417 = (!net_462&!net_208);
  // u_7914: sky130_fd_sc_hd__a211o_2
  assign net_509 = (net_312&net_119) | (net_79) | (net_507);
  // u_7819: sky130_fd_sc_hd__mux2_1
  assign net_466 = (net_418&!net_312) | (net_44&net_312);
  // u_6984: sky130_fd_sc_hd__or3_2
  assign net_403 = (net_507) | (net_239) | (net_316);
  // u_7825: sky130_fd_sc_hd__o211ai_2
  assign net_355 = (!net_312&!net_328) | (!net_325) | (!net_400);
  // u_7768: sky130_fd_sc_hd__a21o_2
  assign net_419 = (net_312&net_374) | (net_406);
  // u_6979: sky130_fd_sc_hd__a221o_2
  assign net_465 = (net_446&net_447) | (net_12&net_256) | (net_507);
  // u_6978: sky130_fd_sc_hd__o211a_2
  assign net_584 = (net_400&net_509&net_417) | (net_466&net_509&net_417);
  // u_7824: sky130_fd_sc_hd__o211a_2
  assign net_643 = (net_264&net_417&net_403) | (net_404&net_417&net_403);
  // u_7563: sky130_fd_sc_hd__o211a_2
  assign net_497 = (net_400&net_355&net_417) | (net_419&net_355&net_417);
  // u_6987: sky130_fd_sc_hd__o211a_2
  assign net_559 = (net_400&net_465&net_417) | (net_549&net_465&net_417);
  // u_2707: sky130_fd_sc_hd__and4b_2
  assign net_1131 = (!net_584&net_559&net_643&net_497);

  assign net_1131_value = net_1131;  // net_1131
endmodule
