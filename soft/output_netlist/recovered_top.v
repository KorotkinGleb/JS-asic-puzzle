// Complete flat structural netlist recovered from the GDS.
// The design body contains only wires and module instances.
module recovered_top (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire net_806,  // unlabeled extracted input
    output wire success,
    output wire [7:0] O,
    output wire [11:0] shift_register,  // recovered current state
    output wire [3:0] register_02,  // recovered current state
    output wire [3:0] register_03,  // recovered current state
    output wire [3:0] register_04,  // recovered current state
    output wire [1:0] register_05,  // recovered current state
    output wire [2:0] register_06,  // recovered current state
    output wire [7:0] register_07,  // recovered current state
    output wire [5:0] register_08,  // recovered current state
    output wire [2:0] register_09,  // recovered current state
    output wire [7:0] register_10,  // recovered current state
    output wire [7:0] register_11,  // recovered current state
    output wire [7:0] register_12,  // recovered current state
    output wire [5:0] register_13,  // recovered current state
    output wire [5:0] register_14,  // recovered current state
    output wire [7:0] register_15,  // recovered current state
    output wire register_16,  // recovered current state
    output wire register_17  // recovered current state
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
  wire net_102;
  wire net_104;
  wire net_105;
  wire net_106;
  wire net_107;
  wire net_108;
  wire net_111;
  wire net_113;
  wire net_119;
  wire net_120;
  wire net_126;
  wire net_127;
  wire net_128;
  wire net_134;
  wire net_135;
  wire net_136;
  wire net_138;
  wire net_141;
  wire net_145;
  wire net_160;
  wire net_161;
  wire net_163;
  wire net_164;
  wire net_165;
  wire net_168;
  wire net_170;
  wire net_172;
  wire net_178;
  wire net_181;
  wire net_184;
  wire net_185;
  wire net_192;
  wire net_193;
  wire net_194;
  wire net_195;
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
  wire net_263;
  wire net_264;
  wire net_265;
  wire net_272;
  wire net_274;
  wire net_275;
  wire net_277;
  wire net_279;
  wire net_280;
  wire net_282;
  wire net_297;
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
  wire net_340;
  wire net_341;
  wire net_347;
  wire net_349;
  wire net_350;
  wire net_352;
  wire net_354;
  wire net_355;
  wire net_367;
  wire net_370;
  wire net_374;
  wire net_384;
  wire net_386;
  wire net_393;
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
  wire net_430;
  wire net_440;
  wire net_442;
  wire net_443;
  wire net_446;
  wire net_447;
  wire net_457;
  wire net_458;
  wire net_459;
  wire net_462;
  wire net_463;
  wire net_465;
  wire net_466;
  wire net_467;
  wire net_477;
  wire net_478;
  wire net_480;
  wire net_488;
  wire net_491;
  wire net_497;
  wire net_501;
  wire net_502;
  wire net_507;
  wire net_509;
  wire net_519;
  wire net_521;
  wire net_522;
  wire net_533;
  wire net_537;
  wire net_548;
  wire net_549;
  wire net_555;
  wire net_559;
  wire net_562;
  wire net_571;
  wire net_573;
  wire net_578;
  wire net_581;
  wire net_583;
  wire net_584;
  wire net_586;
  wire net_604;
  wire net_627;
  wire net_635;
  wire net_637;
  wire net_638;
  wire net_640;
  wire net_643;
  wire net_646;
  wire net_655;
  wire net_656;
  wire net_660;
  wire net_661;
  wire net_663;
  wire net_669;
  wire net_673;
  wire net_674;
  wire net_676;
  wire net_677;
  wire net_678;
  wire net_684;
  wire net_699;
  wire net_700;
  wire net_734;
  wire net_752;
  wire net_764;
  wire net_765;
  wire net_766;
  wire net_767;
  wire net_768;
  wire net_770;
  wire net_771;
  wire net_776;
  wire net_779;
  wire net_783;
  wire net_785;
  wire net_786;
  wire net_787;
  wire net_789;
  wire net_790;
  wire net_801;
  wire net_802;
  wire net_803;
  wire net_805;
  wire net_808;
  wire net_820;
  wire net_821;
  wire net_827;
  wire net_831;
  wire net_838;
  wire net_840;
  wire net_846;
  wire net_855;
  wire net_857;
  wire net_873;
  wire net_874;
  wire net_876;
  wire net_878;
  wire net_879;
  wire net_882;
  wire net_892;
  wire net_897;
  wire net_898;
  wire net_907;
  wire net_908;
  wire net_918;
  wire net_921;
  wire net_927;
  wire net_928;
  wire net_929;
  wire net_930;
  wire net_938;
  wire net_939;
  wire net_941;
  wire net_949;
  wire net_951;
  wire net_956;
  wire net_968;
  wire net_970;
  wire net_972;
  wire net_976;
  wire net_978;
  wire net_979;
  wire net_984;
  wire net_1002;
  wire net_1004;
  wire net_1005;
  wire net_1007;
  wire net_1011;
  wire net_1013;
  wire net_1015;
  wire net_1029;
  wire net_1039;
  wire net_1040;
  wire net_1041;
  wire net_1042;
  wire net_1059;
  wire net_1078;
  wire net_1079;
  wire net_1080;
  wire net_1082;
  wire net_1083;
  wire net_1108;
  wire net_1109;
  wire net_1117;
  wire net_1124;
  wire net_1131;
  wire net_1132;
  wire net_1133;
  wire net_1135;
  wire net_1136;
  wire net_1155;
  wire net_1163;
  wire net_1166;
  wire net_1173;
  wire net_1174;
  wire net_1175;
  wire net_1176;
  wire net_1177;
  wire net_1179;
  wire net_1189;
  wire net_1190;
  wire net_1191;
  wire net_1196;
  wire net_1198;
  wire net_1199;
  wire net_1200;
  wire net_1206;
  wire net_1214;
  wire net_1220;
  wire net_1221;
  wire net_1223;
  wire net_1230;
  wire net_1231;
  wire net_1232;
  wire net_1235;
  wire net_1250;
  wire net_1257;
  wire net_1268;
  wire net_1279;
  wire net_1293;
  wire net_1303;
  wire net_1307;
  wire net_1315;
  wire net_1322;
  wire net_1323;
  wire net_1331;
  wire net_1351;
  wire net_1354;
  wire net_1361;
  wire net_1368;
  wire net_1370;
  wire net_1372;
  wire net_1373;
  wire net_1374;
  wire net_1380;
  wire net_1391;
  wire net_1394;
  wire net_1412;
  wire net_1418;
  wire net_1420;
  wire net_1426;
  wire net_1427;
  wire net_1429;
  wire net_1431;
  wire net_1436;
  wire net_1448;
  wire net_1453;
  wire net_1454;
  wire net_1456;
  wire net_1464;
  wire net_1466;
  wire net_1474;
  wire net_1497;
  wire net_1500;
  wire net_1501;
  wire net_1502;
  wire net_1504;
  wire net_1505;
  wire net_1506;
  wire net_1507;
  wire net_1509;
  wire net_1510;
  wire net_1514;
  wire net_1522;
  wire net_1523;
  wire net_1535;
  wire net_1538;
  wire net_1539;
  wire net_1541;
  wire net_1542;
  wire net_1543;
  wire net_1544;
  wire net_1554;
  wire net_1568;
  wire net_1573;
  wire net_1584;
  wire net_1597;
  wire net_1610;
  wire net_1611;
  wire net_1612;
  wire net_1613;
  wire net_1618;
  wire net_1621;
  wire net_1625;
  wire net_1626;
  wire net_1627;
  wire net_1629;
  wire net_1630;
  wire net_1631;
  wire net_1633;
  wire net_1634;
  wire net_1635;
  wire net_1644;
  wire net_1645;
  wire net_1646;
  wire net_1648;
  wire net_1649;
  wire net_1650;
  wire net_1653;
  wire net_1654;
  wire net_1658;
  wire net_1659;
  wire net_1669;
  wire net_1670;
  wire net_1671;
  wire net_1673;
  wire net_1677;
  wire net_1683;
  wire net_1684;
  wire net_1695;
  wire net_1697;
  wire net_1700;
  wire net_1707;
  wire net_1713;
  wire net_1714;
  wire net_1725;
  wire net_1726;
  wire net_1730;
  wire net_1731;
  wire net_1732;
  wire net_1752;
  wire net_1759;
  wire net_1760;
  wire net_1764;
  wire net_1767;
  wire net_1781;
  wire net_1782;
  wire net_1783;
  wire net_1786;
  wire net_1787;
  wire net_1788;
  wire net_1789;
  wire net_1796;
  wire net_1800;
  wire net_1808;
  wire net_1814;
  wire net_1817;
  wire net_1820;
  wire net_1842;
  wire net_1844;
  wire net_1846;
  wire net_1848;
  wire net_1849;
  wire net_1850;
  wire net_1851;
  wire net_1862;
  wire net_1876;
  wire net_1878;
  wire net_1879;
  wire net_1880;
  wire net_1882;
  wire net_1894;
  wire net_1911;
  wire net_1912;
  wire net_1913;
  wire net_1915;
  wire net_1917;
  wire net_1919;
  wire net_1927;
  wire net_1947;
  wire net_1958;
  wire net_1970;
  wire net_1971;
  wire net_1972;
  wire net_1978;
  wire net_1997;
  wire net_2007;
  wire net_2008;
  wire net_2010;
  wire net_2011;
  wire net_2015;
  wire net_2016;
  wire net_2055;
  wire net_2057;
  wire net_2058;
  wire net_2059;
  wire net_2061;
  wire net_2063;
  wire net_2070;
  wire net_2072;
  wire net_2073;
  wire net_2074;
  wire net_2075;
  wire net_2082;
  wire net_2084;
  wire net_2085;
  wire net_2087;
  wire net_2090;
  wire net_2097;
  wire net_2098;
  wire net_2109;
  wire net_2110;
  wire net_2112;
  wire net_2117;
  wire net_2118;
  wire net_2129;
  wire net_2132;
  wire net_2138;
  wire net_2140;
  wire net_2141;
  wire net_2143;
  wire net_2145;
  wire net_2154;
  wire net_2160;
  wire net_2165;
  wire net_2166;
  wire net_2167;
  wire net_2168;
  wire net_2169;
  wire net_2172;
  wire net_2184;
  wire net_2185;
  wire net_2187;
  wire net_2189;
  wire net_2190;
  wire net_2191;
  wire net_2193;
  wire net_2194;
  wire net_2215;
  wire net_2216;
  wire net_2218;
  wire net_2219;
  wire net_2229;
  wire net_2232;
  wire net_2235;
  wire net_2236;
  wire net_2240;
  wire net_2242;
  wire net_2243;
  wire net_2245;
  wire net_2261;
  wire net_2274;
  wire net_2275;
  wire net_2277;
  wire net_2280;
  wire net_2301;
  wire net_2302;
  wire net_2307;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2330;
  wire net_2332;
  wire net_2344;
  wire net_2345;
  wire net_2354;
  wire net_2355;
  wire net_2356;
  wire net_2359;
  wire net_2361;
  wire net_2363;
  wire net_2377;
  wire net_2388;
  wire net_2401;
  wire net_2411;
  wire net_2418;
  wire net_2419;
  wire net_2438;
  wire net_2440;
  wire net_2441;
  wire net_2464;
  wire net_2477;
  wire net_2478;
  wire net_2479;
  wire net_2483;
  wire net_2487;
  wire net_2489;
  wire net_2490;
  wire net_2501;
  wire net_2510;
  wire net_2520;
  wire net_2522;
  wire net_2530;
  wire net_2531;
  wire net_2533;
  wire net_2542;
  wire net_2543;
  wire net_2554;
  wire net_2557;
  wire net_2564;
  wire net_2582;
  wire net_2583;
  wire net_2584;
  wire net_2611;
  wire net_2612;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__a211oi_2 u_67 (
      .A1(register_02[1]),
      .A2(register_02[2]),
      .B1(register_02[0]),
      .C1(register_02[3]),
      .Y(net_1136)
  );

  sky130_fd_sc_hd__xnor2_2 u_202 (
      .A(register_02[2]),
      .B(register_02[1]),
      .Y(net_2359)
  );

  sky130_fd_sc_hd__xor2_2 u_240 (
      .A(register_12[1]),
      .B(register_12[0]),
      .X(net_1947)
  );

  sky130_fd_sc_hd__nand4_2 u_353 (
      .A(register_02[3]),
      .B(register_02[0]),
      .C(register_02[2]),
      .D(register_02[1]),
      .Y(net_2302)
  );

  sky130_fd_sc_hd__inv_2 u_385 (
      .A(register_09[2]),
      .Y(net_2356)
  );

  sky130_fd_sc_hd__or2_2 u_395 (
      .A(register_16),
      .B(register_09[0]),
      .X(net_2564)
  );

  sky130_fd_sc_hd__nand2b_2 u_406 (
      .A_N(register_09[0]),
      .B(register_16),
      .Y(net_2520)
  );

  sky130_fd_sc_hd__nand3_2 u_494 (
      .A(register_02[0]),
      .B(register_02[2]),
      .C(register_02[1]),
      .Y(net_2316)
  );

  sky130_fd_sc_hd__a21o_2 u_500 (
      .A1(register_02[2]),
      .A2(register_02[1]),
      .B1(register_02[0]),
      .X(net_2330)
  );

  sky130_fd_sc_hd__inv_2 u_624 (
      .A(register_02[3]),
      .Y(net_2311)
  );

  sky130_fd_sc_hd__and4bb_2 u_1246 (
      .A_N(register_03[2]),
      .B_N(register_03[1]),
      .C(register_03[0]),
      .D(register_03[3]),
      .X(net_2419)
  );

  sky130_fd_sc_hd__and4b_2 u_1248 (
      .A_N(register_03[1]),
      .B(register_03[0]),
      .C(register_03[2]),
      .D(register_03[3]),
      .X(net_2418)
  );

  sky130_fd_sc_hd__and2b_2 u_1262 (
      .A_N(register_13[0]),
      .B(register_13[3]),
      .X(net_1505)
  );

  sky130_fd_sc_hd__and4bb_2 u_1323 (
      .A_N(register_03[2]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[3]),
      .X(net_2612)
  );

  sky130_fd_sc_hd__and4bb_2 u_1370 (
      .A_N(register_03[3]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[2]),
      .X(net_2533)
  );

  sky130_fd_sc_hd__and2b_2 u_1376 (
      .A_N(register_14[2]),
      .B(register_14[3]),
      .X(net_1509)
  );

  sky130_fd_sc_hd__inv_2 u_1425 (
      .A(register_13[2]),
      .Y(net_2490)
  );

  sky130_fd_sc_hd__or4b_2 u_1451 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[0]),
      .D_N(register_03[1]),
      .X(net_2478)
  );

  sky130_fd_sc_hd__and2b_2 u_1591 (
      .A_N(register_13[1]),
      .B(register_13[5]),
      .X(net_1501)
  );

  sky130_fd_sc_hd__and2b_2 u_1630 (
      .A_N(register_14[1]),
      .B(register_14[5]),
      .X(net_1507)
  );

  sky130_fd_sc_hd__or4b_2 u_1770 (
      .A(register_03[2]),
      .B(register_03[1]),
      .C(register_03[0]),
      .D_N(register_03[3]),
      .X(net_2074)
  );

  sky130_fd_sc_hd__and2b_2 u_1775 (
      .A_N(register_14[0]),
      .B(register_14[4]),
      .X(net_1510)
  );

  sky130_fd_sc_hd__and4bb_2 u_1788 (
      .A_N(register_03[1]),
      .B_N(register_03[0]),
      .C(register_03[2]),
      .D(register_03[3]),
      .X(net_2185)
  );

  sky130_fd_sc_hd__or4b_2 u_1803 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[1]),
      .D_N(register_03[0]),
      .X(net_2229)
  );

  sky130_fd_sc_hd__and4bb_2 u_1807 (
      .A_N(register_03[3]),
      .B_N(register_03[1]),
      .C(register_03[0]),
      .D(register_03[2]),
      .X(net_2277)
  );

  sky130_fd_sc_hd__inv_2 u_1968 (
      .A(register_15[4]),
      .Y(net_2261)
  );

  sky130_fd_sc_hd__inv_2 u_2012 (
      .A(register_15[6]),
      .Y(net_2129)
  );

  sky130_fd_sc_hd__inv_2 u_2013 (
      .A(register_15[2]),
      .Y(net_2008)
  );

  sky130_fd_sc_hd__and2b_2 u_2107 (
      .A_N(register_15[3]),
      .B(register_15[5]),
      .X(net_1541)
  );

  sky130_fd_sc_hd__and2b_2 u_2364 (
      .A_N(register_05[0]),
      .B(register_05[1]),
      .X(net_1542)
  );

  sky130_fd_sc_hd__nor4_2 u_2365 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[1]),
      .D(register_03[0]),
      .Y(net_1876)
  );

  sky130_fd_sc_hd__or4b_2 u_2396 (
      .A(register_03[3]),
      .B(register_03[1]),
      .C(register_03[0]),
      .D_N(register_03[2]),
      .X(net_1972)
  );

  sky130_fd_sc_hd__and2b_2 u_2555 (
      .A_N(register_08[2]),
      .B(register_08[0]),
      .X(net_163)
  );

  sky130_fd_sc_hd__and2b_2 u_2571 (
      .A_N(register_08[3]),
      .B(register_08[1]),
      .X(net_161)
  );

  sky130_fd_sc_hd__inv_2 u_2711 (
      .A(register_08[4]),
      .Y(net_1163)
  );

  sky130_fd_sc_hd__and2b_2 u_2843 (
      .A_N(register_10[0]),
      .B(register_10[4]),
      .X(net_104)
  );

  sky130_fd_sc_hd__inv_2 u_2928 (
      .A(register_02[1]),
      .Y(net_1429)
  );

  sky130_fd_sc_hd__o21ai_2 u_2935 (
      .A1(register_02[2]),
      .A2(register_02[0]),
      .B1(register_02[3]),
      .Y(net_1268)
  );

  sky130_fd_sc_hd__inv_2 u_2937 (
      .A(register_02[3]),
      .Y(net_1370)
  );

  sky130_fd_sc_hd__nand2b_2 u_2938 (
      .A_N(register_02[1]),
      .B(register_02[2]),
      .Y(net_1179)
  );

  sky130_fd_sc_hd__and3_2 u_2950 (
      .A(register_02[1]),
      .B(register_02[2]),
      .C(register_02[0]),
      .X(net_1820)
  );

  sky130_fd_sc_hd__nor3b_2 u_2953 (
      .A(register_02[1]),
      .B(register_02[0]),
      .C_N(register_02[2]),
      .Y(net_1373)
  );

  sky130_fd_sc_hd__xor2_2 u_2967 (
      .A(register_12[1]),
      .B(register_12[7]),
      .X(net_1732)
  );

  sky130_fd_sc_hd__xor2_2 u_3167 (
      .A(register_12[6]),
      .B(register_12[3]),
      .X(net_1683)
  );

  sky130_fd_sc_hd__xnor2_2 u_3282 (
      .A(register_12[4]),
      .B(register_12[5]),
      .Y(net_1726)
  );

  sky130_fd_sc_hd__or3b_2 u_3287 (
      .A(register_02[1]),
      .B(register_02[0]),
      .C_N(register_02[2]),
      .X(net_1700)
  );

  sky130_fd_sc_hd__xnor2_2 u_3289 (
      .A(register_12[3]),
      .B(register_12[1]),
      .Y(net_1814)
  );

  sky130_fd_sc_hd__xnor2_2 u_3295 (
      .A(register_12[5]),
      .B(register_12[7]),
      .Y(net_1817)
  );

  sky130_fd_sc_hd__xor2_2 u_3296 (
      .A(register_12[4]),
      .B(register_12[0]),
      .X(net_1978)
  );

  sky130_fd_sc_hd__nand2b_2 u_3478 (
      .A_N(register_02[2]),
      .B(register_02[1]),
      .Y(net_1878)
  );

  sky130_fd_sc_hd__and2b_2 u_3484 (
      .A_N(register_02[1]),
      .B(register_02[2]),
      .X(net_1627)
  );

  sky130_fd_sc_hd__nor2_2 u_3531 (
      .A(register_02[1]),
      .B(register_02[2]),
      .Y(net_1618)
  );

  sky130_fd_sc_hd__nor2_2 u_3533 (
      .A(register_02[0]),
      .B(register_02[3]),
      .Y(net_1786)
  );

  sky130_fd_sc_hd__nand2_2 u_3576 (
      .A(register_02[2]),
      .B(register_02[3]),
      .Y(net_1669)
  );

  sky130_fd_sc_hd__inv_2 u_3669 (
      .A(register_02[3]),
      .Y(net_1644)
  );

  sky130_fd_sc_hd__nand2_2 u_3701 (
      .A(register_02[1]),
      .B(register_02[2]),
      .Y(net_1648)
  );

  sky130_fd_sc_hd__or2_2 u_3715 (
      .A(register_02[2]),
      .B(register_02[0]),
      .X(net_1629)
  );

  sky130_fd_sc_hd__and2b_2 u_3852 (
      .A_N(register_02[2]),
      .B(register_02[1]),
      .X(net_1374)
  );

  sky130_fd_sc_hd__nor2_2 u_3873 (
      .A(register_02[1]),
      .B(register_02[2]),
      .Y(net_1522)
  );

  sky130_fd_sc_hd__and3_2 u_3900 (
      .A(register_02[1]),
      .B(register_02[2]),
      .C(register_02[0]),
      .X(net_1372)
  );

  sky130_fd_sc_hd__a21oi_2 u_3978 (
      .A1(register_02[1]),
      .A2(register_02[3]),
      .B1(register_02[0]),
      .Y(net_1199)
  );

  sky130_fd_sc_hd__mux2_1 u_3980 (
      .A0(register_02[2]),
      .A1(register_02[3]),
      .S(register_02[0]),
      .X(net_1175)
  );

  sky130_fd_sc_hd__and3b_2 u_4002 (
      .A_N(register_02[3]),
      .B(register_02[0]),
      .C(register_02[2]),
      .X(net_1231)
  );

  sky130_fd_sc_hd__and2b_2 u_4023 (
      .A_N(register_02[2]),
      .B(register_02[1]),
      .X(net_1177)
  );

  sky130_fd_sc_hd__or2_2 u_4052 (
      .A(register_02[0]),
      .B(register_02[3]),
      .X(net_1176)
  );

  sky130_fd_sc_hd__and2b_2 u_4070 (
      .A_N(register_02[0]),
      .B(register_02[2]),
      .X(net_1431)
  );

  sky130_fd_sc_hd__and4bb_2 u_4705 (
      .A_N(register_03[2]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[3]),
      .X(net_873)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__inv_2 u_5532 (
      .A(register_17),
      .Y(net_1361)
  );

  sky130_fd_sc_hd__or3_2 u_5612 (
      .A(register_07[3]),
      .B(register_07[0]),
      .C(register_07[4]),
      .X(net_480)
  );

  sky130_fd_sc_hd__nand2_2 u_5628 (
      .A(register_07[6]),
      .B(register_07[5]),
      .Y(net_341)
  );

  sky130_fd_sc_hd__inv_2 u_5636 (
      .A(register_06[0]),
      .Y(net_929)
  );

  sky130_fd_sc_hd__or4bb_2 u_5680 (
      .A(register_03[2]),
      .B(register_03[0]),
      .C_N(register_03[1]),
      .D_N(register_03[3]),
      .X(net_1002)
  );

  sky130_fd_sc_hd__or4_2 u_5681 (
      .A(register_03[2]),
      .B(register_03[3]),
      .C(register_03[0]),
      .D(register_03[1]),
      .X(net_1029)
  );

  sky130_fd_sc_hd__or2_2 u_5684 (
      .A(register_06[2]),
      .B(I),
      .X(net_976)
  );

  sky130_fd_sc_hd__nand2_2 u_5711 (
      .A(register_06[2]),
      .B(I),
      .Y(net_930)
  );

  sky130_fd_sc_hd__inv_2 u_5836 (
      .A(register_06[1]),
      .Y(net_855)
  );

  sky130_fd_sc_hd__and2_2 u_6032 (
      .A(register_07[6]),
      .B(register_07[5]),
      .X(net_457)
  );

  sky130_fd_sc_hd__and2b_2 u_6094 (
      .A_N(register_07[2]),
      .B(register_07[3]),
      .X(net_488)
  );

  sky130_fd_sc_hd__and4bb_2 u_6194 (
      .A_N(register_07[1]),
      .B_N(register_07[4]),
      .C(register_07[7]),
      .D(register_07[0]),
      .X(net_537)
  );

  sky130_fd_sc_hd__and3_2 u_6350 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[0]),
      .X(net_478)
  );

  sky130_fd_sc_hd__nand3b_2 u_6472 (
      .A_N(register_04[1]),
      .B(register_04[0]),
      .C(register_04[3]),
      .Y(net_820)
  );

  sky130_fd_sc_hd__xor2_2 u_6950 (
      .A(register_04[2]),
      .B(register_04[1]),
      .X(net_236)
  );

  sky130_fd_sc_hd__nand2_2 u_6956 (
      .A(register_04[2]),
      .B(register_04[1]),
      .Y(net_350)
  );

  sky130_fd_sc_hd__nand2b_2 u_6969 (
      .A_N(register_02[1]),
      .B(register_02[0]),
      .Y(net_783)
  );

  sky130_fd_sc_hd__nand2_2 u_6970 (
      .A(register_02[0]),
      .B(register_02[3]),
      .Y(net_951)
  );

  sky130_fd_sc_hd__nor2_2 u_6971 (
      .A(register_02[2]),
      .B(register_02[3]),
      .Y(net_1040)
  );

  sky130_fd_sc_hd__and4b_2 u_6973 (
      .A_N(register_02[3]),
      .B(register_02[0]),
      .C(register_02[2]),
      .D(register_02[1]),
      .X(net_1083)
  );

  sky130_fd_sc_hd__and2b_2 u_6975 (
      .A_N(register_02[2]),
      .B(register_02[0]),
      .X(net_752)
  );

  sky130_fd_sc_hd__nor4b_2 u_6990 (
      .A(register_02[1]),
      .B(register_02[2]),
      .C(register_02[0]),
      .D_N(register_02[3]),
      .Y(net_1041)
  );

  sky130_fd_sc_hd__nand2b_2 u_6995 (
      .A_N(register_02[0]),
      .B(register_02[3]),
      .Y(net_785)
  );

  sky130_fd_sc_hd__a21oi_2 u_7057 (
      .A1(register_02[1]),
      .A2(register_02[2]),
      .B1(register_02[3]),
      .Y(net_1082)
  );

  sky130_fd_sc_hd__nand2b_2 u_7104 (
      .A_N(register_02[3]),
      .B(register_02[0]),
      .Y(net_808)
  );

  sky130_fd_sc_hd__a21oi_2 u_7153 (
      .A1(register_02[1]),
      .A2(register_02[2]),
      .B1(register_02[3]),
      .Y(net_803)
  );

  sky130_fd_sc_hd__nand2_2 u_7169 (
      .A(register_02[1]),
      .B(register_02[2]),
      .Y(net_898)
  );

  sky130_fd_sc_hd__and4bb_2 u_7216 (
      .A_N(register_02[0]),
      .B_N(register_02[3]),
      .C(register_02[1]),
      .D(register_02[2]),
      .X(net_1117)
  );

  sky130_fd_sc_hd__nor3_2 u_7238 (
      .A(register_02[1]),
      .B(register_02[2]),
      .C(register_02[0]),
      .Y(net_1080)
  );

  sky130_fd_sc_hd__and2b_2 u_7287 (
      .A_N(register_02[0]),
      .B(register_02[1]),
      .X(net_790)
  );

  sky130_fd_sc_hd__nand2b_2 u_7301 (
      .A_N(register_02[0]),
      .B(register_02[1]),
      .Y(net_764)
  );

  sky130_fd_sc_hd__and2_2 u_7317 (
      .A(register_02[1]),
      .B(register_02[2]),
      .X(net_770)
  );

  sky130_fd_sc_hd__nor2_2 u_7335 (
      .A(register_02[1]),
      .B(register_02[2]),
      .Y(net_805)
  );

  sky130_fd_sc_hd__nand2_2 u_7465 (
      .A(register_04[3]),
      .B(register_04[1]),
      .Y(net_302)
  );

  sky130_fd_sc_hd__a21oi_2 u_7548 (
      .A1(register_04[3]),
      .A2(register_04[0]),
      .B1(register_04[1]),
      .Y(net_324)
  );

  sky130_fd_sc_hd__xnor2_2 u_7566 (
      .A(register_04[3]),
      .B(register_04[0]),
      .Y(net_349)
  );

  sky130_fd_sc_hd__inv_2 u_8106 (
      .A(register_11[1]),
      .Y(net_699)
  );

  sky130_fd_sc_hd__and2b_2 u_8218 (
      .A_N(register_10[7]),
      .B(register_10[2]),
      .X(net_102)
  );

  sky130_fd_sc_hd__inv_2 u_8290 (
      .A(register_10[5]),
      .Y(net_938)
  );

  sky130_fd_sc_hd__and2b_2 u_8325 (
      .A_N(register_10[6]),
      .B(register_10[3]),
      .X(net_105)
  );

  sky130_fd_sc_hd__and2b_2 u_8408 (
      .A_N(register_11[2]),
      .B(register_11[3]),
      .X(net_194)
  );

  sky130_fd_sc_hd__and2b_2 u_8590 (
      .A_N(register_11[7]),
      .B(register_11[0]),
      .X(net_195)
  );

  sky130_fd_sc_hd__inv_2 u_8660 (
      .A(register_11[6]),
      .Y(net_635)
  );

  sky130_fd_sc_hd__and4bb_2 u_8998 (
      .A_N(register_04[2]),
      .B_N(register_04[3]),
      .C(register_04[1]),
      .D(register_04[0]),
      .X(net_213)
  );

  sky130_fd_sc_hd__o211a_2 u_9343 (
      .A1(register_04[2]),
      .A2(register_04[3]),
      .B1(register_04[1]),
      .C1(register_04[0]),
      .X(net_208)
  );

  sky130_fd_sc_hd__xor2_2 u_9354 (
      .A(register_04[2]),
      .B(register_04[3]),
      .X(net_9)
  );

  sky130_fd_sc_hd__and2_2 u_9470 (
      .A(register_03[2]),
      .B(register_04[2]),
      .X(net_108)
  );

  sky130_fd_sc_hd__nand2_2 u_9608 (
      .A(register_03[2]),
      .B(register_04[2]),
      .Y(net_58)
  );

  sky130_fd_sc_hd__nand2_2 u_9622 (
      .A(register_04[2]),
      .B(register_04[3]),
      .Y(net_204)
  );

  sky130_fd_sc_hd__nor2_2 u_9636 (
      .A(register_03[2]),
      .B(register_04[2]),
      .Y(net_107)
  );

  sky130_fd_sc_hd__nor2_2 u_9637 (
      .A(register_04[3]),
      .B(register_04[1]),
      .Y(net_172)
  );

  sky130_fd_sc_hd__xnor2_2 u_3012 (
      .A(register_12[6]),
      .B(net_1947),
      .Y(net_1635)
  );

  sky130_fd_sc_hd__and2_2 u_198 (
      .A(register_09[0]),
      .B(net_2302),
      .X(net_1911)
  );

  sky130_fd_sc_hd__a21boi_2 u_199 (
      .A1(register_02[1]),
      .A2(net_2302),
      .B1_N(register_09[0]),
      .Y(net_2388)
  );

  sky130_fd_sc_hd__a21boi_2 u_341 (
      .A1(net_2302),
      .A2(net_2359),
      .B1_N(register_09[0]),
      .Y(net_2411)
  );

  sky130_fd_sc_hd__o211a_2 u_608 (
      .A1(register_02[3]),
      .A2(net_2316),
      .B1(net_2330),
      .C1(register_09[0]),
      .X(net_2332)
  );

  sky130_fd_sc_hd__a21boi_2 u_215 (
      .A1(net_2311),
      .A2(net_2316),
      .B1_N(register_09[0]),
      .Y(net_2317)
  );

  sky130_fd_sc_hd__and2_2 u_1560 (
      .A(register_13[4]),
      .B(net_2490),
      .X(net_1502)
  );

  sky130_fd_sc_hd__and2_2 u_1776 (
      .A(register_15[0]),
      .B(net_2261),
      .X(net_1504)
  );

  sky130_fd_sc_hd__and2_2 u_1794 (
      .A(register_15[1]),
      .B(net_2129),
      .X(net_1538)
  );

  sky130_fd_sc_hd__and2_2 u_1982 (
      .A(register_15[7]),
      .B(net_2008),
      .X(net_1543)
  );

  sky130_fd_sc_hd__and2_2 u_2561 (
      .A(register_08[5]),
      .B(net_1163),
      .X(net_160)
  );

  sky130_fd_sc_hd__o211a_2 u_2933 (
      .A1(net_1429),
      .A2(register_02[0]),
      .B1(net_1370),
      .C1(register_02[2]),
      .X(net_1426)
  );

  sky130_fd_sc_hd__xnor2_2 u_2925 (
      .A(register_02[3]),
      .B(net_1820),
      .Y(net_1610)
  );

  sky130_fd_sc_hd__xnor2_2 u_2963 (
      .A(register_12[2]),
      .B(net_1732),
      .Y(net_1731)
  );

  sky130_fd_sc_hd__xnor2_2 u_3278 (
      .A(register_12[2]),
      .B(net_1726),
      .Y(net_1725)
  );

  sky130_fd_sc_hd__xnor2_2 u_3283 (
      .A(net_1726),
      .B(net_1947),
      .Y(net_1912)
  );

  sky130_fd_sc_hd__xnor2_2 u_3017 (
      .A(register_12[2]),
      .B(net_1814),
      .Y(net_1808)
  );

  sky130_fd_sc_hd__xnor2_2 u_2949 (
      .A(net_1814),
      .B(net_1817),
      .Y(net_1612)
  );

  sky130_fd_sc_hd__nand2_2 u_3276 (
      .A(register_02[0]),
      .B(net_1627),
      .Y(net_1625)
  );

  sky130_fd_sc_hd__a22o_2 u_174 (
      .A1(register_02[1]),
      .A2(net_1786),
      .B1(net_1878),
      .B2(register_02[0]),
      .X(net_1917)
  );

  sky130_fd_sc_hd__a211o_2 u_2961 (
      .A1(register_02[1]),
      .A2(register_02[0]),
      .B1(net_1644),
      .C1(net_1627),
      .X(net_1658)
  );

  sky130_fd_sc_hd__nor2_2 u_3685 (
      .A(register_02[1]),
      .B(net_1644),
      .Y(net_1645)
  );

  sky130_fd_sc_hd__and2b_2 u_3816 (
      .A_N(net_1618),
      .B(net_1648),
      .X(net_1630)
  );

  sky130_fd_sc_hd__a22oi_2 u_2968 (
      .A1(register_02[1]),
      .A2(net_1644),
      .B1(net_1629),
      .B2(net_1648),
      .Y(net_1646)
  );

  sky130_fd_sc_hd__xor2_2 u_3015 (
      .A(register_12[0]),
      .B(net_1629),
      .X(net_1759)
  );

  sky130_fd_sc_hd__o31a_2 u_2941 (
      .A1(net_1372),
      .A2(net_1374),
      .A3(net_1373),
      .B1(net_1370),
      .X(net_1380)
  );

  sky130_fd_sc_hd__o21a_2 u_3858 (
      .A1(net_1429),
      .A2(net_1372),
      .B1(net_1370),
      .X(net_1436)
  );

  sky130_fd_sc_hd__nor2_2 u_3976 (
      .A(register_02[3]),
      .B(net_1177),
      .Y(net_1198)
  );

  sky130_fd_sc_hd__and3b_2 u_3984 (
      .A_N(register_02[3]),
      .B(net_1177),
      .C(register_02[0]),
      .X(net_1232)
  );

  sky130_fd_sc_hd__and2b_2 u_2936 (
      .A_N(net_1176),
      .B(net_1179),
      .X(net_1173)
  );

  sky130_fd_sc_hd__a21oi_2 u_3968 (
      .A1(net_1176),
      .A2(net_1177),
      .B1(net_1175),
      .Y(net_1174)
  );

  sky130_fd_sc_hd__nand2_2 u_4127 (
      .A(register_02[1]),
      .B(net_1176),
      .Y(net_1235)
  );

  sky130_fd_sc_hd__a21oi_2 u_2926 (
      .A1(register_02[1]),
      .A2(net_1431),
      .B1(register_02[3]),
      .Y(net_1554)
  );

  sky130_fd_sc_hd__and3_2 u_2932 (
      .A(register_02[1]),
      .B(net_1370),
      .C(net_1431),
      .X(net_1427)
  );

  sky130_fd_sc_hd__a2111oi_2 u_2955 (
      .A1(register_02[1]),
      .A2(register_02[0]),
      .B1(register_02[3]),
      .C1(net_1431),
      .D1(net_1522),
      .Y(net_1523)
  );

  sky130_fd_sc_hd__inv_2 u_5630 (
      .A(net_873),
      .Y(net_907)
  );

  sky130_fd_sc_hd__nand2_2 u_1231 (
      .A(I),
      .B(net_604),
      .Y(net_2280)
  );

  sky130_fd_sc_hd__a31o_2 u_1232 (
      .A1(I),
      .A2(net_604),
      .A3(net_2277),
      .B1(register_14[0]),
      .X(net_2301)
  );

  sky130_fd_sc_hd__a31o_2 u_1234 (
      .A1(I),
      .A2(net_604),
      .A3(net_2419),
      .B1(register_14[1]),
      .X(net_2377)
  );

  sky130_fd_sc_hd__nand2_2 u_1255 (
      .A(I),
      .B(net_604),
      .Y(net_2073)
  );

  sky130_fd_sc_hd__a31o_2 u_1286 (
      .A1(I),
      .A2(net_604),
      .A3(net_2533),
      .B1(register_13[0]),
      .X(net_2554)
  );

  sky130_fd_sc_hd__a31o_2 u_1287 (
      .A1(I),
      .A2(net_604),
      .A3(net_2612),
      .B1(register_13[1]),
      .X(net_2611)
  );

  sky130_fd_sc_hd__nand2_2 u_1362 (
      .A(I),
      .B(net_604),
      .Y(net_2479)
  );

  sky130_fd_sc_hd__nand4_2 u_1364 (
      .A(I),
      .B(net_604),
      .C(register_13[1]),
      .D(net_2612),
      .Y(net_2584)
  );

  sky130_fd_sc_hd__nand4_2 u_1365 (
      .A(I),
      .B(net_604),
      .C(register_13[0]),
      .D(net_2533),
      .Y(net_2530)
  );

  sky130_fd_sc_hd__nand4_2 u_1381 (
      .A(I),
      .B(net_604),
      .C(register_14[2]),
      .D(net_2418),
      .Y(net_2441)
  );

  sky130_fd_sc_hd__a31o_2 u_1635 (
      .A1(I),
      .A2(net_604),
      .A3(net_2418),
      .B1(register_14[2]),
      .X(net_2440)
  );

  sky130_fd_sc_hd__nand4_2 u_1641 (
      .A(I),
      .B(net_604),
      .C(register_14[1]),
      .D(net_2419),
      .Y(net_2344)
  );

  sky130_fd_sc_hd__nand4_2 u_1772 (
      .A(I),
      .B(net_604),
      .C(register_14[0]),
      .D(net_2277),
      .Y(net_2275)
  );

  sky130_fd_sc_hd__nand4_2 u_2034 (
      .A(I),
      .B(net_604),
      .C(register_15[3]),
      .D(net_2185),
      .Y(net_2154)
  );

  sky130_fd_sc_hd__a31o_2 u_2049 (
      .A1(I),
      .A2(net_604),
      .A3(net_2185),
      .B1(register_15[3]),
      .X(net_2184)
  );

  sky130_fd_sc_hd__nand2_2 u_2296 (
      .A(I),
      .B(net_604),
      .Y(net_1196)
  );

  sky130_fd_sc_hd__a31o_2 u_2361 (
      .A1(I),
      .A2(net_604),
      .A3(net_1876),
      .B1(register_05[0]),
      .X(net_1842)
  );

  sky130_fd_sc_hd__nand4_2 u_2369 (
      .A(I),
      .B(net_604),
      .C(register_05[0]),
      .D(net_1876),
      .Y(net_1796)
  );

  sky130_fd_sc_hd__nand2_2 u_2370 (
      .A(I),
      .B(net_604),
      .Y(net_1971)
  );

  sky130_fd_sc_hd__and3_2 u_4660 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(net_604),
      .X(net_1303)
  );

  sky130_fd_sc_hd__a21oi_2 u_4837 (
      .A1(register_03[2]),
      .A2(net_604),
      .B1(register_03[3]),
      .Y(net_1453)
  );

  sky130_fd_sc_hd__xnor2_2 u_4859 (
      .A(register_03[2]),
      .B(net_604),
      .Y(net_1497)
  );

  sky130_fd_sc_hd__a41oi_2 u_4863 (
      .A1(register_03[3]),
      .A2(register_03[2]),
      .A3(register_03[0]),
      .A4(net_604),
      .B1(register_03[1]),
      .Y(net_1535)
  );

  sky130_fd_sc_hd__and4_2 u_4949 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[0]),
      .D(net_604),
      .X(net_1391)
  );

  sky130_fd_sc_hd__mux2_1 u_5007 (
      .A0(shift_register[2]),
      .A1(shift_register[1]),
      .S(net_604),
      .X(net_1597)
  );

  sky130_fd_sc_hd__mux2_1 u_5008 (
      .A0(shift_register[1]),
      .A1(shift_register[0]),
      .S(net_604),
      .X(net_1544)
  );

  sky130_fd_sc_hd__mux2_1 u_5011 (
      .A0(shift_register[3]),
      .A1(shift_register[2]),
      .S(net_604),
      .X(net_1464)
  );

  sky130_fd_sc_hd__mux2_1 u_5205 (
      .A0(shift_register[5]),
      .A1(shift_register[4]),
      .S(net_604),
      .X(net_1279)
  );

  sky130_fd_sc_hd__mux2_1 u_5263 (
      .A0(shift_register[6]),
      .A1(shift_register[5]),
      .S(net_604),
      .X(net_1351)
  );

  sky130_fd_sc_hd__mux2_1 u_5265 (
      .A0(shift_register[7]),
      .A1(shift_register[6]),
      .S(net_604),
      .X(net_1214)
  );

  sky130_fd_sc_hd__mux2_1 u_5340 (
      .A0(shift_register[0]),
      .A1(I),
      .S(net_604),
      .X(net_1584)
  );

  sky130_fd_sc_hd__mux2_1 u_5347 (
      .A0(shift_register[10]),
      .A1(shift_register[9]),
      .S(net_604),
      .X(net_1412)
  );

  sky130_fd_sc_hd__mux2_1 u_5400 (
      .A0(shift_register[11]),
      .A1(shift_register[10]),
      .S(net_604),
      .X(net_1514)
  );

  sky130_fd_sc_hd__mux2_1 u_5403 (
      .A0(shift_register[9]),
      .A1(shift_register[8]),
      .S(net_604),
      .X(net_1315)
  );

  sky130_fd_sc_hd__mux2_1 u_5433 (
      .A0(shift_register[4]),
      .A1(shift_register[3]),
      .S(net_604),
      .X(net_1354)
  );

  sky130_fd_sc_hd__mux2_1 u_5537 (
      .A0(shift_register[8]),
      .A1(shift_register[7]),
      .S(net_604),
      .X(net_1250)
  );

  sky130_fd_sc_hd__inv_2 u_5775 (
      .A(net_604),
      .Y(net_1005)
  );

  sky130_fd_sc_hd__a21oi_2 u_6160 (
      .A1(I),
      .A2(net_604),
      .B1(register_07[3]),
      .Y(net_533)
  );

  sky130_fd_sc_hd__and3_2 u_6166 (
      .A(register_07[3]),
      .B(I),
      .C(net_604),
      .X(net_477)
  );

  sky130_fd_sc_hd__a31o_2 u_6403 (
      .A1(net_873),
      .A2(net_604),
      .A3(register_04[2]),
      .B1(register_04[3]),
      .X(net_918)
  );

  sky130_fd_sc_hd__and4_2 u_6404 (
      .A(net_873),
      .B(net_604),
      .C(register_04[3]),
      .D(register_04[2]),
      .X(net_968)
  );

  sky130_fd_sc_hd__nand2_2 u_6445 (
      .A(net_873),
      .B(net_604),
      .Y(net_879)
  );

  sky130_fd_sc_hd__nand2_2 u_8191 (
      .A(I),
      .B(net_604),
      .Y(net_779)
  );

  sky130_fd_sc_hd__nand2_2 u_8574 (
      .A(I),
      .B(net_604),
      .Y(net_637)
  );

  sky130_fd_sc_hd__nand2_2 u_8576 (
      .A(I),
      .B(net_604),
      .Y(net_674)
  );

  sky130_fd_sc_hd__inv_2 u_247 (
      .A(net_1361),
      .Y(net_2522)
  );

  sky130_fd_sc_hd__nor3_2 u_5616 (
      .A(register_07[5]),
      .B(register_07[7]),
      .C(net_480),
      .Y(net_340)
  );

  sky130_fd_sc_hd__buf_2 u_5789 (
      .A(net_1029),
      .X(net_978)
  );

  sky130_fd_sc_hd__o211a_2 u_5677 (
      .A1(register_06[0]),
      .A2(net_930),
      .B1(net_976),
      .C1(net_604),
      .X(net_1004)
  );

  sky130_fd_sc_hd__mux2_1 u_5683 (
      .A0(net_930),
      .A1(net_976),
      .S(register_06[0]),
      .X(net_882)
  );

  sky130_fd_sc_hd__and3_2 u_6092 (
      .A(net_537),
      .B(net_488),
      .C(net_457),
      .X(net_581)
  );

  sky130_fd_sc_hd__and3_2 u_6441 (
      .A(net_873),
      .B(net_604),
      .C(net_820),
      .X(net_876)
  );

  sky130_fd_sc_hd__nor2_2 u_6609 (
      .A(register_04[2]),
      .B(net_820),
      .Y(net_821)
  );

  sky130_fd_sc_hd__nand2_2 u_6953 (
      .A(register_04[0]),
      .B(net_236),
      .Y(net_235)
  );

  sky130_fd_sc_hd__xor2_2 u_7567 (
      .A(register_04[0]),
      .B(net_236),
      .X(net_326)
  );

  sky130_fd_sc_hd__and2_2 u_7311 (
      .A(register_02[2]),
      .B(net_783),
      .X(net_786)
  );

  sky130_fd_sc_hd__a211o_2 u_63 (
      .A1(register_02[2]),
      .A2(net_1136),
      .B1(net_1041),
      .C1(net_1083),
      .X(net_1135)
  );

  sky130_fd_sc_hd__a21o_2 u_7237 (
      .A1(register_02[1]),
      .A2(net_1040),
      .B1(net_1041),
      .X(net_1042)
  );

  sky130_fd_sc_hd__o22a_2 u_6989 (
      .A1(register_02[2]),
      .A2(register_02[0]),
      .B1(net_1082),
      .B2(net_1083),
      .X(net_1079)
  );

  sky130_fd_sc_hd__or3_2 u_7006 (
      .A(net_1082),
      .B(net_1083),
      .C(net_1041),
      .X(net_1124)
  );

  sky130_fd_sc_hd__a31oi_2 u_6991 (
      .A1(net_806),
      .A2(net_785),
      .A3(net_808),
      .B1(net_803),
      .Y(net_766)
  );

  sky130_fd_sc_hd__nor2_2 u_7230 (
      .A(register_02[3]),
      .B(net_898),
      .Y(net_984)
  );

  sky130_fd_sc_hd__and2_2 u_7252 (
      .A(net_898),
      .B(net_951),
      .X(net_956)
  );

  sky130_fd_sc_hd__a31o_2 u_7259 (
      .A1(register_02[1]),
      .A2(register_02[0]),
      .A3(net_1040),
      .B1(net_1080),
      .X(net_1078)
  );

  sky130_fd_sc_hd__a311o_2 u_7091 (
      .A1(net_806),
      .A2(net_785),
      .A3(net_808),
      .B1(net_790),
      .C1(net_803),
      .X(net_771)
  );

  sky130_fd_sc_hd__a21o_2 u_7291 (
      .A1(net_783),
      .A2(net_764),
      .B1(register_02[2]),
      .X(net_801)
  );

  sky130_fd_sc_hd__o22a_2 u_6974 (
      .A1(register_02[3]),
      .A2(net_898),
      .B1(net_951),
      .B2(net_805),
      .X(net_949)
  );

  sky130_fd_sc_hd__nor3_2 u_6976 (
      .A(register_02[0]),
      .B(net_805),
      .C(net_770),
      .Y(net_765)
  );

  sky130_fd_sc_hd__and3b_2 u_7314 (
      .A_N(net_805),
      .B(net_783),
      .C(net_803),
      .X(net_802)
  );

  sky130_fd_sc_hd__nor2_2 u_7454 (
      .A(net_350),
      .B(net_349),
      .Y(net_275)
  );

  sky130_fd_sc_hd__and2_2 u_8197 (
      .A(register_11[4]),
      .B(net_699),
      .X(net_193)
  );

  sky130_fd_sc_hd__and2_2 u_8367 (
      .A(register_10[1]),
      .B(net_938),
      .X(net_127)
  );

  sky130_fd_sc_hd__and2_2 u_8575 (
      .A(register_11[5]),
      .B(net_635),
      .X(net_168)
  );

  sky130_fd_sc_hd__nand2_2 u_9341 (
      .A(register_03[3]),
      .B(net_9),
      .Y(net_28)
  );

  sky130_fd_sc_hd__xnor2_2 u_9356 (
      .A(register_03[3]),
      .B(net_9),
      .Y(net_71)
  );

  sky130_fd_sc_hd__or2_2 u_9607 (
      .A(net_108),
      .B(net_107),
      .X(net_37)
  );

  sky130_fd_sc_hd__nor2_2 u_9730 (
      .A(net_108),
      .B(net_107),
      .Y(net_40)
  );

  sky130_fd_sc_hd__a21oi_2 u_6955 (
      .A1(register_04[3]),
      .A2(net_236),
      .B1(net_172),
      .Y(net_178)
  );

  sky130_fd_sc_hd__nand2b_2 u_743 (
      .A_N(net_604),
      .B(net_1911),
      .Y(net_2016)
  );

  sky130_fd_sc_hd__or2_2 u_882 (
      .A(net_1911),
      .B(net_604),
      .X(net_1846)
  );

  sky130_fd_sc_hd__nor2_2 u_3483 (
      .A(net_1911),
      .B(net_604),
      .Y(net_1882)
  );

  sky130_fd_sc_hd__and2b_2 u_3518 (
      .A_N(net_604),
      .B(net_1911),
      .X(net_1787)
  );

  sky130_fd_sc_hd__and3_2 u_5230 (
      .A(net_1505),
      .B(net_1502),
      .C(net_1501),
      .X(net_1500)
  );

  sky130_fd_sc_hd__and4_2 u_5225 (
      .A(net_1510),
      .B(net_1504),
      .C(net_1509),
      .D(net_1507),
      .X(net_1506)
  );

  sky130_fd_sc_hd__and4_2 u_5010 (
      .A(net_1543),
      .B(net_1542),
      .C(net_1541),
      .D(net_1538),
      .X(net_1539)
  );

  sky130_fd_sc_hd__and3_2 u_6809 (
      .A(net_163),
      .B(net_160),
      .C(net_161),
      .X(net_192)
  );

  sky130_fd_sc_hd__nand2_2 u_3809 (
      .A(net_1629),
      .B(net_1610),
      .Y(net_1611)
  );

  sky130_fd_sc_hd__or2_2 u_142 (
      .A(register_12[4]),
      .B(net_1808),
      .X(net_1782)
  );

  sky130_fd_sc_hd__nand2_2 u_173 (
      .A(register_12[4]),
      .B(net_1808),
      .Y(net_1788)
  );

  sky130_fd_sc_hd__xor2_2 u_3014 (
      .A(register_12[6]),
      .B(net_1808),
      .X(net_1673)
  );

  sky130_fd_sc_hd__nor3b_2 u_2954 (
      .A(net_604),
      .B(net_1635),
      .C_N(net_1612),
      .Y(net_1634)
  );

  sky130_fd_sc_hd__a21boi_2 u_2956 (
      .A1(I),
      .A2(net_1612),
      .B1_N(net_604),
      .Y(net_1621)
  );

  sky130_fd_sc_hd__nor2_2 u_3821 (
      .A(net_604),
      .B(net_1612),
      .Y(net_1613)
  );

  sky130_fd_sc_hd__inv_2 u_3708 (
      .A(net_1625),
      .Y(net_1650)
  );

  sky130_fd_sc_hd__xnor2_2 u_3297 (
      .A(register_12[2]),
      .B(net_1917),
      .Y(net_1919)
  );

  sky130_fd_sc_hd__or3_2 u_3315 (
      .A(net_1645),
      .B(net_1618),
      .C(net_1786),
      .X(net_1783)
  );

  sky130_fd_sc_hd__a21oi_2 u_3636 (
      .A1(net_1625),
      .A2(net_1669),
      .B1(net_1645),
      .Y(net_1670)
  );

  sky130_fd_sc_hd__a22o_2 u_3660 (
      .A1(net_1645),
      .A2(net_1629),
      .B1(net_1610),
      .B2(net_1700),
      .X(net_1695)
  );

  sky130_fd_sc_hd__o31a_2 u_3703 (
      .A1(register_02[0]),
      .A2(net_1645),
      .A3(net_1627),
      .B1(net_1669),
      .X(net_1714)
  );

  sky130_fd_sc_hd__nor2_2 u_3712 (
      .A(register_02[0]),
      .B(net_1630),
      .Y(net_1631)
  );

  sky130_fd_sc_hd__a31o_2 u_3279 (
      .A1(register_02[0]),
      .A2(net_1644),
      .A3(net_1648),
      .B1(net_1646),
      .X(net_1649)
  );

  sky130_fd_sc_hd__o221a_2 u_2939 (
      .A1(net_1176),
      .A2(net_1177),
      .B1(net_1198),
      .B2(net_1199),
      .C1(net_1179),
      .X(net_1200)
  );

  sky130_fd_sc_hd__o211a_2 u_2940 (
      .A1(register_02[2]),
      .A2(net_1176),
      .B1(net_1235),
      .C1(net_1268),
      .X(net_1293)
  );

  sky130_fd_sc_hd__o21a_2 u_2942 (
      .A1(register_02[2]),
      .A2(net_1235),
      .B1(net_1268),
      .X(net_1331)
  );

  sky130_fd_sc_hd__or4_2 u_1244 (
      .A(register_15[0]),
      .B(net_2261),
      .C(net_2229),
      .D(net_2280),
      .X(net_2245)
  );

  sky130_fd_sc_hd__nor2_2 u_1798 (
      .A(net_2229),
      .B(net_2280),
      .Y(net_2242)
  );

  sky130_fd_sc_hd__or4_2 u_1252 (
      .A(register_15[1]),
      .B(net_2129),
      .C(net_2074),
      .D(net_2073),
      .X(net_2072)
  );

  sky130_fd_sc_hd__nor2_2 u_2143 (
      .A(net_2074),
      .B(net_2073),
      .Y(net_2070)
  );

  sky130_fd_sc_hd__or4_2 u_1363 (
      .A(register_13[4]),
      .B(net_2490),
      .C(net_2478),
      .D(net_2479),
      .X(net_2483)
  );

  sky130_fd_sc_hd__nor2_2 u_1377 (
      .A(net_2478),
      .B(net_2479),
      .Y(net_2477)
  );

  sky130_fd_sc_hd__nand2b_2 u_1570 (
      .A_N(register_13[5]),
      .B(net_2584),
      .Y(net_2582)
  );

  sky130_fd_sc_hd__o21a_2 u_1579 (
      .A1(register_13[5]),
      .A2(net_2584),
      .B1(net_2611),
      .X(net_2583)
  );

  sky130_fd_sc_hd__o21a_2 u_1366 (
      .A1(register_13[3]),
      .A2(net_2530),
      .B1(net_2554),
      .X(net_2531)
  );

  sky130_fd_sc_hd__nand2b_2 u_1569 (
      .A_N(register_13[3]),
      .B(net_2530),
      .Y(net_2489)
  );

  sky130_fd_sc_hd__nand2b_2 u_1675 (
      .A_N(register_14[3]),
      .B(net_2441),
      .Y(net_2464)
  );

  sky130_fd_sc_hd__o21a_2 u_1611 (
      .A1(register_14[3]),
      .A2(net_2441),
      .B1(net_2440),
      .X(net_2438)
  );

  sky130_fd_sc_hd__o21a_2 u_1235 (
      .A1(register_14[5]),
      .A2(net_2344),
      .B1(net_2377),
      .X(net_2354)
  );

  sky130_fd_sc_hd__nand2b_2 u_1240 (
      .A_N(register_14[5]),
      .B(net_2344),
      .Y(net_2345)
  );

  sky130_fd_sc_hd__o21a_2 u_1790 (
      .A1(register_14[4]),
      .A2(net_2275),
      .B1(net_2301),
      .X(net_2307)
  );

  sky130_fd_sc_hd__nand2b_2 u_1959 (
      .A_N(register_14[4]),
      .B(net_2275),
      .Y(net_2274)
  );

  sky130_fd_sc_hd__nand2b_2 u_1792 (
      .A_N(register_15[5]),
      .B(net_2154),
      .Y(net_2132)
  );

  sky130_fd_sc_hd__o21a_2 u_1780 (
      .A1(register_15[5]),
      .A2(net_2154),
      .B1(net_2184),
      .X(net_2160)
  );

  sky130_fd_sc_hd__o21a_2 u_2363 (
      .A1(register_05[1]),
      .A2(net_1796),
      .B1(net_1842),
      .X(net_1800)
  );

  sky130_fd_sc_hd__nand2b_2 u_2437 (
      .A_N(register_05[1]),
      .B(net_1796),
      .Y(net_1752)
  );

  sky130_fd_sc_hd__or4_2 u_144 (
      .A(register_15[7]),
      .B(net_2008),
      .C(net_1972),
      .D(net_1971),
      .X(net_2010)
  );

  sky130_fd_sc_hd__nor2_2 u_2359 (
      .A(net_1972),
      .B(net_1971),
      .Y(net_1970)
  );

  sky130_fd_sc_hd__xor2_2 u_4862 (
      .A(register_03[0]),
      .B(net_1303),
      .X(net_1307)
  );

  sky130_fd_sc_hd__a211oi_2 u_4835 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1453),
      .C1(net_1303),
      .Y(net_1394)
  );

  sky130_fd_sc_hd__nor2_2 u_4710 (
      .A(net_873),
      .B(net_1497),
      .Y(net_1448)
  );

  sky130_fd_sc_hd__a221oi_2 u_4663 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1391),
      .B2(register_03[1]),
      .C1(net_1535),
      .Y(net_1568)
  );

  sky130_fd_sc_hd__mux2_1 u_5778 (
      .A0(net_873),
      .A1(net_929),
      .S(net_1005),
      .X(net_927)
  );

  sky130_fd_sc_hd__and4_2 u_5613 (
      .A(register_07[7]),
      .B(net_457),
      .C(net_477),
      .D(net_478),
      .X(net_573)
  );

  sky130_fd_sc_hd__nor2_2 u_5614 (
      .A(net_477),
      .B(net_533),
      .Y(net_555)
  );

  sky130_fd_sc_hd__inv_2 u_5626 (
      .A(net_477),
      .Y(net_459)
  );

  sky130_fd_sc_hd__a31o_2 u_5947 (
      .A1(net_457),
      .A2(net_477),
      .A3(net_478),
      .B1(register_07[7]),
      .X(net_571)
  );

  sky130_fd_sc_hd__a31o_2 u_6017 (
      .A1(register_07[6]),
      .A2(net_477),
      .A3(net_478),
      .B1(register_07[5]),
      .X(net_386)
  );

  sky130_fd_sc_hd__and3_2 u_6033 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(net_477),
      .X(net_272)
  );

  sky130_fd_sc_hd__nand2_2 u_6067 (
      .A(net_477),
      .B(net_478),
      .Y(net_430)
  );

  sky130_fd_sc_hd__a21o_2 u_6356 (
      .A1(register_07[2]),
      .A2(net_477),
      .B1(register_07[1]),
      .X(net_274)
  );

  sky130_fd_sc_hd__nand3_2 u_6473 (
      .A(register_04[1]),
      .B(register_04[0]),
      .C(net_968),
      .Y(net_878)
  );

  sky130_fd_sc_hd__a21o_2 u_6474 (
      .A1(register_04[1]),
      .A2(net_968),
      .B1(register_04[0]),
      .X(net_874)
  );

  sky130_fd_sc_hd__inv_2 u_6478 (
      .A(net_968),
      .Y(net_970)
  );

  sky130_fd_sc_hd__xor2_2 u_6481 (
      .A(register_04[1]),
      .B(net_968),
      .X(net_1059)
  );

  sky130_fd_sc_hd__nor4b_2 u_6107 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[6]),
      .D_N(net_340),
      .Y(net_393)
  );

  sky130_fd_sc_hd__and4_2 u_6298 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[6]),
      .D(net_340),
      .X(net_367)
  );

  sky130_fd_sc_hd__a22o_2 u_4999 (
      .A1(net_1029),
      .A2(shift_register[0]),
      .B1(net_978),
      .B2(shift_register[11]),
      .X(net_1456)
  );

  sky130_fd_sc_hd__a22o_2 u_5781 (
      .A1(net_1005),
      .A2(register_06[2]),
      .B1(net_1004),
      .B2(net_907),
      .X(net_1007)
  );

  sky130_fd_sc_hd__a31o_2 u_5640 (
      .A1(net_873),
      .A2(net_604),
      .A3(net_882),
      .B1(register_06[1]),
      .X(net_831)
  );

  sky130_fd_sc_hd__o21ba_2 u_387 (
      .A1(register_09[2]),
      .A2(register_09[1]),
      .B1_N(net_581),
      .X(net_2401)
  );

  sky130_fd_sc_hd__mux2_1 u_6444 (
      .A0(net_876),
      .A1(net_879),
      .S(register_04[2]),
      .X(net_827)
  );

  sky130_fd_sc_hd__a31o_2 u_4602 (
      .A1(net_873),
      .A2(net_821),
      .A3(net_604),
      .B1(register_16),
      .X(net_2007)
  );

  sky130_fd_sc_hd__nor2_2 u_6957 (
      .A(register_04[3]),
      .B(net_235),
      .Y(net_233)
  );

  sky130_fd_sc_hd__and3_2 u_7417 (
      .A(net_350),
      .B(net_235),
      .C(net_349),
      .X(net_370)
  );

  sky130_fd_sc_hd__xnor2_2 u_7565 (
      .A(net_302),
      .B(net_326),
      .Y(net_443)
  );

  sky130_fd_sc_hd__nand2b_2 u_7656 (
      .A_N(net_302),
      .B(net_326),
      .Y(net_442)
  );

  sky130_fd_sc_hd__o32ai_2 u_6992 (
      .A1(net_752),
      .A2(net_766),
      .A3(net_786),
      .B1(net_785),
      .B2(register_02[1]),
      .Y(net_789)
  );

  sky130_fd_sc_hd__o31a_2 u_6972 (
      .A1(net_752),
      .A2(net_766),
      .A3(net_765),
      .B1(net_771),
      .X(net_768)
  );

  sky130_fd_sc_hd__o21bai_2 u_7167 (
      .A1(net_805),
      .A2(net_785),
      .B1_N(net_802),
      .Y(net_897)
  );

  sky130_fd_sc_hd__xnor2_2 u_7326 (
      .A(net_802),
      .B(net_801),
      .Y(net_846)
  );

  sky130_fd_sc_hd__a31o_2 u_6954 (
      .A1(register_04[3]),
      .A2(register_04[1]),
      .A3(register_04[0]),
      .B1(net_275),
      .X(net_277)
  );

  sky130_fd_sc_hd__a21oi_2 u_7546 (
      .A1(register_04[0]),
      .A2(net_302),
      .B1(net_275),
      .Y(net_352)
  );

  sky130_fd_sc_hd__and4_2 u_6806 (
      .A(net_105),
      .B(net_127),
      .C(net_104),
      .D(net_102),
      .X(net_126)
  );

  sky130_fd_sc_hd__and4_2 u_6822 (
      .A(net_168),
      .B(net_195),
      .C(net_194),
      .D(net_193),
      .X(net_165)
  );

  sky130_fd_sc_hd__nand2_2 u_9346 (
      .A(net_71),
      .B(net_58),
      .Y(net_59)
  );

  sky130_fd_sc_hd__nor2_2 u_9818 (
      .A(net_71),
      .B(net_58),
      .Y(net_72)
  );

  sky130_fd_sc_hd__nor2_2 u_9602 (
      .A(net_71),
      .B(net_37),
      .Y(net_20)
  );

  sky130_fd_sc_hd__o2bb2a_2 u_6949 (
      .A1_N(register_03[0]),
      .A2_N(net_178),
      .B1(net_204),
      .B2(register_04[1]),
      .X(net_265)
  );

  sky130_fd_sc_hd__xor2_2 u_9353 (
      .A(register_03[0]),
      .B(net_178),
      .X(net_141)
  );

  sky130_fd_sc_hd__a21oi_2 u_171 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_2016),
      .Y(net_1958)
  );

  sky130_fd_sc_hd__nor2_2 u_1166 (
      .A(net_2016),
      .B(net_1731),
      .Y(net_1915)
  );

  sky130_fd_sc_hd__nor2_2 u_3191 (
      .A(net_1612),
      .B(net_2016),
      .Y(net_1684)
  );

  sky130_fd_sc_hd__a21o_2 u_3281 (
      .A1(net_604),
      .A2(register_12[0]),
      .B1(net_1882),
      .X(net_1848)
  );

  sky130_fd_sc_hd__a22o_2 u_3477 (
      .A1(net_604),
      .A2(register_12[3]),
      .B1(register_12[5]),
      .B2(net_1882),
      .X(net_1880)
  );

  sky130_fd_sc_hd__a22o_2 u_3487 (
      .A1(net_604),
      .A2(register_12[5]),
      .B1(net_1882),
      .B2(register_12[2]),
      .X(net_1781)
  );

  sky130_fd_sc_hd__and3_2 u_5013 (
      .A(net_1506),
      .B(net_1539),
      .C(net_1500),
      .X(net_1573)
  );

  sky130_fd_sc_hd__and3b_2 u_3277 (
      .A_N(net_604),
      .B(net_1612),
      .C(net_1673),
      .X(net_1671)
  );

  sky130_fd_sc_hd__o21ai_2 u_3164 (
      .A1(I),
      .A2(net_1612),
      .B1(net_1621),
      .Y(net_1626)
  );

  sky130_fd_sc_hd__and2b_2 u_2966 (
      .A_N(net_1673),
      .B(net_1613),
      .X(net_1849)
  );

  sky130_fd_sc_hd__a221o_2 u_2972 (
      .A1(net_604),
      .A2(register_12[4]),
      .B1(net_1613),
      .B2(net_1635),
      .C1(net_1882),
      .X(net_1789)
  );

  sky130_fd_sc_hd__o21ai_2 u_3163 (
      .A1(net_1650),
      .A2(net_1611),
      .B1(net_1658),
      .Y(net_1659)
  );

  sky130_fd_sc_hd__xnor2_2 u_3286 (
      .A(net_1783),
      .B(net_1759),
      .Y(net_1760)
  );

  sky130_fd_sc_hd__xnor2_2 u_3709 (
      .A(register_12[6]),
      .B(net_1670),
      .Y(net_1677)
  );

  sky130_fd_sc_hd__nand2_2 u_3480 (
      .A(net_1878),
      .B(net_1695),
      .Y(net_1879)
  );

  sky130_fd_sc_hd__xor2_2 u_3298 (
      .A(register_12[3]),
      .B(net_1714),
      .X(net_1764)
  );

  sky130_fd_sc_hd__o32a_2 u_3710 (
      .A1(net_1650),
      .A2(net_1610),
      .A3(net_1631),
      .B1(net_1630),
      .B2(net_1611),
      .X(net_1633)
  );

  sky130_fd_sc_hd__xnor2_2 u_3711 (
      .A(register_12[7]),
      .B(net_1649),
      .Y(net_1653)
  );

  sky130_fd_sc_hd__a21o_2 u_1777 (
      .A1(register_15[4]),
      .A2(net_2242),
      .B1(register_15[0]),
      .X(net_2240)
  );

  sky130_fd_sc_hd__o21a_2 u_1781 (
      .A1(register_15[4]),
      .A2(net_2242),
      .B1(net_2245),
      .X(net_2243)
  );

  sky130_fd_sc_hd__o21a_2 u_1795 (
      .A1(register_15[6]),
      .A2(net_2070),
      .B1(net_2072),
      .X(net_2097)
  );

  sky130_fd_sc_hd__a21o_2 u_1796 (
      .A1(register_15[6]),
      .A2(net_2070),
      .B1(register_15[1]),
      .X(net_2075)
  );

  sky130_fd_sc_hd__a21o_2 u_1367 (
      .A1(register_13[2]),
      .A2(net_2477),
      .B1(register_13[4]),
      .X(net_2510)
  );

  sky130_fd_sc_hd__o21a_2 u_1387 (
      .A1(register_13[2]),
      .A2(net_2477),
      .B1(net_2483),
      .X(net_2557)
  );

  sky130_fd_sc_hd__a21o_2 u_145 (
      .A1(register_15[2]),
      .A2(net_1970),
      .B1(register_15[7]),
      .X(net_2011)
  );

  sky130_fd_sc_hd__o21a_2 u_147 (
      .A1(register_15[2]),
      .A2(net_1970),
      .B1(net_2010),
      .X(net_1997)
  );

  sky130_fd_sc_hd__a21oi_2 u_5682 (
      .A1(net_929),
      .A2(net_930),
      .B1(net_927),
      .Y(net_928)
  );

  sky130_fd_sc_hd__xor2_2 u_6110 (
      .A(register_07[4]),
      .B(net_573),
      .X(net_578)
  );

  sky130_fd_sc_hd__a32o_2 u_6103 (
      .A1(I),
      .A2(net_604),
      .A3(net_488),
      .B1(net_459),
      .B2(register_07[2]),
      .X(net_347)
  );

  sky130_fd_sc_hd__and2b_2 u_5615 (
      .A_N(net_573),
      .B(net_571),
      .X(net_519)
  );

  sky130_fd_sc_hd__o21a_2 u_5627 (
      .A1(net_341),
      .A2(net_430),
      .B1(net_386),
      .X(net_384)
  );

  sky130_fd_sc_hd__o21a_2 u_6041 (
      .A1(register_07[0]),
      .A2(net_272),
      .B1(net_430),
      .X(net_458)
  );

  sky130_fd_sc_hd__xnor2_2 u_6195 (
      .A(register_07[6]),
      .B(net_430),
      .Y(net_297)
  );

  sky130_fd_sc_hd__and2b_2 u_5603 (
      .A_N(net_272),
      .B(net_274),
      .X(net_263)
  );

  sky130_fd_sc_hd__o311a_2 u_6437 (
      .A1(register_04[2]),
      .A2(net_820),
      .A3(net_879),
      .B1(net_878),
      .C1(net_874),
      .X(net_921)
  );

  sky130_fd_sc_hd__o211a_2 u_6446 (
      .A1(net_820),
      .A2(net_879),
      .B1(net_918),
      .C1(net_970),
      .X(net_972)
  );

  sky130_fd_sc_hd__a211oi_2 u_203 (
      .A1(net_2356),
      .A2(register_09[1]),
      .B1(net_581),
      .C1(net_393),
      .Y(net_2112)
  );

  sky130_fd_sc_hd__or4b_2 u_536 (
      .A(net_393),
      .B(register_09[2]),
      .C(net_581),
      .D_N(register_09[1]),
      .X(net_2355)
  );

  sky130_fd_sc_hd__and2_2 u_460 (
      .A(net_855),
      .B(net_367),
      .X(net_2487)
  );

  sky130_fd_sc_hd__a221o_2 u_5229 (
      .A1(net_1002),
      .A2(shift_register[9]),
      .B1(1'b1),
      .B2(shift_register[10]),
      .C1(net_1456),
      .X(net_1454)
  );

  sky130_fd_sc_hd__nor2_2 u_498 (
      .A(net_393),
      .B(net_2401),
      .Y(net_2165)
  );

  sky130_fd_sc_hd__or3_2 u_7383 (
      .A(net_233),
      .B(net_275),
      .C(net_370),
      .X(net_463)
  );

  sky130_fd_sc_hd__xnor2_2 u_7564 (
      .A(register_03[1]),
      .B(net_443),
      .Y(net_354)
  );

  sky130_fd_sc_hd__nand2_2 u_7660 (
      .A(register_03[1]),
      .B(net_443),
      .Y(net_502)
  );

  sky130_fd_sc_hd__o22ai_2 u_7380 (
      .A1(register_04[3]),
      .A2(net_235),
      .B1(net_324),
      .B2(net_277),
      .Y(net_303)
  );

  sky130_fd_sc_hd__a21o_2 u_7381 (
      .A1(net_302),
      .A2(net_275),
      .B1(net_352),
      .X(net_398)
  );

  sky130_fd_sc_hd__and3_2 u_6802 (
      .A(net_126),
      .B(net_165),
      .C(net_192),
      .X(net_164)
  );

  sky130_fd_sc_hd__nor2_2 u_9597 (
      .A(net_107),
      .B(net_59),
      .Y(net_41)
  );

  sky130_fd_sc_hd__and2b_2 u_9344 (
      .A_N(net_72),
      .B(net_59),
      .X(net_11)
  );

  sky130_fd_sc_hd__xnor2_2 u_9360 (
      .A(net_28),
      .B(net_141),
      .Y(net_135)
  );

  sky130_fd_sc_hd__o21a_2 u_2974 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_1958),
      .X(net_1894)
  );

  sky130_fd_sc_hd__a221o_2 u_3285 (
      .A1(net_604),
      .A2(register_12[6]),
      .B1(register_12[0]),
      .B2(net_1882),
      .C1(net_1915),
      .X(net_1913)
  );

  sky130_fd_sc_hd__a221o_2 u_2965 (
      .A1(net_604),
      .A2(register_12[2]),
      .B1(register_12[7]),
      .B2(net_1882),
      .C1(net_1684),
      .X(net_1730)
  );

  sky130_fd_sc_hd__a21o_2 u_3516 (
      .A1(net_1787),
      .A2(net_1912),
      .B1(net_1880),
      .X(net_1851)
  );

  sky130_fd_sc_hd__a31o_2 u_3489 (
      .A1(net_1787),
      .A2(net_1788),
      .A3(net_1782),
      .B1(net_1781),
      .X(net_1713)
  );

  sky130_fd_sc_hd__o221a_2 u_3587 (
      .A1(register_12[6]),
      .A2(net_1846),
      .B1(net_2016),
      .B2(net_1725),
      .C1(net_1626),
      .X(net_1844)
  );

  sky130_fd_sc_hd__o32a_2 u_3284 (
      .A1(net_1849),
      .A2(net_1671),
      .A3(net_1848),
      .B1(net_1846),
      .B2(register_12[4]),
      .X(net_1850)
  );

  sky130_fd_sc_hd__o22a_2 u_2973 (
      .A1(register_12[1]),
      .A2(net_1846),
      .B1(net_1634),
      .B2(net_1789),
      .X(net_1927)
  );

  sky130_fd_sc_hd__xnor2_2 u_3161 (
      .A(register_12[4]),
      .B(net_1659),
      .Y(net_1707)
  );

  sky130_fd_sc_hd__xor2_2 u_169 (
      .A(register_12[5]),
      .B(net_1879),
      .X(net_2015)
  );

  sky130_fd_sc_hd__xor2_2 u_2951 (
      .A(register_12[1]),
      .B(net_1633),
      .X(net_1654)
  );

  sky130_fd_sc_hd__inv_2 u_200 (
      .A(net_2355),
      .Y(net_2166)
  );

  sky130_fd_sc_hd__a31o_2 u_5256 (
      .A1(I),
      .A2(net_604),
      .A3(net_1454),
      .B1(register_17),
      .X(net_1466)
  );

  sky130_fd_sc_hd__xnor2_2 u_6980 (
      .A(net_354),
      .B(net_265),
      .Y(net_181)
  );

  sky130_fd_sc_hd__nand2_2 u_7375 (
      .A(net_354),
      .B(net_265),
      .Y(net_238)
  );

  sky130_fd_sc_hd__nor2_2 u_7415 (
      .A(net_354),
      .B(net_265),
      .Y(net_234)
  );

  sky130_fd_sc_hd__and3_2 u_7382 (
      .A(net_442),
      .B(net_502),
      .C(net_463),
      .X(net_501)
  );

  sky130_fd_sc_hd__a21oi_2 u_7560 (
      .A1(net_442),
      .A2(net_502),
      .B1(net_463),
      .Y(net_548)
  );

  sky130_fd_sc_hd__and2b_2 u_7416 (
      .A_N(net_213),
      .B(net_303),
      .X(net_280)
  );

  sky130_fd_sc_hd__and4b_2 u_450 (
      .A_N(register_09[0]),
      .B(register_16),
      .C(net_164),
      .D(net_1573),
      .X(net_2542)
  );

  sky130_fd_sc_hd__inv_2 u_6962 (
      .A(net_41),
      .Y(net_282)
  );

  sky130_fd_sc_hd__and2_2 u_9615 (
      .A(net_37),
      .B(net_11),
      .X(net_46)
  );

  sky130_fd_sc_hd__nor2_2 u_9810 (
      .A(net_40),
      .B(net_11),
      .Y(net_6)
  );

  sky130_fd_sc_hd__xor2_2 u_8995 (
      .A(net_135),
      .B(net_72),
      .X(net_8)
  );

  sky130_fd_sc_hd__xnor2_2 u_8999 (
      .A(net_135),
      .B(net_72),
      .Y(net_38)
  );

  sky130_fd_sc_hd__nand2_2 u_9340 (
      .A(net_135),
      .B(net_41),
      .Y(net_42)
  );

  sky130_fd_sc_hd__a32o_2 u_9355 (
      .A1(register_03[3]),
      .A2(net_9),
      .A3(net_141),
      .B1(net_135),
      .B2(net_72),
      .X(net_138)
  );

  sky130_fd_sc_hd__nand2_2 u_9598 (
      .A(net_135),
      .B(net_20),
      .Y(net_136)
  );

  sky130_fd_sc_hd__nand2_2 u_9705 (
      .A(net_135),
      .B(net_11),
      .Y(net_36)
  );

  sky130_fd_sc_hd__a221o_2 u_2969 (
      .A1(net_604),
      .A2(register_12[1]),
      .B1(net_1882),
      .B2(register_12[3]),
      .C1(net_1894),
      .X(net_1767)
  );

  sky130_fd_sc_hd__nor3b_2 u_744 (
      .A(net_2165),
      .B(net_2166),
      .C_N(net_2112),
      .Y(net_2084)
  );

  sky130_fd_sc_hd__nor3b_2 u_745 (
      .A(net_2112),
      .B(net_2165),
      .C_N(net_2166),
      .Y(net_2059)
  );

  sky130_fd_sc_hd__nor3b_2 u_753 (
      .A(net_2112),
      .B(net_2166),
      .C_N(net_2165),
      .Y(net_2167)
  );

  sky130_fd_sc_hd__nor3_2 u_754 (
      .A(net_2112),
      .B(net_2165),
      .C(net_2166),
      .Y(net_2187)
  );

  sky130_fd_sc_hd__a21oi_2 u_834 (
      .A1(net_2165),
      .A2(net_2166),
      .B1(net_2112),
      .Y(net_2055)
  );

  sky130_fd_sc_hd__nor2_2 u_7374 (
      .A(net_548),
      .B(net_501),
      .Y(net_586)
  );

  sky130_fd_sc_hd__a32o_2 u_233 (
      .A1(net_1361),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_09[2]),
      .B2(net_2520),
      .X(net_2543)
  );

  sky130_fd_sc_hd__a32o_2 u_399 (
      .A1(net_2522),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_09[1]),
      .B2(net_2520),
      .X(net_2501)
  );

  sky130_fd_sc_hd__or2_2 u_9338 (
      .A(net_8),
      .B(net_6),
      .X(net_2)
  );

  sky130_fd_sc_hd__or2_2 u_9612 (
      .A(net_8),
      .B(net_11),
      .X(net_22)
  );

  sky130_fd_sc_hd__nor2_2 u_9345 (
      .A(net_38),
      .B(net_6),
      .Y(net_69)
  );

  sky130_fd_sc_hd__nand2_2 u_9605 (
      .A(net_38),
      .B(net_6),
      .Y(net_39)
  );

  sky130_fd_sc_hd__or3_2 u_9611 (
      .A(net_20),
      .B(net_38),
      .C(net_6),
      .X(net_52)
  );

  sky130_fd_sc_hd__nand2_2 u_9763 (
      .A(net_37),
      .B(net_38),
      .Y(net_5)
  );

  sky130_fd_sc_hd__nor2_2 u_9790 (
      .A(net_38),
      .B(net_41),
      .Y(net_78)
  );

  sky130_fd_sc_hd__a21o_2 u_6952 (
      .A1(net_138),
      .A2(net_238),
      .B1(net_234),
      .X(net_237)
  );

  sky130_fd_sc_hd__xnor2_2 u_6964 (
      .A(net_138),
      .B(net_181),
      .Y(net_50)
  );

  sky130_fd_sc_hd__xor2_2 u_9000 (
      .A(net_138),
      .B(net_181),
      .X(net_15)
  );

  sky130_fd_sc_hd__a22o_2 u_238 (
      .A1(net_1653),
      .A2(net_2084),
      .B1(net_2059),
      .B2(1'b0),
      .X(net_2063)
  );

  sky130_fd_sc_hd__a22o_2 u_239 (
      .A1(net_2015),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_984),
      .X(net_2117)
  );

  sky130_fd_sc_hd__a22o_2 u_241 (
      .A1(net_1707),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_956),
      .X(net_2090)
  );

  sky130_fd_sc_hd__a22o_2 u_242 (
      .A1(net_1654),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_846),
      .X(net_2140)
  );

  sky130_fd_sc_hd__a22o_2 u_742 (
      .A1(net_1760),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_768),
      .X(net_2085)
  );

  sky130_fd_sc_hd__a22o_2 u_747 (
      .A1(net_1677),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_897),
      .X(net_2110)
  );

  sky130_fd_sc_hd__a22o_2 u_939 (
      .A1(net_1919),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_949),
      .X(net_2061)
  );

  sky130_fd_sc_hd__a22o_2 u_960 (
      .A1(net_1764),
      .A2(net_2084),
      .B1(net_2059),
      .B2(net_789),
      .X(net_2087)
  );

  sky130_fd_sc_hd__a22o_2 u_225 (
      .A1(net_1380),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1174),
      .X(net_2235)
  );

  sky130_fd_sc_hd__a22o_2 u_603 (
      .A1(net_1426),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1173),
      .X(net_2169)
  );

  sky130_fd_sc_hd__a22o_2 u_611 (
      .A1(net_1436),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1231),
      .X(net_2215)
  );

  sky130_fd_sc_hd__a22o_2 u_683 (
      .A1(net_1427),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1232),
      .X(net_2193)
  );

  sky130_fd_sc_hd__a22o_2 u_687 (
      .A1(net_1523),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1200),
      .X(net_2218)
  );

  sky130_fd_sc_hd__a22o_2 u_709 (
      .A1(1'b0),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1293),
      .X(net_2189)
  );

  sky130_fd_sc_hd__a22o_2 u_976 (
      .A1(net_1554),
      .A2(net_2167),
      .B1(net_2187),
      .B2(net_1331),
      .X(net_2172)
  );

  sky130_fd_sc_hd__a22o_2 u_1154 (
      .A1(1'b0),
      .A2(net_2167),
      .B1(net_2187),
      .B2(1'b0),
      .X(net_2143)
  );

  sky130_fd_sc_hd__or3_2 u_604 (
      .A(net_1136),
      .B(net_2084),
      .C(net_2055),
      .X(net_2082)
  );

  sky130_fd_sc_hd__nor2_2 u_741 (
      .A(net_2084),
      .B(net_2055),
      .Y(net_2109)
  );

  sky130_fd_sc_hd__or3_2 u_751 (
      .A(net_1079),
      .B(net_2084),
      .C(net_2055),
      .X(net_2057)
  );

  sky130_fd_sc_hd__or3_2 u_867 (
      .A(net_1135),
      .B(net_2084),
      .C(net_2055),
      .X(net_2138)
  );

  sky130_fd_sc_hd__or3_2 u_1076 (
      .A(net_1117),
      .B(net_2084),
      .C(net_2055),
      .X(net_2194)
  );

  sky130_fd_sc_hd__or3_2 u_1077 (
      .A(1'b0),
      .B(net_2084),
      .C(net_2055),
      .X(net_2118)
  );

  sky130_fd_sc_hd__or3_2 u_1080 (
      .A(net_1124),
      .B(net_2084),
      .C(net_2055),
      .X(net_2145)
  );

  sky130_fd_sc_hd__or3_2 u_1190 (
      .A(net_1078),
      .B(net_2084),
      .C(net_2055),
      .X(net_2098)
  );

  sky130_fd_sc_hd__or3_2 u_1203 (
      .A(net_1042),
      .B(net_2084),
      .C(net_2055),
      .X(net_2058)
  );

  sky130_fd_sc_hd__inv_2 u_9009 (
      .A(net_2),
      .Y(net_185)
  );

  sky130_fd_sc_hd__nand2b_2 u_9047 (
      .A_N(net_46),
      .B(net_22),
      .Y(net_17)
  );

  sky130_fd_sc_hd__and2_2 u_9351 (
      .A(net_36),
      .B(net_5),
      .X(net_1)
  );

  sky130_fd_sc_hd__or3_2 u_9008 (
      .A(net_20),
      .B(net_6),
      .C(net_78),
      .X(net_113)
  );

  sky130_fd_sc_hd__xor2_2 u_6946 (
      .A(net_237),
      .B(net_586),
      .X(net_12)
  );

  sky130_fd_sc_hd__a21o_2 u_7376 (
      .A1(net_237),
      .A2(net_586),
      .B1(net_548),
      .X(net_279)
  );

  sky130_fd_sc_hd__nor2_2 u_6936 (
      .A(net_136),
      .B(net_50),
      .Y(net_202)
  );

  sky130_fd_sc_hd__and3_2 u_7769 (
      .A(net_50),
      .B(net_282),
      .C(net_5),
      .X(net_16)
  );

  sky130_fd_sc_hd__o211a_2 u_8997 (
      .A1(net_20),
      .A2(net_8),
      .B1(net_50),
      .C1(net_136),
      .X(net_48)
  );

  sky130_fd_sc_hd__nor2_2 u_9003 (
      .A(net_50),
      .B(net_52),
      .Y(net_402)
  );

  sky130_fd_sc_hd__nor2_2 u_9005 (
      .A(net_50),
      .B(net_69),
      .Y(net_14)
  );

  sky130_fd_sc_hd__nand2_2 u_9010 (
      .A(net_50),
      .B(net_39),
      .Y(net_106)
  );

  sky130_fd_sc_hd__or2_2 u_9013 (
      .A(net_50),
      .B(net_22),
      .X(net_4)
  );

  sky130_fd_sc_hd__a21oi_2 u_9198 (
      .A1(net_50),
      .A2(net_46),
      .B1(net_52),
      .Y(net_31)
  );

  sky130_fd_sc_hd__or2_2 u_9265 (
      .A(net_50),
      .B(net_6),
      .X(net_51)
  );

  sky130_fd_sc_hd__and3_2 u_9540 (
      .A(net_50),
      .B(net_38),
      .C(net_46),
      .X(net_45)
  );

  sky130_fd_sc_hd__nor2_2 u_6872 (
      .A(net_15),
      .B(net_36),
      .Y(net_232)
  );

  sky130_fd_sc_hd__nor2_2 u_9006 (
      .A(net_15),
      .B(net_22),
      .Y(net_62)
  );

  sky130_fd_sc_hd__or3_2 u_9007 (
      .A(net_20),
      .B(net_15),
      .C(net_2),
      .X(net_96)
  );

  sky130_fd_sc_hd__a31o_2 u_9044 (
      .A1(net_15),
      .A2(net_36),
      .A3(net_5),
      .B1(net_46),
      .X(net_60)
  );

  sky130_fd_sc_hd__o31ai_2 u_9045 (
      .A1(net_20),
      .A2(net_15),
      .A3(net_8),
      .B1(net_136),
      .Y(net_145)
  );

  sky130_fd_sc_hd__o21a_2 u_9049 (
      .A1(net_15),
      .A2(net_41),
      .B1(net_22),
      .X(net_128)
  );

  sky130_fd_sc_hd__o21a_2 u_9336 (
      .A1(net_20),
      .A2(net_2),
      .B1(net_15),
      .X(net_91)
  );

  sky130_fd_sc_hd__nor2_2 u_9714 (
      .A(net_136),
      .B(net_15),
      .Y(net_170)
  );

  sky130_fd_sc_hd__nor2_2 u_9760 (
      .A(net_15),
      .B(net_69),
      .Y(net_90)
  );

  sky130_fd_sc_hd__o31a_2 u_790 (
      .A1(net_2109),
      .A2(net_2189),
      .A3(net_2087),
      .B1(net_2082),
      .X(net_2190)
  );

  sky130_fd_sc_hd__o31a_2 u_231 (
      .A1(net_2109),
      .A2(net_2235),
      .A3(net_2110),
      .B1(net_2057),
      .X(net_2236)
  );

  sky130_fd_sc_hd__o31a_2 u_217 (
      .A1(net_2109),
      .A2(net_2218),
      .A3(net_2140),
      .B1(net_2138),
      .X(net_2219)
  );

  sky130_fd_sc_hd__o31a_2 u_232 (
      .A1(net_2109),
      .A2(net_2193),
      .A3(net_2117),
      .B1(net_2194),
      .X(net_2191)
  );

  sky130_fd_sc_hd__o31a_2 u_1143 (
      .A1(net_2109),
      .A2(net_2143),
      .A3(net_2063),
      .B1(net_2118),
      .X(net_2141)
  );

  sky130_fd_sc_hd__o31a_2 u_1081 (
      .A1(net_2109),
      .A2(net_2172),
      .A3(net_2061),
      .B1(net_2145),
      .X(net_2232)
  );

  sky130_fd_sc_hd__o31a_2 u_246 (
      .A1(net_2109),
      .A2(net_2169),
      .A3(net_2090),
      .B1(net_2098),
      .X(net_2168)
  );

  sky130_fd_sc_hd__o31a_2 u_600 (
      .A1(net_2109),
      .A2(net_2215),
      .A3(net_2085),
      .B1(net_2058),
      .X(net_2216)
  );

  sky130_fd_sc_hd__mux2_1 u_9063 (
      .A0(net_52),
      .A1(net_113),
      .S(net_15),
      .X(net_218)
  );

  sky130_fd_sc_hd__o21ai_2 u_6977 (
      .A1(net_15),
      .A2(net_185),
      .B1(net_12),
      .Y(net_77)
  );

  sky130_fd_sc_hd__o31ai_2 u_9062 (
      .A1(net_50),
      .A2(net_78),
      .A3(net_185),
      .B1(net_12),
      .Y(net_184)
  );

  sky130_fd_sc_hd__a21oi_2 u_9348 (
      .A1(net_15),
      .A2(net_69),
      .B1(net_12),
      .Y(net_120)
  );

  sky130_fd_sc_hd__xnor2_2 u_6945 (
      .A(net_279),
      .B(net_280),
      .Y(net_74)
  );

  sky130_fd_sc_hd__xor2_2 u_6982 (
      .A(net_279),
      .B(net_280),
      .X(net_312)
  );

  sky130_fd_sc_hd__a21oi_2 u_7414 (
      .A1(net_279),
      .A2(net_303),
      .B1(net_213),
      .Y(net_416)
  );

  sky130_fd_sc_hd__mux2_1 u_6960 (
      .A0(net_14),
      .A1(net_50),
      .S(net_17),
      .X(net_305)
  );

  sky130_fd_sc_hd__o21ai_2 u_7816 (
      .A1(net_14),
      .A2(net_16),
      .B1(net_12),
      .Y(net_562)
  );

  sky130_fd_sc_hd__or3_2 u_9001 (
      .A(net_12),
      .B(net_14),
      .C(net_48),
      .X(net_94)
  );

  sky130_fd_sc_hd__a22o_2 u_9002 (
      .A1(net_39),
      .A2(net_14),
      .B1(net_2),
      .B2(net_50),
      .X(net_313)
  );

  sky130_fd_sc_hd__a311o_2 u_9347 (
      .A1(net_135),
      .A2(net_12),
      .A3(net_11),
      .B1(net_14),
      .C1(net_16),
      .X(net_29)
  );

  sky130_fd_sc_hd__nor2_2 u_6921 (
      .A(net_69),
      .B(net_106),
      .Y(net_134)
  );

  sky130_fd_sc_hd__nand2_2 u_9614 (
      .A(net_12),
      .B(net_106),
      .Y(net_203)
  );

  sky130_fd_sc_hd__o22a_2 u_8996 (
      .A1(net_15),
      .A2(net_17),
      .B1(net_4),
      .B2(net_40),
      .X(net_18)
  );

  sky130_fd_sc_hd__o21a_2 u_9245 (
      .A1(net_15),
      .A2(net_1),
      .B1(net_4),
      .X(net_76)
  );

  sky130_fd_sc_hd__o21a_2 u_9012 (
      .A1(net_20),
      .A2(net_106),
      .B1(net_51),
      .X(net_30)
  );

  sky130_fd_sc_hd__or3_2 u_9337 (
      .A(net_12),
      .B(net_232),
      .C(net_62),
      .X(net_196)
  );

  sky130_fd_sc_hd__nand2_2 u_9127 (
      .A(net_12),
      .B(net_145),
      .Y(net_467)
  );

  sky130_fd_sc_hd__or2_2 u_7766 (
      .A(net_62),
      .B(net_128),
      .X(net_327)
  );

  sky130_fd_sc_hd__a211o_2 u_6968 (
      .A1(net_50),
      .A2(net_42),
      .B1(net_91),
      .C1(net_12),
      .X(net_250)
  );

  sky130_fd_sc_hd__o21ba_2 u_9115 (
      .A1(net_50),
      .A2(net_42),
      .B1_N(net_170),
      .X(net_219)
  );

  sky130_fd_sc_hd__and3_2 u_305 (
      .A(register_09[0]),
      .B(net_2190),
      .C(net_2302),
      .X(net_1862)
  );

  sky130_fd_sc_hd__and3_2 u_222 (
      .A(register_09[0]),
      .B(net_2236),
      .C(net_2302),
      .X(net_2363)
  );

  sky130_fd_sc_hd__and3_2 u_350 (
      .A(register_09[0]),
      .B(net_2219),
      .C(net_2302),
      .X(net_1155)
  );

  sky130_fd_sc_hd__and3_2 u_230 (
      .A(register_09[0]),
      .B(net_2191),
      .C(net_2302),
      .X(net_673)
  );

  sky130_fd_sc_hd__and3_2 u_229 (
      .A(register_09[0]),
      .B(net_2141),
      .C(net_2302),
      .X(net_2361)
  );

  sky130_fd_sc_hd__and3_2 u_553 (
      .A(register_09[0]),
      .B(net_2232),
      .C(net_2302),
      .X(net_627)
  );

  sky130_fd_sc_hd__and3_2 u_223 (
      .A(register_09[0]),
      .B(net_2168),
      .C(net_2302),
      .X(net_1474)
  );

  sky130_fd_sc_hd__and3_2 u_1046 (
      .A(register_09[0]),
      .B(net_2216),
      .C(net_2302),
      .X(net_1697)
  );

  sky130_fd_sc_hd__nand2_2 u_9004 (
      .A(net_12),
      .B(net_218),
      .Y(net_216)
  );

  sky130_fd_sc_hd__o32a_2 u_8011 (
      .A1(net_12),
      .A2(net_45),
      .A3(net_31),
      .B1(net_184),
      .B2(net_90),
      .X(net_329)
  );

  sky130_fd_sc_hd__a21bo_2 u_9043 (
      .A1(net_38),
      .A2(net_51),
      .B1_N(net_120),
      .X(net_95)
  );

  sky130_fd_sc_hd__or4_2 u_9342 (
      .A(net_12),
      .B(net_74),
      .C(net_113),
      .D(net_91),
      .X(net_111)
  );

  sky130_fd_sc_hd__o22ai_2 u_6963 (
      .A1(net_50),
      .A2(net_39),
      .B1(net_96),
      .B2(net_312),
      .Y(net_256)
  );

  sky130_fd_sc_hd__or2_2 u_7854 (
      .A(net_312),
      .B(net_232),
      .X(net_446)
  );

  sky130_fd_sc_hd__xnor2_2 u_6981 (
      .A(net_416),
      .B(net_398),
      .Y(net_507)
  );

  sky130_fd_sc_hd__xor2_2 u_6983 (
      .A(net_416),
      .B(net_398),
      .X(net_400)
  );

  sky130_fd_sc_hd__nor2_2 u_7435 (
      .A(net_416),
      .B(net_398),
      .Y(net_462)
  );

  sky130_fd_sc_hd__a211o_2 u_7379 (
      .A1(net_12),
      .A2(net_22),
      .B1(net_305),
      .C1(net_74),
      .X(net_325)
  );

  sky130_fd_sc_hd__and3_2 u_7404 (
      .A(net_74),
      .B(net_29),
      .C(net_562),
      .X(net_406)
  );

  sky130_fd_sc_hd__o32a_2 u_7832 (
      .A1(net_12),
      .A2(net_45),
      .A3(net_402),
      .B1(net_134),
      .B2(net_184),
      .X(net_418)
  );

  sky130_fd_sc_hd__a21oi_2 u_7767 (
      .A1(net_203),
      .A2(net_94),
      .B1(net_74),
      .Y(net_316)
  );

  sky130_fd_sc_hd__a32o_2 u_9046 (
      .A1(net_12),
      .A2(net_106),
      .A3(net_4),
      .B1(net_18),
      .B2(net_120),
      .X(net_119)
  );

  sky130_fd_sc_hd__o221a_2 u_9358 (
      .A1(net_78),
      .A2(net_77),
      .B1(net_76),
      .B2(net_12),
      .C1(net_74),
      .X(net_79)
  );

  sky130_fd_sc_hd__mux2_1 u_9357 (
      .A0(net_30),
      .A1(net_60),
      .S(net_12),
      .X(net_44)
  );

  sky130_fd_sc_hd__o211a_2 u_6947 (
      .A1(net_203),
      .A2(net_14),
      .B1(net_74),
      .C1(net_196),
      .X(net_239)
  );

  sky130_fd_sc_hd__mux2_1 u_7823 (
      .A0(net_327),
      .A1(net_313),
      .S(net_12),
      .X(net_328)
  );

  sky130_fd_sc_hd__a21bo_2 u_8044 (
      .A1(net_12),
      .A2(net_170),
      .B1_N(net_250),
      .X(net_374)
  );

  sky130_fd_sc_hd__a21oi_2 u_7852 (
      .A1(net_312),
      .A2(net_219),
      .B1(net_12),
      .Y(net_447)
  );

  sky130_fd_sc_hd__o311a_2 u_6948 (
      .A1(net_202),
      .A2(net_12),
      .A3(net_45),
      .B1(net_74),
      .C1(net_216),
      .X(net_264)
  );

  sky130_fd_sc_hd__o21ai_2 u_7764 (
      .A1(net_312),
      .A2(net_329),
      .B1(net_111),
      .Y(net_549)
  );

  sky130_fd_sc_hd__a31o_2 u_7820 (
      .A1(net_312),
      .A2(net_95),
      .A3(net_467),
      .B1(net_400),
      .X(net_404)
  );

  sky130_fd_sc_hd__nor2_2 u_7400 (
      .A(net_462),
      .B(net_208),
      .Y(net_417)
  );

  sky130_fd_sc_hd__a211o_2 u_7914 (
      .A1(net_312),
      .A2(net_119),
      .B1(net_79),
      .C1(net_507),
      .X(net_509)
  );

  sky130_fd_sc_hd__mux2_1 u_7819 (
      .A0(net_418),
      .A1(net_44),
      .S(net_312),
      .X(net_466)
  );

  sky130_fd_sc_hd__or3_2 u_6984 (
      .A(net_507),
      .B(net_239),
      .C(net_316),
      .X(net_403)
  );

  sky130_fd_sc_hd__o211ai_2 u_7825 (
      .A1(net_312),
      .A2(net_328),
      .B1(net_325),
      .C1(net_400),
      .Y(net_355)
  );

  sky130_fd_sc_hd__a21o_2 u_7768 (
      .A1(net_312),
      .A2(net_374),
      .B1(net_406),
      .X(net_419)
  );

  sky130_fd_sc_hd__a221o_2 u_6979 (
      .A1(net_12),
      .A2(net_256),
      .B1(net_446),
      .B2(net_447),
      .C1(net_507),
      .X(net_465)
  );

  sky130_fd_sc_hd__o211a_2 u_6978 (
      .A1(net_400),
      .A2(net_466),
      .B1(net_509),
      .C1(net_417),
      .X(net_584)
  );

  sky130_fd_sc_hd__o211a_2 u_7824 (
      .A1(net_264),
      .A2(net_404),
      .B1(net_417),
      .C1(net_403),
      .X(net_643)
  );

  sky130_fd_sc_hd__o211a_2 u_7563 (
      .A1(net_400),
      .A2(net_419),
      .B1(net_355),
      .C1(net_417),
      .X(net_497)
  );

  sky130_fd_sc_hd__o211a_2 u_6987 (
      .A1(net_400),
      .A2(net_549),
      .B1(net_465),
      .C1(net_417),
      .X(net_559)
  );

  sky130_fd_sc_hd__and4bb_2 u_2563 (
      .A_N(net_643),
      .B_N(net_559),
      .C(net_584),
      .D(net_497),
      .X(net_1323)
  );

  sky130_fd_sc_hd__or4b_2 u_2671 (
      .A(net_497),
      .B(net_643),
      .C(net_559),
      .D_N(net_584),
      .X(net_1220)
  );

  sky130_fd_sc_hd__and4bb_2 u_2706 (
      .A_N(net_497),
      .B_N(net_559),
      .C(net_584),
      .D(net_643),
      .X(net_1189)
  );

  sky130_fd_sc_hd__and4b_2 u_2707 (
      .A_N(net_584),
      .B(net_559),
      .C(net_643),
      .D(net_497),
      .X(net_1131)
  );

  sky130_fd_sc_hd__and4bb_2 u_8213 (
      .A_N(net_643),
      .B_N(net_584),
      .C(net_559),
      .D(net_497),
      .X(net_979)
  );

  sky130_fd_sc_hd__and4bb_2 u_8428 (
      .A_N(net_497),
      .B_N(net_584),
      .C(net_559),
      .D(net_643),
      .X(net_776)
  );

  sky130_fd_sc_hd__or4b_2 u_8437 (
      .A(net_497),
      .B(net_643),
      .C(net_584),
      .D_N(net_559),
      .X(net_767)
  );

  sky130_fd_sc_hd__or4b_2 u_8579 (
      .A(net_643),
      .B(net_584),
      .C(net_559),
      .D_N(net_497),
      .X(net_684)
  );

  sky130_fd_sc_hd__nor4_2 u_8592 (
      .A(net_497),
      .B(net_643),
      .C(net_584),
      .D(net_559),
      .Y(net_583)
  );

  sky130_fd_sc_hd__and4bb_2 u_8597 (
      .A_N(net_584),
      .B_N(net_559),
      .C(net_643),
      .D(net_497),
      .X(net_678)
  );

  sky130_fd_sc_hd__or4b_2 u_8604 (
      .A(net_497),
      .B(net_584),
      .C(net_559),
      .D_N(net_643),
      .X(net_638)
  );

  sky130_fd_sc_hd__a31o_2 u_2553 (
      .A1(I),
      .A2(net_604),
      .A3(net_1323),
      .B1(register_08[3]),
      .X(net_1322)
  );

  sky130_fd_sc_hd__nand4_2 u_2622 (
      .A(I),
      .B(net_604),
      .C(register_08[3]),
      .D(net_1323),
      .Y(net_1418)
  );

  sky130_fd_sc_hd__nor2_2 u_2298 (
      .A(net_1220),
      .B(net_1196),
      .Y(net_1191)
  );

  sky130_fd_sc_hd__or4_2 u_2552 (
      .A(register_08[5]),
      .B(net_1163),
      .C(net_1220),
      .D(net_1196),
      .X(net_1221)
  );

  sky130_fd_sc_hd__a31o_2 u_2544 (
      .A1(I),
      .A2(net_604),
      .A3(net_1189),
      .B1(register_08[2]),
      .X(net_1190)
  );

  sky130_fd_sc_hd__nand4_2 u_2782 (
      .A(I),
      .B(net_604),
      .C(register_08[2]),
      .D(net_1189),
      .Y(net_1223)
  );

  sky130_fd_sc_hd__a31o_2 u_72 (
      .A1(I),
      .A2(net_604),
      .A3(net_1131),
      .B1(register_10[0]),
      .X(net_1133)
  );

  sky130_fd_sc_hd__nand4_2 u_2717 (
      .A(I),
      .B(net_604),
      .C(register_10[0]),
      .D(net_1131),
      .Y(net_1108)
  );

  sky130_fd_sc_hd__nand4_2 u_8212 (
      .A(I),
      .B(net_604),
      .C(register_10[7]),
      .D(net_979),
      .Y(net_1013)
  );

  sky130_fd_sc_hd__a31o_2 u_8275 (
      .A1(I),
      .A2(net_604),
      .A3(net_979),
      .B1(register_10[7]),
      .X(net_1011)
  );

  sky130_fd_sc_hd__a31o_2 u_8200 (
      .A1(I),
      .A2(net_604),
      .A3(net_776),
      .B1(register_10[6]),
      .X(net_908)
  );

  sky130_fd_sc_hd__nand4_2 u_8427 (
      .A(I),
      .B(net_604),
      .C(register_10[6]),
      .D(net_776),
      .Y(net_941)
  );

  sky130_fd_sc_hd__or4_2 u_8461 (
      .A(register_10[1]),
      .B(net_938),
      .C(net_767),
      .D(net_779),
      .X(net_787)
  );

  sky130_fd_sc_hd__nor2_2 u_8490 (
      .A(net_767),
      .B(net_779),
      .Y(net_838)
  );

  sky130_fd_sc_hd__or4_2 u_8108 (
      .A(register_11[4]),
      .B(net_699),
      .C(net_684),
      .D(net_674),
      .X(net_655)
  );

  sky130_fd_sc_hd__nor2_2 u_8771 (
      .A(net_684),
      .B(net_674),
      .Y(net_656)
  );

  sky130_fd_sc_hd__nand4_2 u_8581 (
      .A(I),
      .B(net_604),
      .C(register_11[7]),
      .D(net_583),
      .Y(net_491)
  );

  sky130_fd_sc_hd__a31o_2 u_8741 (
      .A1(I),
      .A2(net_604),
      .A3(net_583),
      .B1(register_11[7]),
      .X(net_521)
  );

  sky130_fd_sc_hd__a31o_2 u_8099 (
      .A1(I),
      .A2(net_604),
      .A3(net_678),
      .B1(register_11[2]),
      .X(net_676)
  );

  sky130_fd_sc_hd__nand4_2 u_8203 (
      .A(I),
      .B(net_604),
      .C(register_11[2]),
      .D(net_678),
      .Y(net_669)
  );

  sky130_fd_sc_hd__nor2_2 u_8620 (
      .A(net_638),
      .B(net_637),
      .Y(net_661)
  );

  sky130_fd_sc_hd__or4_2 u_8711 (
      .A(register_11[5]),
      .B(net_635),
      .C(net_638),
      .D(net_637),
      .X(net_640)
  );

  sky130_fd_sc_hd__o21a_2 u_2540 (
      .A1(register_08[1]),
      .A2(net_1418),
      .B1(net_1322),
      .X(net_1420)
  );

  sky130_fd_sc_hd__nand2b_2 u_2572 (
      .A_N(register_08[1]),
      .B(net_1418),
      .Y(net_1368)
  );

  sky130_fd_sc_hd__a21o_2 u_2543 (
      .A1(register_08[4]),
      .A2(net_1191),
      .B1(register_08[5]),
      .X(net_1166)
  );

  sky130_fd_sc_hd__o21a_2 u_2548 (
      .A1(register_08[4]),
      .A2(net_1191),
      .B1(net_1221),
      .X(net_1257)
  );

  sky130_fd_sc_hd__nand2b_2 u_2302 (
      .A_N(register_08[0]),
      .B(net_1223),
      .Y(net_1230)
  );

  sky130_fd_sc_hd__o21a_2 u_2740 (
      .A1(register_08[0]),
      .A2(net_1223),
      .B1(net_1190),
      .X(net_1206)
  );

  sky130_fd_sc_hd__o21a_2 u_75 (
      .A1(register_10[4]),
      .A2(net_1108),
      .B1(net_1133),
      .X(net_1132)
  );

  sky130_fd_sc_hd__nand2b_2 u_8202 (
      .A_N(register_10[4]),
      .B(net_1108),
      .Y(net_1109)
  );

  sky130_fd_sc_hd__nand2b_2 u_8215 (
      .A_N(register_10[2]),
      .B(net_1013),
      .Y(net_1039)
  );

  sky130_fd_sc_hd__o21a_2 u_8211 (
      .A1(register_10[2]),
      .A2(net_1013),
      .B1(net_1011),
      .X(net_1015)
  );

  sky130_fd_sc_hd__o21a_2 u_8190 (
      .A1(register_10[3]),
      .A2(net_941),
      .B1(net_908),
      .X(net_939)
  );

  sky130_fd_sc_hd__nand2b_2 u_8321 (
      .A_N(register_10[3]),
      .B(net_941),
      .Y(net_892)
  );

  sky130_fd_sc_hd__o21a_2 u_8192 (
      .A1(register_10[5]),
      .A2(net_838),
      .B1(net_787),
      .X(net_857)
  );

  sky130_fd_sc_hd__a21o_2 u_8196 (
      .A1(register_10[5]),
      .A2(net_838),
      .B1(register_10[1]),
      .X(net_840)
  );

  sky130_fd_sc_hd__a21o_2 u_8103 (
      .A1(register_11[1]),
      .A2(net_656),
      .B1(register_11[4]),
      .X(net_700)
  );

  sky130_fd_sc_hd__o21a_2 u_8658 (
      .A1(register_11[1]),
      .A2(net_656),
      .B1(net_655),
      .X(net_660)
  );

  sky130_fd_sc_hd__nand2b_2 u_8881 (
      .A_N(register_11[0]),
      .B(net_491),
      .Y(net_440)
  );

  sky130_fd_sc_hd__o21a_2 u_8867 (
      .A1(register_11[0]),
      .A2(net_491),
      .B1(net_521),
      .X(net_522)
  );

  sky130_fd_sc_hd__nand2b_2 u_8201 (
      .A_N(register_11[3]),
      .B(net_669),
      .Y(net_734)
  );

  sky130_fd_sc_hd__o21a_2 u_8695 (
      .A1(register_11[3]),
      .A2(net_669),
      .B1(net_676),
      .X(net_677)
  );

  sky130_fd_sc_hd__a21o_2 u_8583 (
      .A1(register_11[6]),
      .A2(net_661),
      .B1(register_11[5]),
      .X(net_646)
  );

  sky130_fd_sc_hd__o21a_2 u_8600 (
      .A1(register_11[6]),
      .A2(net_661),
      .B1(net_640),
      .X(net_663)
  );

  // Structural connections to module output ports.
  soft_netlist_buf u_output_O_0__2363 (
      .A(net_2363),
      .X(O[0])
  );
  soft_netlist_buf u_output_O_1__1697 (
      .A(net_1697),
      .X(O[1])
  );
  soft_netlist_buf u_output_O_2__1474 (
      .A(net_1474),
      .X(O[2])
  );
  soft_netlist_buf u_output_O_3__1155 (
      .A(net_1155),
      .X(O[3])
  );
  soft_netlist_buf u_output_O_4__1862 (
      .A(net_1862),
      .X(O[4])
  );
  soft_netlist_buf u_output_O_5__673 (
      .A(net_673),
      .X(O[5])
  );
  soft_netlist_buf u_output_O_6__627 (
      .A(net_627),
      .X(O[6])
  );
  soft_netlist_buf u_output_O_7__2361 (
      .A(net_2361),
      .X(O[7])
  );
  soft_netlist_buf u_output_success_2380 (
      .A(register_09[2]),
      .X(success)
  );

  // Recovered sequential standard-cell instances.
  // shift_register: verified shift register
  sky130_fd_sc_hd__dfrtp_2 u_5000_state (
      .CLK(clk),
      .D(net_1584),
      .RESET_B(rst_n),
      .Q(shift_register[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5401_state (
      .CLK(clk),
      .D(net_1544),
      .RESET_B(rst_n),
      .Q(shift_register[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5093_state (
      .CLK(clk),
      .D(net_1597),
      .RESET_B(rst_n),
      .Q(shift_register[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5399_state (
      .CLK(clk),
      .D(net_1464),
      .RESET_B(rst_n),
      .Q(shift_register[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5004_state (
      .CLK(clk),
      .D(net_1354),
      .RESET_B(rst_n),
      .Q(shift_register[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5342_state (
      .CLK(clk),
      .D(net_1279),
      .RESET_B(rst_n),
      .Q(shift_register[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4993_state (
      .CLK(clk),
      .D(net_1351),
      .RESET_B(rst_n),
      .Q(shift_register[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5569_state (
      .CLK(clk),
      .D(net_1214),
      .RESET_B(rst_n),
      .Q(shift_register[7])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5343_state (
      .CLK(clk),
      .D(net_1250),
      .RESET_B(rst_n),
      .Q(shift_register[8])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5344_state (
      .CLK(clk),
      .D(net_1315),
      .RESET_B(rst_n),
      .Q(shift_register[9])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5339_state (
      .CLK(clk),
      .D(net_1412),
      .RESET_B(rst_n),
      .Q(shift_register[10])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5336_state (
      .CLK(clk),
      .D(net_1514),
      .RESET_B(rst_n),
      .Q(shift_register[11])
  );

  // register_02: state/counter register candidate
  sky130_fd_sc_hd__dfxtp_2 u_234_state (
      .CLK(clk),
      .D(net_2332),
      .Q(register_02[0])
  );

  sky130_fd_sc_hd__dfxtp_2 u_235_state (
      .CLK(clk),
      .D(net_2388),
      .Q(register_02[1])
  );

  sky130_fd_sc_hd__dfxtp_2 u_236_state (
      .CLK(clk),
      .D(net_2411),
      .Q(register_02[2])
  );

  sky130_fd_sc_hd__dfxtp_2 u_237_state (
      .CLK(clk),
      .D(net_2317),
      .Q(register_02[3])
  );

  // register_03: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_4659_state (
      .CLK(clk),
      .D(net_1307),
      .RESET_B(rst_n),
      .Q(register_03[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4661_state (
      .CLK(clk),
      .D(net_1568),
      .RESET_B(rst_n),
      .Q(register_03[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4662_state (
      .CLK(clk),
      .D(net_1448),
      .RESET_B(rst_n),
      .Q(register_03[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4838_state (
      .CLK(clk),
      .D(net_1394),
      .RESET_B(rst_n),
      .Q(register_03[3])
  );

  // register_04: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_6435_state (
      .CLK(clk),
      .D(net_921),
      .RESET_B(rst_n),
      .Q(register_04[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6436_state (
      .CLK(clk),
      .D(net_1059),
      .RESET_B(rst_n),
      .Q(register_04[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6442_state (
      .CLK(clk),
      .D(net_827),
      .RESET_B(rst_n),
      .Q(register_04[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6451_state (
      .CLK(clk),
      .D(net_972),
      .RESET_B(rst_n),
      .Q(register_04[3])
  );

  // register_05: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2293_state (
      .CLK(clk),
      .D(net_1800),
      .RESET_B(rst_n),
      .Q(register_05[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2372_state (
      .CLK(clk),
      .D(net_1752),
      .RESET_B(rst_n),
      .Q(register_05[1])
  );

  // register_06: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_5634_state (
      .CLK(clk),
      .D(net_928),
      .RESET_B(rst_n),
      .Q(register_06[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5638_state (
      .CLK(clk),
      .D(net_831),
      .RESET_B(rst_n),
      .Q(register_06[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5639_state (
      .CLK(clk),
      .D(net_1007),
      .RESET_B(rst_n),
      .Q(register_06[2])
  );

  // register_07: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_6095_state (
      .CLK(clk),
      .D(net_458),
      .RESET_B(rst_n),
      .Q(register_07[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6106_state (
      .CLK(clk),
      .D(net_263),
      .RESET_B(rst_n),
      .Q(register_07[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6109_state (
      .CLK(clk),
      .D(net_347),
      .RESET_B(rst_n),
      .Q(register_07[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6111_state (
      .CLK(clk),
      .D(net_555),
      .RESET_B(rst_n),
      .Q(register_07[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6159_state (
      .CLK(clk),
      .D(net_578),
      .RESET_B(rst_n),
      .Q(register_07[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6197_state (
      .CLK(clk),
      .D(net_384),
      .RESET_B(rst_n),
      .Q(register_07[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6198_state (
      .CLK(clk),
      .D(net_297),
      .RESET_B(rst_n),
      .Q(register_07[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6199_state (
      .CLK(clk),
      .D(net_519),
      .RESET_B(rst_n),
      .Q(register_07[7])
  );

  // register_08: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2299_state (
      .CLK(clk),
      .D(net_1230),
      .RESET_B(rst_n),
      .Q(register_08[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2301_state (
      .CLK(clk),
      .D(net_1368),
      .RESET_B(rst_n),
      .Q(register_08[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2542_state (
      .CLK(clk),
      .D(net_1206),
      .RESET_B(rst_n),
      .Q(register_08[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2574_state (
      .CLK(clk),
      .D(net_1420),
      .RESET_B(rst_n),
      .Q(register_08[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2708_state (
      .CLK(clk),
      .D(net_1257),
      .RESET_B(rst_n),
      .Q(register_08[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2710_state (
      .CLK(clk),
      .D(net_1166),
      .RESET_B(rst_n),
      .Q(register_08[5])
  );

  // register_09: decoded state/register vector
  sky130_fd_sc_hd__dfrtp_2 u_226_state (
      .CLK(clk),
      .D(net_2564),
      .RESET_B(rst_n),
      .Q(register_09[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_227_state (
      .CLK(clk),
      .D(net_2501),
      .RESET_B(rst_n),
      .Q(register_09[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_228_state (
      .CLK(clk),
      .D(net_2543),
      .RESET_B(rst_n),
      .Q(register_09[2])
  );

  // register_10: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2709_state (
      .CLK(clk),
      .D(net_1132),
      .RESET_B(rst_n),
      .Q(register_10[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8085_state (
      .CLK(clk),
      .D(net_840),
      .RESET_B(rst_n),
      .Q(register_10[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8086_state (
      .CLK(clk),
      .D(net_1039),
      .RESET_B(rst_n),
      .Q(register_10[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8090_state (
      .CLK(clk),
      .D(net_892),
      .RESET_B(rst_n),
      .Q(register_10[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8091_state (
      .CLK(clk),
      .D(net_1109),
      .RESET_B(rst_n),
      .Q(register_10[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8199_state (
      .CLK(clk),
      .D(net_857),
      .RESET_B(rst_n),
      .Q(register_10[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8214_state (
      .CLK(clk),
      .D(net_939),
      .RESET_B(rst_n),
      .Q(register_10[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8219_state (
      .CLK(clk),
      .D(net_1015),
      .RESET_B(rst_n),
      .Q(register_10[7])
  );

  // register_11: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_8084_state (
      .CLK(clk),
      .D(net_440),
      .RESET_B(rst_n),
      .Q(register_11[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8092_state (
      .CLK(clk),
      .D(net_660),
      .RESET_B(rst_n),
      .Q(register_11[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8095_state (
      .CLK(clk),
      .D(net_677),
      .RESET_B(rst_n),
      .Q(register_11[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8429_state (
      .CLK(clk),
      .D(net_734),
      .RESET_B(rst_n),
      .Q(register_11[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8431_state (
      .CLK(clk),
      .D(net_700),
      .RESET_B(rst_n),
      .Q(register_11[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8591_state (
      .CLK(clk),
      .D(net_646),
      .RESET_B(rst_n),
      .Q(register_11[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8602_state (
      .CLK(clk),
      .D(net_663),
      .RESET_B(rst_n),
      .Q(register_11[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_8815_state (
      .CLK(clk),
      .D(net_522),
      .RESET_B(rst_n),
      .Q(register_11[7])
  );

  // register_12: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2944_state (
      .CLK(clk),
      .D(net_1913),
      .RESET_B(rst_n),
      .Q(register_12[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2946_state (
      .CLK(clk),
      .D(net_1927),
      .RESET_B(rst_n),
      .Q(register_12[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2947_state (
      .CLK(clk),
      .D(net_1713),
      .RESET_B(rst_n),
      .Q(register_12[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2948_state (
      .CLK(clk),
      .D(net_1767),
      .RESET_B(rst_n),
      .Q(register_12[3])
  );

  sky130_fd_sc_hd__dfstp_2 u_2957_state (
      .CLK(clk),
      .D(net_1850),
      .SET_B(rst_n),
      .Q(register_12[4])
  );

  sky130_fd_sc_hd__dfstp_2 u_2958_state (
      .CLK(clk),
      .D(net_1851),
      .SET_B(rst_n),
      .Q(register_12[5])
  );

  sky130_fd_sc_hd__dfstp_2 u_2959_state (
      .CLK(clk),
      .D(net_1844),
      .SET_B(rst_n),
      .Q(register_12[6])
  );

  sky130_fd_sc_hd__dfstp_2 u_2960_state (
      .CLK(clk),
      .D(net_1730),
      .SET_B(rst_n),
      .Q(register_12[7])
  );

  // register_13: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1259_state (
      .CLK(clk),
      .D(net_2531),
      .RESET_B(rst_n),
      .Q(register_13[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1260_state (
      .CLK(clk),
      .D(net_2583),
      .RESET_B(rst_n),
      .Q(register_13[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1261_state (
      .CLK(clk),
      .D(net_2557),
      .RESET_B(rst_n),
      .Q(register_13[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1383_state (
      .CLK(clk),
      .D(net_2489),
      .RESET_B(rst_n),
      .Q(register_13[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1384_state (
      .CLK(clk),
      .D(net_2510),
      .RESET_B(rst_n),
      .Q(register_13[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1385_state (
      .CLK(clk),
      .D(net_2582),
      .RESET_B(rst_n),
      .Q(register_13[5])
  );

  // register_14: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1228_state (
      .CLK(clk),
      .D(net_2307),
      .RESET_B(rst_n),
      .Q(register_14[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1230_state (
      .CLK(clk),
      .D(net_2354),
      .RESET_B(rst_n),
      .Q(register_14[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1258_state (
      .CLK(clk),
      .D(net_2438),
      .RESET_B(rst_n),
      .Q(register_14[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1626_state (
      .CLK(clk),
      .D(net_2464),
      .RESET_B(rst_n),
      .Q(register_14[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1808_state (
      .CLK(clk),
      .D(net_2274),
      .RESET_B(rst_n),
      .Q(register_14[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1810_state (
      .CLK(clk),
      .D(net_2345),
      .RESET_B(rst_n),
      .Q(register_14[5])
  );

  // register_15: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1229_state (
      .CLK(clk),
      .D(net_2240),
      .RESET_B(rst_n),
      .Q(register_15[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1249_state (
      .CLK(clk),
      .D(net_2075),
      .RESET_B(rst_n),
      .Q(register_15[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1250_state (
      .CLK(clk),
      .D(net_1997),
      .RESET_B(rst_n),
      .Q(register_15[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1264_state (
      .CLK(clk),
      .D(net_2160),
      .RESET_B(rst_n),
      .Q(register_15[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1809_state (
      .CLK(clk),
      .D(net_2243),
      .RESET_B(rst_n),
      .Q(register_15[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2036_state (
      .CLK(clk),
      .D(net_2132),
      .RESET_B(rst_n),
      .Q(register_15[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2037_state (
      .CLK(clk),
      .D(net_2097),
      .RESET_B(rst_n),
      .Q(register_15[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2039_state (
      .CLK(clk),
      .D(net_2011),
      .RESET_B(rst_n),
      .Q(register_15[7])
  );

  // register_16: ungrouped one-bit register
  sky130_fd_sc_hd__dfrtp_2 u_4182_state (
      .CLK(clk),
      .D(net_2007),
      .RESET_B(rst_n),
      .Q(register_16)
  );

  // register_17: ungrouped one-bit register
  sky130_fd_sc_hd__dfrtp_2 u_5337_state (
      .CLK(clk),
      .D(net_1466),
      .RESET_B(rst_n),
      .Q(register_17)
  );

endmodule
