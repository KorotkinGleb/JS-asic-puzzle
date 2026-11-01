// Complete PDK-free RTL structurally recovered from the GDS netlist.
// Register grouping is heuristic; standard-cell connectivity is exact.
module recovered_top (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire net_806,  // unlabeled extracted input
    output wire success,
    output wire [7:0] O,
    output reg [11:0] shift_register,  // recovered current state
    output reg [3:0] register_02,  // recovered current state
    output reg [3:0] register_03,  // recovered current state
    output reg [3:0] register_04,  // recovered current state
    output reg [1:0] register_05,  // recovered current state
    output reg [2:0] register_06,  // recovered current state
    output reg [7:0] register_07,  // recovered current state
    output reg [5:0] register_08,  // recovered current state
    output reg [2:0] register_09,  // recovered current state
    output reg [7:0] register_10,  // recovered current state
    output reg [7:0] register_11,  // recovered current state
    output reg [7:0] register_12,  // recovered current state
    output reg [5:0] register_13,  // recovered current state
    output reg [5:0] register_14,  // recovered current state
    output reg [7:0] register_15,  // recovered current state
    output reg register_16,  // recovered current state
    output reg register_17  // recovered current state
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

  // Liberty Boolean functions recovered from standard cells.
  // u_67: sky130_fd_sc_hd__a211oi_2
  assign net_1136 = (!register_02[1]&!register_02[0]&!register_02[3]) | (!register_02[2]&!register_02[0]&!register_02[3]);
  // u_202: sky130_fd_sc_hd__xnor2_2
  assign net_2359 = (!register_02[2]&!register_02[1]) | (register_02[2]&register_02[1]);
  // u_240: sky130_fd_sc_hd__xor2_2
  assign net_1947 = (register_12[1]&!register_12[0]) | (!register_12[1]&register_12[0]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_02[3]) | (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_385: sky130_fd_sc_hd__inv_2
  assign net_2356 = (!register_09[2]);
  // u_395: sky130_fd_sc_hd__or2_2
  assign net_2564 = (register_16) | (register_09[0]);
  // u_406: sky130_fd_sc_hd__nand2b_2
  assign net_2520 = (register_09[0]) | (!register_16);
  // u_494: sky130_fd_sc_hd__nand3_2
  assign net_2316 = (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_500: sky130_fd_sc_hd__a21o_2
  assign net_2330 = (register_02[2]&register_02[1]) | (register_02[0]);
  // u_624: sky130_fd_sc_hd__inv_2
  assign net_2311 = (!register_02[3]);
  // u_1246: sky130_fd_sc_hd__and4bb_2
  assign net_2419 = (!register_03[2]&!register_03[1]&register_03[0]&register_03[3]);
  // u_1248: sky130_fd_sc_hd__and4b_2
  assign net_2418 = (!register_03[1]&register_03[0]&register_03[2]&register_03[3]);
  // u_1262: sky130_fd_sc_hd__and2b_2
  assign net_1505 = (!register_13[0]&register_13[3]);
  // u_1323: sky130_fd_sc_hd__and4bb_2
  assign net_2612 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_1370: sky130_fd_sc_hd__and4bb_2
  assign net_2533 = (!register_03[3]&!register_03[0]&register_03[1]&register_03[2]);
  // u_1376: sky130_fd_sc_hd__and2b_2
  assign net_1509 = (!register_14[2]&register_14[3]);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_13[2]);
  // u_1451: sky130_fd_sc_hd__or4b_2
  assign net_2478 = (register_03[3]) | (register_03[2]) | (register_03[0]) | (!register_03[1]);
  // u_1591: sky130_fd_sc_hd__and2b_2
  assign net_1501 = (!register_13[1]&register_13[5]);
  // u_1630: sky130_fd_sc_hd__and2b_2
  assign net_1507 = (!register_14[1]&register_14[5]);
  // u_1770: sky130_fd_sc_hd__or4b_2
  assign net_2074 = (register_03[2]) | (register_03[1]) | (register_03[0]) | (!register_03[3]);
  // u_1775: sky130_fd_sc_hd__and2b_2
  assign net_1510 = (!register_14[0]&register_14[4]);
  // u_1788: sky130_fd_sc_hd__and4bb_2
  assign net_2185 = (!register_03[1]&!register_03[0]&register_03[2]&register_03[3]);
  // u_1803: sky130_fd_sc_hd__or4b_2
  assign net_2229 = (register_03[3]) | (register_03[2]) | (register_03[1]) | (!register_03[0]);
  // u_1807: sky130_fd_sc_hd__and4bb_2
  assign net_2277 = (!register_03[3]&!register_03[1]&register_03[0]&register_03[2]);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!register_15[4]);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!register_15[6]);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!register_15[2]);
  // u_2107: sky130_fd_sc_hd__and2b_2
  assign net_1541 = (!register_15[3]&register_15[5]);
  // u_2364: sky130_fd_sc_hd__and2b_2
  assign net_1542 = (!register_05[0]&register_05[1]);
  // u_2365: sky130_fd_sc_hd__nor4_2
  assign net_1876 = (!register_03[3]&!register_03[2]&!register_03[1]&!register_03[0]);
  // u_2396: sky130_fd_sc_hd__or4b_2
  assign net_1972 = (register_03[3]) | (register_03[1]) | (register_03[0]) | (!register_03[2]);
  // u_2555: sky130_fd_sc_hd__and2b_2
  assign net_163 = (!register_08[2]&register_08[0]);
  // u_2571: sky130_fd_sc_hd__and2b_2
  assign net_161 = (!register_08[3]&register_08[1]);
  // u_2711: sky130_fd_sc_hd__inv_2
  assign net_1163 = (!register_08[4]);
  // u_2843: sky130_fd_sc_hd__and2b_2
  assign net_104 = (!register_10[0]&register_10[4]);
  // u_2928: sky130_fd_sc_hd__inv_2
  assign net_1429 = (!register_02[1]);
  // u_2935: sky130_fd_sc_hd__o21ai_2
  assign net_1268 = (!register_02[2]&!register_02[0]) | (!register_02[3]);
  // u_2937: sky130_fd_sc_hd__inv_2
  assign net_1370 = (!register_02[3]);
  // u_2938: sky130_fd_sc_hd__nand2b_2
  assign net_1179 = (register_02[1]) | (!register_02[2]);
  // u_2950: sky130_fd_sc_hd__and3_2
  assign net_1820 = (register_02[1]&register_02[2]&register_02[0]);
  // u_2953: sky130_fd_sc_hd__nor3b_2
  assign net_1373 = (!register_02[1]&!register_02[0]&register_02[2]);
  // u_2967: sky130_fd_sc_hd__xor2_2
  assign net_1732 = (register_12[1]&!register_12[7]) | (!register_12[1]&register_12[7]);
  // u_3167: sky130_fd_sc_hd__xor2_2
  assign net_1683 = (register_12[6]&!register_12[3]) | (!register_12[6]&register_12[3]);
  // u_3282: sky130_fd_sc_hd__xnor2_2
  assign net_1726 = (!register_12[4]&!register_12[5]) | (register_12[4]&register_12[5]);
  // u_3287: sky130_fd_sc_hd__or3b_2
  assign net_1700 = (register_02[1]) | (register_02[0]) | (!register_02[2]);
  // u_3289: sky130_fd_sc_hd__xnor2_2
  assign net_1814 = (!register_12[3]&!register_12[1]) | (register_12[3]&register_12[1]);
  // u_3295: sky130_fd_sc_hd__xnor2_2
  assign net_1817 = (!register_12[5]&!register_12[7]) | (register_12[5]&register_12[7]);
  // u_3296: sky130_fd_sc_hd__xor2_2
  assign net_1978 = (register_12[4]&!register_12[0]) | (!register_12[4]&register_12[0]);
  // u_3478: sky130_fd_sc_hd__nand2b_2
  assign net_1878 = (register_02[2]) | (!register_02[1]);
  // u_3484: sky130_fd_sc_hd__and2b_2
  assign net_1627 = (!register_02[1]&register_02[2]);
  // u_3531: sky130_fd_sc_hd__nor2_2
  assign net_1618 = (!register_02[1]&!register_02[2]);
  // u_3533: sky130_fd_sc_hd__nor2_2
  assign net_1786 = (!register_02[0]&!register_02[3]);
  // u_3576: sky130_fd_sc_hd__nand2_2
  assign net_1669 = (!register_02[2]) | (!register_02[3]);
  // u_3669: sky130_fd_sc_hd__inv_2
  assign net_1644 = (!register_02[3]);
  // u_3701: sky130_fd_sc_hd__nand2_2
  assign net_1648 = (!register_02[1]) | (!register_02[2]);
  // u_3715: sky130_fd_sc_hd__or2_2
  assign net_1629 = (register_02[2]) | (register_02[0]);
  // u_3852: sky130_fd_sc_hd__and2b_2
  assign net_1374 = (!register_02[2]&register_02[1]);
  // u_3873: sky130_fd_sc_hd__nor2_2
  assign net_1522 = (!register_02[1]&!register_02[2]);
  // u_3900: sky130_fd_sc_hd__and3_2
  assign net_1372 = (register_02[1]&register_02[2]&register_02[0]);
  // u_3978: sky130_fd_sc_hd__a21oi_2
  assign net_1199 = (!register_02[1]&!register_02[0]) | (!register_02[3]&!register_02[0]);
  // u_3980: sky130_fd_sc_hd__mux2_1
  assign net_1175 = (register_02[2]&!register_02[0]) | (register_02[3]&register_02[0]);
  // u_4002: sky130_fd_sc_hd__and3b_2
  assign net_1231 = (!register_02[3]&register_02[0]&register_02[2]);
  // u_4023: sky130_fd_sc_hd__and2b_2
  assign net_1177 = (!register_02[2]&register_02[1]);
  // u_4052: sky130_fd_sc_hd__or2_2
  assign net_1176 = (register_02[0]) | (register_02[3]);
  // u_4070: sky130_fd_sc_hd__and2b_2
  assign net_1431 = (!register_02[0]&register_02[2]);
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_5532: sky130_fd_sc_hd__inv_2
  assign net_1361 = (!register_17);
  // u_5612: sky130_fd_sc_hd__or3_2
  assign net_480 = (register_07[3]) | (register_07[0]) | (register_07[4]);
  // u_5628: sky130_fd_sc_hd__nand2_2
  assign net_341 = (!register_07[6]) | (!register_07[5]);
  // u_5636: sky130_fd_sc_hd__inv_2
  assign net_929 = (!register_06[0]);
  // u_5680: sky130_fd_sc_hd__or4bb_2
  assign net_1002 = (register_03[2]) | (register_03[0]) | (!register_03[1]) | (!register_03[3]);
  // u_5681: sky130_fd_sc_hd__or4_2
  assign net_1029 = (register_03[2]) | (register_03[3]) | (register_03[0]) | (register_03[1]);
  // u_5684: sky130_fd_sc_hd__or2_2
  assign net_976 = (register_06[2]) | (I);
  // u_5711: sky130_fd_sc_hd__nand2_2
  assign net_930 = (!register_06[2]) | (!I);
  // u_5836: sky130_fd_sc_hd__inv_2
  assign net_855 = (!register_06[1]);
  // u_6032: sky130_fd_sc_hd__and2_2
  assign net_457 = (register_07[6]&register_07[5]);
  // u_6094: sky130_fd_sc_hd__and2b_2
  assign net_488 = (!register_07[2]&register_07[3]);
  // u_6194: sky130_fd_sc_hd__and4bb_2
  assign net_537 = (!register_07[1]&!register_07[4]&register_07[7]&register_07[0]);
  // u_6350: sky130_fd_sc_hd__and3_2
  assign net_478 = (register_07[2]&register_07[1]&register_07[0]);
  // u_6472: sky130_fd_sc_hd__nand3b_2
  assign net_820 = (register_04[1]) | (!register_04[0]) | (!register_04[3]);
  // u_6950: sky130_fd_sc_hd__xor2_2
  assign net_236 = (register_04[2]&!register_04[1]) | (!register_04[2]&register_04[1]);
  // u_6956: sky130_fd_sc_hd__nand2_2
  assign net_350 = (!register_04[2]) | (!register_04[1]);
  // u_6969: sky130_fd_sc_hd__nand2b_2
  assign net_783 = (register_02[1]) | (!register_02[0]);
  // u_6970: sky130_fd_sc_hd__nand2_2
  assign net_951 = (!register_02[0]) | (!register_02[3]);
  // u_6971: sky130_fd_sc_hd__nor2_2
  assign net_1040 = (!register_02[2]&!register_02[3]);
  // u_6973: sky130_fd_sc_hd__and4b_2
  assign net_1083 = (!register_02[3]&register_02[0]&register_02[2]&register_02[1]);
  // u_6975: sky130_fd_sc_hd__and2b_2
  assign net_752 = (!register_02[2]&register_02[0]);
  // u_6990: sky130_fd_sc_hd__nor4b_2
  assign net_1041 = (!register_02[1]&!register_02[2]&!register_02[0]&register_02[3]);
  // u_6995: sky130_fd_sc_hd__nand2b_2
  assign net_785 = (register_02[0]) | (!register_02[3]);
  // u_7057: sky130_fd_sc_hd__a21oi_2
  assign net_1082 = (!register_02[1]&!register_02[3]) | (!register_02[2]&!register_02[3]);
  // u_7104: sky130_fd_sc_hd__nand2b_2
  assign net_808 = (register_02[3]) | (!register_02[0]);
  // u_7153: sky130_fd_sc_hd__a21oi_2
  assign net_803 = (!register_02[1]&!register_02[3]) | (!register_02[2]&!register_02[3]);
  // u_7169: sky130_fd_sc_hd__nand2_2
  assign net_898 = (!register_02[1]) | (!register_02[2]);
  // u_7216: sky130_fd_sc_hd__and4bb_2
  assign net_1117 = (!register_02[0]&!register_02[3]&register_02[1]&register_02[2]);
  // u_7238: sky130_fd_sc_hd__nor3_2
  assign net_1080 = (!register_02[1]&!register_02[2]&!register_02[0]);
  // u_7287: sky130_fd_sc_hd__and2b_2
  assign net_790 = (!register_02[0]&register_02[1]);
  // u_7301: sky130_fd_sc_hd__nand2b_2
  assign net_764 = (register_02[0]) | (!register_02[1]);
  // u_7317: sky130_fd_sc_hd__and2_2
  assign net_770 = (register_02[1]&register_02[2]);
  // u_7335: sky130_fd_sc_hd__nor2_2
  assign net_805 = (!register_02[1]&!register_02[2]);
  // u_7465: sky130_fd_sc_hd__nand2_2
  assign net_302 = (!register_04[3]) | (!register_04[1]);
  // u_7548: sky130_fd_sc_hd__a21oi_2
  assign net_324 = (!register_04[3]&!register_04[1]) | (!register_04[0]&!register_04[1]);
  // u_7566: sky130_fd_sc_hd__xnor2_2
  assign net_349 = (!register_04[3]&!register_04[0]) | (register_04[3]&register_04[0]);
  // u_8106: sky130_fd_sc_hd__inv_2
  assign net_699 = (!register_11[1]);
  // u_8218: sky130_fd_sc_hd__and2b_2
  assign net_102 = (!register_10[7]&register_10[2]);
  // u_8290: sky130_fd_sc_hd__inv_2
  assign net_938 = (!register_10[5]);
  // u_8325: sky130_fd_sc_hd__and2b_2
  assign net_105 = (!register_10[6]&register_10[3]);
  // u_8408: sky130_fd_sc_hd__and2b_2
  assign net_194 = (!register_11[2]&register_11[3]);
  // u_8590: sky130_fd_sc_hd__and2b_2
  assign net_195 = (!register_11[7]&register_11[0]);
  // u_8660: sky130_fd_sc_hd__inv_2
  assign net_635 = (!register_11[6]);
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
  // u_3012: sky130_fd_sc_hd__xnor2_2
  assign net_1635 = (!register_12[6]&!net_1947) | (register_12[6]&net_1947);
  // u_198: sky130_fd_sc_hd__and2_2
  assign net_1911 = (register_09[0]&net_2302);
  // u_199: sky130_fd_sc_hd__a21boi_2
  assign net_2388 = (!register_02[1]&register_09[0]) | (!net_2302&register_09[0]);
  // u_341: sky130_fd_sc_hd__a21boi_2
  assign net_2411 = (!net_2302&register_09[0]) | (!net_2359&register_09[0]);
  // u_608: sky130_fd_sc_hd__o211a_2
  assign net_2332 = (register_02[3]&net_2330&register_09[0]) | (net_2316&net_2330&register_09[0]);
  // u_215: sky130_fd_sc_hd__a21boi_2
  assign net_2317 = (!net_2311&register_09[0]) | (!net_2316&register_09[0]);
  // u_1560: sky130_fd_sc_hd__and2_2
  assign net_1502 = (register_13[4]&net_2490);
  // u_1776: sky130_fd_sc_hd__and2_2
  assign net_1504 = (register_15[0]&net_2261);
  // u_1794: sky130_fd_sc_hd__and2_2
  assign net_1538 = (register_15[1]&net_2129);
  // u_1982: sky130_fd_sc_hd__and2_2
  assign net_1543 = (register_15[7]&net_2008);
  // u_2561: sky130_fd_sc_hd__and2_2
  assign net_160 = (register_08[5]&net_1163);
  // u_2933: sky130_fd_sc_hd__o211a_2
  assign net_1426 = (net_1429&net_1370&register_02[2]) | (register_02[0]&net_1370&register_02[2]);
  // u_2925: sky130_fd_sc_hd__xnor2_2
  assign net_1610 = (!register_02[3]&!net_1820) | (register_02[3]&net_1820);
  // u_2963: sky130_fd_sc_hd__xnor2_2
  assign net_1731 = (!register_12[2]&!net_1732) | (register_12[2]&net_1732);
  // u_3278: sky130_fd_sc_hd__xnor2_2
  assign net_1725 = (!register_12[2]&!net_1726) | (register_12[2]&net_1726);
  // u_3283: sky130_fd_sc_hd__xnor2_2
  assign net_1912 = (!net_1726&!net_1947) | (net_1726&net_1947);
  // u_3017: sky130_fd_sc_hd__xnor2_2
  assign net_1808 = (!register_12[2]&!net_1814) | (register_12[2]&net_1814);
  // u_2949: sky130_fd_sc_hd__xnor2_2
  assign net_1612 = (!net_1814&!net_1817) | (net_1814&net_1817);
  // u_3276: sky130_fd_sc_hd__nand2_2
  assign net_1625 = (!register_02[0]) | (!net_1627);
  // u_174: sky130_fd_sc_hd__a22o_2
  assign net_1917 = (net_1878&register_02[0]) | (register_02[1]&net_1786);
  // u_2961: sky130_fd_sc_hd__a211o_2
  assign net_1658 = (register_02[1]&register_02[0]) | (net_1644) | (net_1627);
  // u_3685: sky130_fd_sc_hd__nor2_2
  assign net_1645 = (!register_02[1]&!net_1644);
  // u_3816: sky130_fd_sc_hd__and2b_2
  assign net_1630 = (!net_1618&net_1648);
  // u_2968: sky130_fd_sc_hd__a22oi_2
  assign net_1646 = (!register_02[1]&!net_1629) | (!register_02[1]&!net_1648) | (!net_1644&!net_1629) | (!net_1644&!net_1648);
  // u_3015: sky130_fd_sc_hd__xor2_2
  assign net_1759 = (register_12[0]&!net_1629) | (!register_12[0]&net_1629);
  // u_2941: sky130_fd_sc_hd__o31a_2
  assign net_1380 = (net_1372&net_1370) | (net_1374&net_1370) | (net_1373&net_1370);
  // u_3858: sky130_fd_sc_hd__o21a_2
  assign net_1436 = (net_1429&net_1370) | (net_1372&net_1370);
  // u_3976: sky130_fd_sc_hd__nor2_2
  assign net_1198 = (!register_02[3]&!net_1177);
  // u_3984: sky130_fd_sc_hd__and3b_2
  assign net_1232 = (!register_02[3]&net_1177&register_02[0]);
  // u_2936: sky130_fd_sc_hd__and2b_2
  assign net_1173 = (!net_1176&net_1179);
  // u_3968: sky130_fd_sc_hd__a21oi_2
  assign net_1174 = (!net_1176&!net_1175) | (!net_1177&!net_1175);
  // u_4127: sky130_fd_sc_hd__nand2_2
  assign net_1235 = (!register_02[1]) | (!net_1176);
  // u_2926: sky130_fd_sc_hd__a21oi_2
  assign net_1554 = (!register_02[1]&!register_02[3]) | (!net_1431&!register_02[3]);
  // u_2932: sky130_fd_sc_hd__and3_2
  assign net_1427 = (register_02[1]&net_1370&net_1431);
  // u_2955: sky130_fd_sc_hd__a2111oi_2
  assign net_1523 = (!register_02[1]&!register_02[3]&!net_1431&!net_1522) | (!register_02[0]&!register_02[3]&!net_1431&!net_1522);
  // u_5630: sky130_fd_sc_hd__inv_2
  assign net_907 = (!net_873);
  // u_1231: sky130_fd_sc_hd__nand2_2
  assign net_2280 = (!I) | (!net_604);
  // u_1232: sky130_fd_sc_hd__a31o_2
  assign net_2301 = (I&net_604&net_2277) | (register_14[0]);
  // u_1234: sky130_fd_sc_hd__a31o_2
  assign net_2377 = (I&net_604&net_2419) | (register_14[1]);
  // u_1255: sky130_fd_sc_hd__nand2_2
  assign net_2073 = (!I) | (!net_604);
  // u_1286: sky130_fd_sc_hd__a31o_2
  assign net_2554 = (I&net_604&net_2533) | (register_13[0]);
  // u_1287: sky130_fd_sc_hd__a31o_2
  assign net_2611 = (I&net_604&net_2612) | (register_13[1]);
  // u_1362: sky130_fd_sc_hd__nand2_2
  assign net_2479 = (!I) | (!net_604);
  // u_1364: sky130_fd_sc_hd__nand4_2
  assign net_2584 = (!I) | (!net_604) | (!register_13[1]) | (!net_2612);
  // u_1365: sky130_fd_sc_hd__nand4_2
  assign net_2530 = (!I) | (!net_604) | (!register_13[0]) | (!net_2533);
  // u_1381: sky130_fd_sc_hd__nand4_2
  assign net_2441 = (!I) | (!net_604) | (!register_14[2]) | (!net_2418);
  // u_1635: sky130_fd_sc_hd__a31o_2
  assign net_2440 = (I&net_604&net_2418) | (register_14[2]);
  // u_1641: sky130_fd_sc_hd__nand4_2
  assign net_2344 = (!I) | (!net_604) | (!register_14[1]) | (!net_2419);
  // u_1772: sky130_fd_sc_hd__nand4_2
  assign net_2275 = (!I) | (!net_604) | (!register_14[0]) | (!net_2277);
  // u_2034: sky130_fd_sc_hd__nand4_2
  assign net_2154 = (!I) | (!net_604) | (!register_15[3]) | (!net_2185);
  // u_2049: sky130_fd_sc_hd__a31o_2
  assign net_2184 = (I&net_604&net_2185) | (register_15[3]);
  // u_2296: sky130_fd_sc_hd__nand2_2
  assign net_1196 = (!I) | (!net_604);
  // u_2361: sky130_fd_sc_hd__a31o_2
  assign net_1842 = (I&net_604&net_1876) | (register_05[0]);
  // u_2369: sky130_fd_sc_hd__nand4_2
  assign net_1796 = (!I) | (!net_604) | (!register_05[0]) | (!net_1876);
  // u_2370: sky130_fd_sc_hd__nand2_2
  assign net_1971 = (!I) | (!net_604);
  // u_4660: sky130_fd_sc_hd__and3_2
  assign net_1303 = (register_03[3]&register_03[2]&net_604);
  // u_4837: sky130_fd_sc_hd__a21oi_2
  assign net_1453 = (!register_03[2]&!register_03[3]) | (!net_604&!register_03[3]);
  // u_4859: sky130_fd_sc_hd__xnor2_2
  assign net_1497 = (!register_03[2]&!net_604) | (register_03[2]&net_604);
  // u_4863: sky130_fd_sc_hd__a41oi_2
  assign net_1535 = (!register_03[3]&!register_03[1]) | (!register_03[2]&!register_03[1]) | (!register_03[0]&!register_03[1]) | (!net_604&!register_03[1]);
  // u_4949: sky130_fd_sc_hd__and4_2
  assign net_1391 = (register_03[3]&register_03[2]&register_03[0]&net_604);
  // u_5007: sky130_fd_sc_hd__mux2_1
  assign net_1597 = (shift_register[2]&!net_604) | (shift_register[1]&net_604);
  // u_5008: sky130_fd_sc_hd__mux2_1
  assign net_1544 = (shift_register[1]&!net_604) | (shift_register[0]&net_604);
  // u_5011: sky130_fd_sc_hd__mux2_1
  assign net_1464 = (shift_register[3]&!net_604) | (shift_register[2]&net_604);
  // u_5205: sky130_fd_sc_hd__mux2_1
  assign net_1279 = (shift_register[5]&!net_604) | (shift_register[4]&net_604);
  // u_5263: sky130_fd_sc_hd__mux2_1
  assign net_1351 = (shift_register[6]&!net_604) | (shift_register[5]&net_604);
  // u_5265: sky130_fd_sc_hd__mux2_1
  assign net_1214 = (shift_register[7]&!net_604) | (shift_register[6]&net_604);
  // u_5340: sky130_fd_sc_hd__mux2_1
  assign net_1584 = (shift_register[0]&!net_604) | (I&net_604);
  // u_5347: sky130_fd_sc_hd__mux2_1
  assign net_1412 = (shift_register[10]&!net_604) | (shift_register[9]&net_604);
  // u_5400: sky130_fd_sc_hd__mux2_1
  assign net_1514 = (shift_register[11]&!net_604) | (shift_register[10]&net_604);
  // u_5403: sky130_fd_sc_hd__mux2_1
  assign net_1315 = (shift_register[9]&!net_604) | (shift_register[8]&net_604);
  // u_5433: sky130_fd_sc_hd__mux2_1
  assign net_1354 = (shift_register[4]&!net_604) | (shift_register[3]&net_604);
  // u_5537: sky130_fd_sc_hd__mux2_1
  assign net_1250 = (shift_register[8]&!net_604) | (shift_register[7]&net_604);
  // u_5775: sky130_fd_sc_hd__inv_2
  assign net_1005 = (!net_604);
  // u_6160: sky130_fd_sc_hd__a21oi_2
  assign net_533 = (!I&!register_07[3]) | (!net_604&!register_07[3]);
  // u_6166: sky130_fd_sc_hd__and3_2
  assign net_477 = (register_07[3]&I&net_604);
  // u_6403: sky130_fd_sc_hd__a31o_2
  assign net_918 = (net_873&net_604&register_04[2]) | (register_04[3]);
  // u_6404: sky130_fd_sc_hd__and4_2
  assign net_968 = (net_873&net_604&register_04[3]&register_04[2]);
  // u_6445: sky130_fd_sc_hd__nand2_2
  assign net_879 = (!net_873) | (!net_604);
  // u_8191: sky130_fd_sc_hd__nand2_2
  assign net_779 = (!I) | (!net_604);
  // u_8574: sky130_fd_sc_hd__nand2_2
  assign net_637 = (!I) | (!net_604);
  // u_8576: sky130_fd_sc_hd__nand2_2
  assign net_674 = (!I) | (!net_604);
  // u_247: sky130_fd_sc_hd__inv_2
  assign net_2522 = (!net_1361);
  // u_5616: sky130_fd_sc_hd__nor3_2
  assign net_340 = (!register_07[5]&!register_07[7]&!net_480);
  // u_5789: sky130_fd_sc_hd__buf_2
  assign net_978 = (net_1029);
  // u_5677: sky130_fd_sc_hd__o211a_2
  assign net_1004 = (register_06[0]&net_976&net_604) | (net_930&net_976&net_604);
  // u_5683: sky130_fd_sc_hd__mux2_1
  assign net_882 = (net_930&!register_06[0]) | (net_976&register_06[0]);
  // u_6092: sky130_fd_sc_hd__and3_2
  assign net_581 = (net_537&net_488&net_457);
  // u_6441: sky130_fd_sc_hd__and3_2
  assign net_876 = (net_873&net_604&net_820);
  // u_6609: sky130_fd_sc_hd__nor2_2
  assign net_821 = (!register_04[2]&!net_820);
  // u_6953: sky130_fd_sc_hd__nand2_2
  assign net_235 = (!register_04[0]) | (!net_236);
  // u_7567: sky130_fd_sc_hd__xor2_2
  assign net_326 = (register_04[0]&!net_236) | (!register_04[0]&net_236);
  // u_7311: sky130_fd_sc_hd__and2_2
  assign net_786 = (register_02[2]&net_783);
  // u_63: sky130_fd_sc_hd__a211o_2
  assign net_1135 = (register_02[2]&net_1136) | (net_1041) | (net_1083);
  // u_7237: sky130_fd_sc_hd__a21o_2
  assign net_1042 = (register_02[1]&net_1040) | (net_1041);
  // u_6989: sky130_fd_sc_hd__o22a_2
  assign net_1079 = (register_02[2]&net_1082) | (register_02[0]&net_1082) | (register_02[2]&net_1083) | (register_02[0]&net_1083);
  // u_7006: sky130_fd_sc_hd__or3_2
  assign net_1124 = (net_1082) | (net_1083) | (net_1041);
  // u_6991: sky130_fd_sc_hd__a31oi_2
  assign net_766 = (!net_806&!net_803) | (!net_785&!net_803) | (!net_808&!net_803);
  // u_7230: sky130_fd_sc_hd__nor2_2
  assign net_984 = (!register_02[3]&!net_898);
  // u_7252: sky130_fd_sc_hd__and2_2
  assign net_956 = (net_898&net_951);
  // u_7259: sky130_fd_sc_hd__a31o_2
  assign net_1078 = (register_02[1]&register_02[0]&net_1040) | (net_1080);
  // u_7091: sky130_fd_sc_hd__a311o_2
  assign net_771 = (net_806&net_785&net_808) | (net_790) | (net_803);
  // u_7291: sky130_fd_sc_hd__a21o_2
  assign net_801 = (net_783&net_764) | (register_02[2]);
  // u_6974: sky130_fd_sc_hd__o22a_2
  assign net_949 = (register_02[3]&net_951) | (net_898&net_951) | (register_02[3]&net_805) | (net_898&net_805);
  // u_6976: sky130_fd_sc_hd__nor3_2
  assign net_765 = (!register_02[0]&!net_805&!net_770);
  // u_7314: sky130_fd_sc_hd__and3b_2
  assign net_802 = (!net_805&net_783&net_803);
  // u_7454: sky130_fd_sc_hd__nor2_2
  assign net_275 = (!net_350&!net_349);
  // u_8197: sky130_fd_sc_hd__and2_2
  assign net_193 = (register_11[4]&net_699);
  // u_8367: sky130_fd_sc_hd__and2_2
  assign net_127 = (register_10[1]&net_938);
  // u_8575: sky130_fd_sc_hd__and2_2
  assign net_168 = (register_11[5]&net_635);
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
  // u_743: sky130_fd_sc_hd__nand2b_2
  assign net_2016 = (net_604) | (!net_1911);
  // u_882: sky130_fd_sc_hd__or2_2
  assign net_1846 = (net_1911) | (net_604);
  // u_3483: sky130_fd_sc_hd__nor2_2
  assign net_1882 = (!net_1911&!net_604);
  // u_3518: sky130_fd_sc_hd__and2b_2
  assign net_1787 = (!net_604&net_1911);
  // u_5230: sky130_fd_sc_hd__and3_2
  assign net_1500 = (net_1505&net_1502&net_1501);
  // u_5225: sky130_fd_sc_hd__and4_2
  assign net_1506 = (net_1510&net_1504&net_1509&net_1507);
  // u_5010: sky130_fd_sc_hd__and4_2
  assign net_1539 = (net_1543&net_1542&net_1541&net_1538);
  // u_6809: sky130_fd_sc_hd__and3_2
  assign net_192 = (net_163&net_160&net_161);
  // u_3809: sky130_fd_sc_hd__nand2_2
  assign net_1611 = (!net_1629) | (!net_1610);
  // u_142: sky130_fd_sc_hd__or2_2
  assign net_1782 = (register_12[4]) | (net_1808);
  // u_173: sky130_fd_sc_hd__nand2_2
  assign net_1788 = (!register_12[4]) | (!net_1808);
  // u_3014: sky130_fd_sc_hd__xor2_2
  assign net_1673 = (register_12[6]&!net_1808) | (!register_12[6]&net_1808);
  // u_2954: sky130_fd_sc_hd__nor3b_2
  assign net_1634 = (!net_604&!net_1635&net_1612);
  // u_2956: sky130_fd_sc_hd__a21boi_2
  assign net_1621 = (!I&net_604) | (!net_1612&net_604);
  // u_3821: sky130_fd_sc_hd__nor2_2
  assign net_1613 = (!net_604&!net_1612);
  // u_3708: sky130_fd_sc_hd__inv_2
  assign net_1650 = (!net_1625);
  // u_3297: sky130_fd_sc_hd__xnor2_2
  assign net_1919 = (!register_12[2]&!net_1917) | (register_12[2]&net_1917);
  // u_3315: sky130_fd_sc_hd__or3_2
  assign net_1783 = (net_1645) | (net_1618) | (net_1786);
  // u_3636: sky130_fd_sc_hd__a21oi_2
  assign net_1670 = (!net_1625&!net_1645) | (!net_1669&!net_1645);
  // u_3660: sky130_fd_sc_hd__a22o_2
  assign net_1695 = (net_1610&net_1700) | (net_1645&net_1629);
  // u_3703: sky130_fd_sc_hd__o31a_2
  assign net_1714 = (register_02[0]&net_1669) | (net_1645&net_1669) | (net_1627&net_1669);
  // u_3712: sky130_fd_sc_hd__nor2_2
  assign net_1631 = (!register_02[0]&!net_1630);
  // u_3279: sky130_fd_sc_hd__a31o_2
  assign net_1649 = (register_02[0]&net_1644&net_1648) | (net_1646);
  // u_2939: sky130_fd_sc_hd__o221a_2
  assign net_1200 = (net_1176&net_1198&net_1179) | (net_1177&net_1198&net_1179) | (net_1176&net_1199&net_1179) | (net_1177&net_1199&net_1179);
  // u_2940: sky130_fd_sc_hd__o211a_2
  assign net_1293 = (register_02[2]&net_1235&net_1268) | (net_1176&net_1235&net_1268);
  // u_2942: sky130_fd_sc_hd__o21a_2
  assign net_1331 = (register_02[2]&net_1268) | (net_1235&net_1268);
  // u_1244: sky130_fd_sc_hd__or4_2
  assign net_2245 = (register_15[0]) | (net_2261) | (net_2229) | (net_2280);
  // u_1798: sky130_fd_sc_hd__nor2_2
  assign net_2242 = (!net_2229&!net_2280);
  // u_1252: sky130_fd_sc_hd__or4_2
  assign net_2072 = (register_15[1]) | (net_2129) | (net_2074) | (net_2073);
  // u_2143: sky130_fd_sc_hd__nor2_2
  assign net_2070 = (!net_2074&!net_2073);
  // u_1363: sky130_fd_sc_hd__or4_2
  assign net_2483 = (register_13[4]) | (net_2490) | (net_2478) | (net_2479);
  // u_1377: sky130_fd_sc_hd__nor2_2
  assign net_2477 = (!net_2478&!net_2479);
  // u_1570: sky130_fd_sc_hd__nand2b_2
  assign net_2582 = (register_13[5]) | (!net_2584);
  // u_1579: sky130_fd_sc_hd__o21a_2
  assign net_2583 = (register_13[5]&net_2611) | (net_2584&net_2611);
  // u_1366: sky130_fd_sc_hd__o21a_2
  assign net_2531 = (register_13[3]&net_2554) | (net_2530&net_2554);
  // u_1569: sky130_fd_sc_hd__nand2b_2
  assign net_2489 = (register_13[3]) | (!net_2530);
  // u_1675: sky130_fd_sc_hd__nand2b_2
  assign net_2464 = (register_14[3]) | (!net_2441);
  // u_1611: sky130_fd_sc_hd__o21a_2
  assign net_2438 = (register_14[3]&net_2440) | (net_2441&net_2440);
  // u_1235: sky130_fd_sc_hd__o21a_2
  assign net_2354 = (register_14[5]&net_2377) | (net_2344&net_2377);
  // u_1240: sky130_fd_sc_hd__nand2b_2
  assign net_2345 = (register_14[5]) | (!net_2344);
  // u_1790: sky130_fd_sc_hd__o21a_2
  assign net_2307 = (register_14[4]&net_2301) | (net_2275&net_2301);
  // u_1959: sky130_fd_sc_hd__nand2b_2
  assign net_2274 = (register_14[4]) | (!net_2275);
  // u_1792: sky130_fd_sc_hd__nand2b_2
  assign net_2132 = (register_15[5]) | (!net_2154);
  // u_1780: sky130_fd_sc_hd__o21a_2
  assign net_2160 = (register_15[5]&net_2184) | (net_2154&net_2184);
  // u_2363: sky130_fd_sc_hd__o21a_2
  assign net_1800 = (register_05[1]&net_1842) | (net_1796&net_1842);
  // u_2437: sky130_fd_sc_hd__nand2b_2
  assign net_1752 = (register_05[1]) | (!net_1796);
  // u_144: sky130_fd_sc_hd__or4_2
  assign net_2010 = (register_15[7]) | (net_2008) | (net_1972) | (net_1971);
  // u_2359: sky130_fd_sc_hd__nor2_2
  assign net_1970 = (!net_1972&!net_1971);
  // u_4862: sky130_fd_sc_hd__xor2_2
  assign net_1307 = (register_03[0]&!net_1303) | (!register_03[0]&net_1303);
  // u_4835: sky130_fd_sc_hd__a211oi_2
  assign net_1394 = (!net_604&!net_1453&!net_1303) | (!net_873&!net_1453&!net_1303);
  // u_4710: sky130_fd_sc_hd__nor2_2
  assign net_1448 = (!net_873&!net_1497);
  // u_4663: sky130_fd_sc_hd__a221oi_2
  assign net_1568 = (!net_604&!net_1391&!net_1535) | (!net_604&!register_03[1]&!net_1535) | (!net_873&!net_1391&!net_1535) | (!net_873&!register_03[1]&!net_1535);
  // u_5778: sky130_fd_sc_hd__mux2_1
  assign net_927 = (net_873&!net_1005) | (net_929&net_1005);
  // u_5613: sky130_fd_sc_hd__and4_2
  assign net_573 = (register_07[7]&net_457&net_477&net_478);
  // u_5614: sky130_fd_sc_hd__nor2_2
  assign net_555 = (!net_477&!net_533);
  // u_5626: sky130_fd_sc_hd__inv_2
  assign net_459 = (!net_477);
  // u_5947: sky130_fd_sc_hd__a31o_2
  assign net_571 = (net_457&net_477&net_478) | (register_07[7]);
  // u_6017: sky130_fd_sc_hd__a31o_2
  assign net_386 = (register_07[6]&net_477&net_478) | (register_07[5]);
  // u_6033: sky130_fd_sc_hd__and3_2
  assign net_272 = (register_07[2]&register_07[1]&net_477);
  // u_6067: sky130_fd_sc_hd__nand2_2
  assign net_430 = (!net_477) | (!net_478);
  // u_6356: sky130_fd_sc_hd__a21o_2
  assign net_274 = (register_07[2]&net_477) | (register_07[1]);
  // u_6473: sky130_fd_sc_hd__nand3_2
  assign net_878 = (!register_04[1]) | (!register_04[0]) | (!net_968);
  // u_6474: sky130_fd_sc_hd__a21o_2
  assign net_874 = (register_04[1]&net_968) | (register_04[0]);
  // u_6478: sky130_fd_sc_hd__inv_2
  assign net_970 = (!net_968);
  // u_6481: sky130_fd_sc_hd__xor2_2
  assign net_1059 = (register_04[1]&!net_968) | (!register_04[1]&net_968);
  // u_6107: sky130_fd_sc_hd__nor4b_2
  assign net_393 = (!register_07[2]&!register_07[1]&!register_07[6]&net_340);
  // u_6298: sky130_fd_sc_hd__and4_2
  assign net_367 = (register_07[2]&register_07[1]&register_07[6]&net_340);
  // u_4999: sky130_fd_sc_hd__a22o_2
  assign net_1456 = (net_978&shift_register[11]) | (net_1029&shift_register[0]);
  // u_5781: sky130_fd_sc_hd__a22o_2
  assign net_1007 = (net_1004&net_907) | (net_1005&register_06[2]);
  // u_5640: sky130_fd_sc_hd__a31o_2
  assign net_831 = (net_873&net_604&net_882) | (register_06[1]);
  // u_387: sky130_fd_sc_hd__o21ba_2
  assign net_2401 = (register_09[2]&!net_581) | (register_09[1]&!net_581);
  // u_6444: sky130_fd_sc_hd__mux2_1
  assign net_827 = (net_876&!register_04[2]) | (net_879&register_04[2]);
  // u_4602: sky130_fd_sc_hd__a31o_2
  assign net_2007 = (net_873&net_821&net_604) | (register_16);
  // u_6957: sky130_fd_sc_hd__nor2_2
  assign net_233 = (!register_04[3]&!net_235);
  // u_7417: sky130_fd_sc_hd__and3_2
  assign net_370 = (net_350&net_235&net_349);
  // u_7565: sky130_fd_sc_hd__xnor2_2
  assign net_443 = (!net_302&!net_326) | (net_302&net_326);
  // u_7656: sky130_fd_sc_hd__nand2b_2
  assign net_442 = (net_302) | (!net_326);
  // u_6992: sky130_fd_sc_hd__o32ai_2
  assign net_789 = (!net_752&!net_766&!net_786) | (!net_785&!register_02[1]);
  // u_6972: sky130_fd_sc_hd__o31a_2
  assign net_768 = (net_752&net_771) | (net_766&net_771) | (net_765&net_771);
  // u_7167: sky130_fd_sc_hd__o21bai_2
  assign net_897 = (!net_805&!net_785) | (net_802);
  // u_7326: sky130_fd_sc_hd__xnor2_2
  assign net_846 = (!net_802&!net_801) | (net_802&net_801);
  // u_6954: sky130_fd_sc_hd__a31o_2
  assign net_277 = (register_04[3]&register_04[1]&register_04[0]) | (net_275);
  // u_7546: sky130_fd_sc_hd__a21oi_2
  assign net_352 = (!register_04[0]&!net_275) | (!net_302&!net_275);
  // u_6806: sky130_fd_sc_hd__and4_2
  assign net_126 = (net_105&net_127&net_104&net_102);
  // u_6822: sky130_fd_sc_hd__and4_2
  assign net_165 = (net_168&net_195&net_194&net_193);
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
  // u_171: sky130_fd_sc_hd__a21oi_2
  assign net_1958 = (!net_1978&!net_2016) | (!net_1683&!net_2016);
  // u_1166: sky130_fd_sc_hd__nor2_2
  assign net_1915 = (!net_2016&!net_1731);
  // u_3191: sky130_fd_sc_hd__nor2_2
  assign net_1684 = (!net_1612&!net_2016);
  // u_3281: sky130_fd_sc_hd__a21o_2
  assign net_1848 = (net_604&register_12[0]) | (net_1882);
  // u_3477: sky130_fd_sc_hd__a22o_2
  assign net_1880 = (register_12[5]&net_1882) | (net_604&register_12[3]);
  // u_3487: sky130_fd_sc_hd__a22o_2
  assign net_1781 = (net_1882&register_12[2]) | (net_604&register_12[5]);
  // u_5013: sky130_fd_sc_hd__and3_2
  assign net_1573 = (net_1506&net_1539&net_1500);
  // u_3277: sky130_fd_sc_hd__and3b_2
  assign net_1671 = (!net_604&net_1612&net_1673);
  // u_3164: sky130_fd_sc_hd__o21ai_2
  assign net_1626 = (!I&!net_1612) | (!net_1621);
  // u_2966: sky130_fd_sc_hd__and2b_2
  assign net_1849 = (!net_1673&net_1613);
  // u_2972: sky130_fd_sc_hd__a221o_2
  assign net_1789 = (net_1613&net_1635) | (net_604&register_12[4]) | (net_1882);
  // u_3163: sky130_fd_sc_hd__o21ai_2
  assign net_1659 = (!net_1650&!net_1611) | (!net_1658);
  // u_3286: sky130_fd_sc_hd__xnor2_2
  assign net_1760 = (!net_1783&!net_1759) | (net_1783&net_1759);
  // u_3709: sky130_fd_sc_hd__xnor2_2
  assign net_1677 = (!register_12[6]&!net_1670) | (register_12[6]&net_1670);
  // u_3480: sky130_fd_sc_hd__nand2_2
  assign net_1879 = (!net_1878) | (!net_1695);
  // u_3298: sky130_fd_sc_hd__xor2_2
  assign net_1764 = (register_12[3]&!net_1714) | (!register_12[3]&net_1714);
  // u_3710: sky130_fd_sc_hd__o32a_2
  assign net_1633 = (net_1650&net_1630) | (net_1650&net_1611) | (net_1610&net_1630) | (net_1631&net_1630) | (net_1610&net_1611) | (net_1631&net_1611);
  // u_3711: sky130_fd_sc_hd__xnor2_2
  assign net_1653 = (!register_12[7]&!net_1649) | (register_12[7]&net_1649);
  // u_1777: sky130_fd_sc_hd__a21o_2
  assign net_2240 = (register_15[4]&net_2242) | (register_15[0]);
  // u_1781: sky130_fd_sc_hd__o21a_2
  assign net_2243 = (register_15[4]&net_2245) | (net_2242&net_2245);
  // u_1795: sky130_fd_sc_hd__o21a_2
  assign net_2097 = (register_15[6]&net_2072) | (net_2070&net_2072);
  // u_1796: sky130_fd_sc_hd__a21o_2
  assign net_2075 = (register_15[6]&net_2070) | (register_15[1]);
  // u_1367: sky130_fd_sc_hd__a21o_2
  assign net_2510 = (register_13[2]&net_2477) | (register_13[4]);
  // u_1387: sky130_fd_sc_hd__o21a_2
  assign net_2557 = (register_13[2]&net_2483) | (net_2477&net_2483);
  // u_145: sky130_fd_sc_hd__a21o_2
  assign net_2011 = (register_15[2]&net_1970) | (register_15[7]);
  // u_147: sky130_fd_sc_hd__o21a_2
  assign net_1997 = (register_15[2]&net_2010) | (net_1970&net_2010);
  // u_5682: sky130_fd_sc_hd__a21oi_2
  assign net_928 = (!net_929&!net_927) | (!net_930&!net_927);
  // u_6110: sky130_fd_sc_hd__xor2_2
  assign net_578 = (register_07[4]&!net_573) | (!register_07[4]&net_573);
  // u_6103: sky130_fd_sc_hd__a32o_2
  assign net_347 = (I&net_604&net_488) | (net_459&register_07[2]);
  // u_5615: sky130_fd_sc_hd__and2b_2
  assign net_519 = (!net_573&net_571);
  // u_5627: sky130_fd_sc_hd__o21a_2
  assign net_384 = (net_341&net_386) | (net_430&net_386);
  // u_6041: sky130_fd_sc_hd__o21a_2
  assign net_458 = (register_07[0]&net_430) | (net_272&net_430);
  // u_6195: sky130_fd_sc_hd__xnor2_2
  assign net_297 = (!register_07[6]&!net_430) | (register_07[6]&net_430);
  // u_5603: sky130_fd_sc_hd__and2b_2
  assign net_263 = (!net_272&net_274);
  // u_6437: sky130_fd_sc_hd__o311a_2
  assign net_921 = (register_04[2]&net_878&net_874) | (net_820&net_878&net_874) | (net_879&net_878&net_874);
  // u_6446: sky130_fd_sc_hd__o211a_2
  assign net_972 = (net_820&net_918&net_970) | (net_879&net_918&net_970);
  // u_203: sky130_fd_sc_hd__a211oi_2
  assign net_2112 = (!net_2356&!net_581&!net_393) | (!register_09[1]&!net_581&!net_393);
  // u_536: sky130_fd_sc_hd__or4b_2
  assign net_2355 = (net_393) | (register_09[2]) | (net_581) | (!register_09[1]);
  // u_460: sky130_fd_sc_hd__and2_2
  assign net_2487 = (net_855&net_367);
  // u_5229: sky130_fd_sc_hd__a221o_2
  assign net_1454 = (1'b1&shift_register[10]) | (net_1002&shift_register[9]) | (net_1456);
  // u_498: sky130_fd_sc_hd__nor2_2
  assign net_2165 = (!net_393&!net_2401);
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
  // u_6802: sky130_fd_sc_hd__and3_2
  assign net_164 = (net_126&net_165&net_192);
  // u_9597: sky130_fd_sc_hd__nor2_2
  assign net_41 = (!net_107&!net_59);
  // u_9344: sky130_fd_sc_hd__and2b_2
  assign net_11 = (!net_72&net_59);
  // u_9360: sky130_fd_sc_hd__xnor2_2
  assign net_135 = (!net_28&!net_141) | (net_28&net_141);
  // u_2974: sky130_fd_sc_hd__o21a_2
  assign net_1894 = (net_1978&net_1958) | (net_1683&net_1958);
  // u_3285: sky130_fd_sc_hd__a221o_2
  assign net_1913 = (register_12[0]&net_1882) | (net_604&register_12[6]) | (net_1915);
  // u_2965: sky130_fd_sc_hd__a221o_2
  assign net_1730 = (register_12[7]&net_1882) | (net_604&register_12[2]) | (net_1684);
  // u_3516: sky130_fd_sc_hd__a21o_2
  assign net_1851 = (net_1787&net_1912) | (net_1880);
  // u_3489: sky130_fd_sc_hd__a31o_2
  assign net_1713 = (net_1787&net_1788&net_1782) | (net_1781);
  // u_3587: sky130_fd_sc_hd__o221a_2
  assign net_1844 = (register_12[6]&net_2016&net_1626) | (net_1846&net_2016&net_1626) | (register_12[6]&net_1725&net_1626) | (net_1846&net_1725&net_1626);
  // u_3284: sky130_fd_sc_hd__o32a_2
  assign net_1850 = (net_1849&net_1846) | (net_1849&register_12[4]) | (net_1671&net_1846) | (net_1848&net_1846) | (net_1671&register_12[4]) | (net_1848&register_12[4]);
  // u_2973: sky130_fd_sc_hd__o22a_2
  assign net_1927 = (register_12[1]&net_1634) | (net_1846&net_1634) | (register_12[1]&net_1789) | (net_1846&net_1789);
  // u_3161: sky130_fd_sc_hd__xnor2_2
  assign net_1707 = (!register_12[4]&!net_1659) | (register_12[4]&net_1659);
  // u_169: sky130_fd_sc_hd__xor2_2
  assign net_2015 = (register_12[5]&!net_1879) | (!register_12[5]&net_1879);
  // u_2951: sky130_fd_sc_hd__xor2_2
  assign net_1654 = (register_12[1]&!net_1633) | (!register_12[1]&net_1633);
  // u_200: sky130_fd_sc_hd__inv_2
  assign net_2166 = (!net_2355);
  // u_5256: sky130_fd_sc_hd__a31o_2
  assign net_1466 = (I&net_604&net_1454) | (register_17);
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
  // u_450: sky130_fd_sc_hd__and4b_2
  assign net_2542 = (!register_09[0]&register_16&net_164&net_1573);
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
  // u_2969: sky130_fd_sc_hd__a221o_2
  assign net_1767 = (net_1882&register_12[3]) | (net_604&register_12[1]) | (net_1894);
  // u_744: sky130_fd_sc_hd__nor3b_2
  assign net_2084 = (!net_2165&!net_2166&net_2112);
  // u_745: sky130_fd_sc_hd__nor3b_2
  assign net_2059 = (!net_2112&!net_2165&net_2166);
  // u_753: sky130_fd_sc_hd__nor3b_2
  assign net_2167 = (!net_2112&!net_2166&net_2165);
  // u_754: sky130_fd_sc_hd__nor3_2
  assign net_2187 = (!net_2112&!net_2165&!net_2166);
  // u_834: sky130_fd_sc_hd__a21oi_2
  assign net_2055 = (!net_2165&!net_2112) | (!net_2166&!net_2112);
  // u_7374: sky130_fd_sc_hd__nor2_2
  assign net_586 = (!net_548&!net_501);
  // u_233: sky130_fd_sc_hd__a32o_2
  assign net_2543 = (net_1361&net_2487&net_2542) | (register_09[2]&net_2520);
  // u_399: sky130_fd_sc_hd__a32o_2
  assign net_2501 = (net_2522&net_2487&net_2542) | (register_09[1]&net_2520);
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
  // u_238: sky130_fd_sc_hd__a22o_2
  assign net_2063 = (net_2059&1'b0) | (net_1653&net_2084);
  // u_239: sky130_fd_sc_hd__a22o_2
  assign net_2117 = (net_2059&net_984) | (net_2015&net_2084);
  // u_241: sky130_fd_sc_hd__a22o_2
  assign net_2090 = (net_2059&net_956) | (net_1707&net_2084);
  // u_242: sky130_fd_sc_hd__a22o_2
  assign net_2140 = (net_2059&net_846) | (net_1654&net_2084);
  // u_742: sky130_fd_sc_hd__a22o_2
  assign net_2085 = (net_2059&net_768) | (net_1760&net_2084);
  // u_747: sky130_fd_sc_hd__a22o_2
  assign net_2110 = (net_2059&net_897) | (net_1677&net_2084);
  // u_939: sky130_fd_sc_hd__a22o_2
  assign net_2061 = (net_2059&net_949) | (net_1919&net_2084);
  // u_960: sky130_fd_sc_hd__a22o_2
  assign net_2087 = (net_2059&net_789) | (net_1764&net_2084);
  // u_225: sky130_fd_sc_hd__a22o_2
  assign net_2235 = (net_2187&net_1174) | (net_1380&net_2167);
  // u_603: sky130_fd_sc_hd__a22o_2
  assign net_2169 = (net_2187&net_1173) | (net_1426&net_2167);
  // u_611: sky130_fd_sc_hd__a22o_2
  assign net_2215 = (net_2187&net_1231) | (net_1436&net_2167);
  // u_683: sky130_fd_sc_hd__a22o_2
  assign net_2193 = (net_2187&net_1232) | (net_1427&net_2167);
  // u_687: sky130_fd_sc_hd__a22o_2
  assign net_2218 = (net_2187&net_1200) | (net_1523&net_2167);
  // u_709: sky130_fd_sc_hd__a22o_2
  assign net_2189 = (net_2187&net_1293) | (1'b0&net_2167);
  // u_976: sky130_fd_sc_hd__a22o_2
  assign net_2172 = (net_2187&net_1331) | (net_1554&net_2167);
  // u_1154: sky130_fd_sc_hd__a22o_2
  assign net_2143 = (net_2187&1'b0) | (1'b0&net_2167);
  // u_604: sky130_fd_sc_hd__or3_2
  assign net_2082 = (net_1136) | (net_2084) | (net_2055);
  // u_741: sky130_fd_sc_hd__nor2_2
  assign net_2109 = (!net_2084&!net_2055);
  // u_751: sky130_fd_sc_hd__or3_2
  assign net_2057 = (net_1079) | (net_2084) | (net_2055);
  // u_867: sky130_fd_sc_hd__or3_2
  assign net_2138 = (net_1135) | (net_2084) | (net_2055);
  // u_1076: sky130_fd_sc_hd__or3_2
  assign net_2194 = (net_1117) | (net_2084) | (net_2055);
  // u_1077: sky130_fd_sc_hd__or3_2
  assign net_2118 = (1'b0) | (net_2084) | (net_2055);
  // u_1080: sky130_fd_sc_hd__or3_2
  assign net_2145 = (net_1124) | (net_2084) | (net_2055);
  // u_1190: sky130_fd_sc_hd__or3_2
  assign net_2098 = (net_1078) | (net_2084) | (net_2055);
  // u_1203: sky130_fd_sc_hd__or3_2
  assign net_2058 = (net_1042) | (net_2084) | (net_2055);
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
  // u_790: sky130_fd_sc_hd__o31a_2
  assign net_2190 = (net_2109&net_2082) | (net_2189&net_2082) | (net_2087&net_2082);
  // u_231: sky130_fd_sc_hd__o31a_2
  assign net_2236 = (net_2109&net_2057) | (net_2235&net_2057) | (net_2110&net_2057);
  // u_217: sky130_fd_sc_hd__o31a_2
  assign net_2219 = (net_2109&net_2138) | (net_2218&net_2138) | (net_2140&net_2138);
  // u_232: sky130_fd_sc_hd__o31a_2
  assign net_2191 = (net_2109&net_2194) | (net_2193&net_2194) | (net_2117&net_2194);
  // u_1143: sky130_fd_sc_hd__o31a_2
  assign net_2141 = (net_2109&net_2118) | (net_2143&net_2118) | (net_2063&net_2118);
  // u_1081: sky130_fd_sc_hd__o31a_2
  assign net_2232 = (net_2109&net_2145) | (net_2172&net_2145) | (net_2061&net_2145);
  // u_246: sky130_fd_sc_hd__o31a_2
  assign net_2168 = (net_2109&net_2098) | (net_2169&net_2098) | (net_2090&net_2098);
  // u_600: sky130_fd_sc_hd__o31a_2
  assign net_2216 = (net_2109&net_2058) | (net_2215&net_2058) | (net_2085&net_2058);
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
  // u_305: sky130_fd_sc_hd__and3_2
  assign net_1862 = (register_09[0]&net_2190&net_2302);
  // u_222: sky130_fd_sc_hd__and3_2
  assign net_2363 = (register_09[0]&net_2236&net_2302);
  // u_350: sky130_fd_sc_hd__and3_2
  assign net_1155 = (register_09[0]&net_2219&net_2302);
  // u_230: sky130_fd_sc_hd__and3_2
  assign net_673 = (register_09[0]&net_2191&net_2302);
  // u_229: sky130_fd_sc_hd__and3_2
  assign net_2361 = (register_09[0]&net_2141&net_2302);
  // u_553: sky130_fd_sc_hd__and3_2
  assign net_627 = (register_09[0]&net_2232&net_2302);
  // u_223: sky130_fd_sc_hd__and3_2
  assign net_1474 = (register_09[0]&net_2168&net_2302);
  // u_1046: sky130_fd_sc_hd__and3_2
  assign net_1697 = (register_09[0]&net_2216&net_2302);
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
  // u_2563: sky130_fd_sc_hd__and4bb_2
  assign net_1323 = (!net_643&!net_559&net_584&net_497);
  // u_2671: sky130_fd_sc_hd__or4b_2
  assign net_1220 = (net_497) | (net_643) | (net_559) | (!net_584);
  // u_2706: sky130_fd_sc_hd__and4bb_2
  assign net_1189 = (!net_497&!net_559&net_584&net_643);
  // u_2707: sky130_fd_sc_hd__and4b_2
  assign net_1131 = (!net_584&net_559&net_643&net_497);
  // u_8213: sky130_fd_sc_hd__and4bb_2
  assign net_979 = (!net_643&!net_584&net_559&net_497);
  // u_8428: sky130_fd_sc_hd__and4bb_2
  assign net_776 = (!net_497&!net_584&net_559&net_643);
  // u_8437: sky130_fd_sc_hd__or4b_2
  assign net_767 = (net_497) | (net_643) | (net_584) | (!net_559);
  // u_8579: sky130_fd_sc_hd__or4b_2
  assign net_684 = (net_643) | (net_584) | (net_559) | (!net_497);
  // u_8592: sky130_fd_sc_hd__nor4_2
  assign net_583 = (!net_497&!net_643&!net_584&!net_559);
  // u_8597: sky130_fd_sc_hd__and4bb_2
  assign net_678 = (!net_584&!net_559&net_643&net_497);
  // u_8604: sky130_fd_sc_hd__or4b_2
  assign net_638 = (net_497) | (net_584) | (net_559) | (!net_643);
  // u_2553: sky130_fd_sc_hd__a31o_2
  assign net_1322 = (I&net_604&net_1323) | (register_08[3]);
  // u_2622: sky130_fd_sc_hd__nand4_2
  assign net_1418 = (!I) | (!net_604) | (!register_08[3]) | (!net_1323);
  // u_2298: sky130_fd_sc_hd__nor2_2
  assign net_1191 = (!net_1220&!net_1196);
  // u_2552: sky130_fd_sc_hd__or4_2
  assign net_1221 = (register_08[5]) | (net_1163) | (net_1220) | (net_1196);
  // u_2544: sky130_fd_sc_hd__a31o_2
  assign net_1190 = (I&net_604&net_1189) | (register_08[2]);
  // u_2782: sky130_fd_sc_hd__nand4_2
  assign net_1223 = (!I) | (!net_604) | (!register_08[2]) | (!net_1189);
  // u_72: sky130_fd_sc_hd__a31o_2
  assign net_1133 = (I&net_604&net_1131) | (register_10[0]);
  // u_2717: sky130_fd_sc_hd__nand4_2
  assign net_1108 = (!I) | (!net_604) | (!register_10[0]) | (!net_1131);
  // u_8212: sky130_fd_sc_hd__nand4_2
  assign net_1013 = (!I) | (!net_604) | (!register_10[7]) | (!net_979);
  // u_8275: sky130_fd_sc_hd__a31o_2
  assign net_1011 = (I&net_604&net_979) | (register_10[7]);
  // u_8200: sky130_fd_sc_hd__a31o_2
  assign net_908 = (I&net_604&net_776) | (register_10[6]);
  // u_8427: sky130_fd_sc_hd__nand4_2
  assign net_941 = (!I) | (!net_604) | (!register_10[6]) | (!net_776);
  // u_8461: sky130_fd_sc_hd__or4_2
  assign net_787 = (register_10[1]) | (net_938) | (net_767) | (net_779);
  // u_8490: sky130_fd_sc_hd__nor2_2
  assign net_838 = (!net_767&!net_779);
  // u_8108: sky130_fd_sc_hd__or4_2
  assign net_655 = (register_11[4]) | (net_699) | (net_684) | (net_674);
  // u_8771: sky130_fd_sc_hd__nor2_2
  assign net_656 = (!net_684&!net_674);
  // u_8581: sky130_fd_sc_hd__nand4_2
  assign net_491 = (!I) | (!net_604) | (!register_11[7]) | (!net_583);
  // u_8741: sky130_fd_sc_hd__a31o_2
  assign net_521 = (I&net_604&net_583) | (register_11[7]);
  // u_8099: sky130_fd_sc_hd__a31o_2
  assign net_676 = (I&net_604&net_678) | (register_11[2]);
  // u_8203: sky130_fd_sc_hd__nand4_2
  assign net_669 = (!I) | (!net_604) | (!register_11[2]) | (!net_678);
  // u_8620: sky130_fd_sc_hd__nor2_2
  assign net_661 = (!net_638&!net_637);
  // u_8711: sky130_fd_sc_hd__or4_2
  assign net_640 = (register_11[5]) | (net_635) | (net_638) | (net_637);
  // u_2540: sky130_fd_sc_hd__o21a_2
  assign net_1420 = (register_08[1]&net_1322) | (net_1418&net_1322);
  // u_2572: sky130_fd_sc_hd__nand2b_2
  assign net_1368 = (register_08[1]) | (!net_1418);
  // u_2543: sky130_fd_sc_hd__a21o_2
  assign net_1166 = (register_08[4]&net_1191) | (register_08[5]);
  // u_2548: sky130_fd_sc_hd__o21a_2
  assign net_1257 = (register_08[4]&net_1221) | (net_1191&net_1221);
  // u_2302: sky130_fd_sc_hd__nand2b_2
  assign net_1230 = (register_08[0]) | (!net_1223);
  // u_2740: sky130_fd_sc_hd__o21a_2
  assign net_1206 = (register_08[0]&net_1190) | (net_1223&net_1190);
  // u_75: sky130_fd_sc_hd__o21a_2
  assign net_1132 = (register_10[4]&net_1133) | (net_1108&net_1133);
  // u_8202: sky130_fd_sc_hd__nand2b_2
  assign net_1109 = (register_10[4]) | (!net_1108);
  // u_8215: sky130_fd_sc_hd__nand2b_2
  assign net_1039 = (register_10[2]) | (!net_1013);
  // u_8211: sky130_fd_sc_hd__o21a_2
  assign net_1015 = (register_10[2]&net_1011) | (net_1013&net_1011);
  // u_8190: sky130_fd_sc_hd__o21a_2
  assign net_939 = (register_10[3]&net_908) | (net_941&net_908);
  // u_8321: sky130_fd_sc_hd__nand2b_2
  assign net_892 = (register_10[3]) | (!net_941);
  // u_8192: sky130_fd_sc_hd__o21a_2
  assign net_857 = (register_10[5]&net_787) | (net_838&net_787);
  // u_8196: sky130_fd_sc_hd__a21o_2
  assign net_840 = (register_10[5]&net_838) | (register_10[1]);
  // u_8103: sky130_fd_sc_hd__a21o_2
  assign net_700 = (register_11[1]&net_656) | (register_11[4]);
  // u_8658: sky130_fd_sc_hd__o21a_2
  assign net_660 = (register_11[1]&net_655) | (net_656&net_655);
  // u_8881: sky130_fd_sc_hd__nand2b_2
  assign net_440 = (register_11[0]) | (!net_491);
  // u_8867: sky130_fd_sc_hd__o21a_2
  assign net_522 = (register_11[0]&net_521) | (net_491&net_521);
  // u_8201: sky130_fd_sc_hd__nand2b_2
  assign net_734 = (register_11[3]) | (!net_669);
  // u_8695: sky130_fd_sc_hd__o21a_2
  assign net_677 = (register_11[3]&net_676) | (net_669&net_676);
  // u_8583: sky130_fd_sc_hd__a21o_2
  assign net_646 = (register_11[6]&net_661) | (register_11[5]);
  // u_8600: sky130_fd_sc_hd__o21a_2
  assign net_663 = (register_11[6]&net_640) | (net_661&net_640);

  // Native top-level GDS outputs.
  assign O[0] = net_2363;  // net_2363
  assign O[1] = net_1697;  // net_1697
  assign O[2] = net_1474;  // net_1474
  assign O[3] = net_1155;  // net_1155
  assign O[4] = net_1862;  // net_1862
  assign O[5] = net_673;  // net_673
  assign O[6] = net_627;  // net_627
  assign O[7] = net_2361;  // net_2361
  assign success = register_09[2];  // net_2380

  // Recovered state updates; physical CTS buffers are normalized away.
  // shift_register: verified shift register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[0] <= 1'b0;
    else shift_register[0] <= net_1584;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[1] <= 1'b0;
    else shift_register[1] <= net_1544;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[2] <= 1'b0;
    else shift_register[2] <= net_1597;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[3] <= 1'b0;
    else shift_register[3] <= net_1464;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[4] <= 1'b0;
    else shift_register[4] <= net_1354;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[5] <= 1'b0;
    else shift_register[5] <= net_1279;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[6] <= 1'b0;
    else shift_register[6] <= net_1351;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[7] <= 1'b0;
    else shift_register[7] <= net_1214;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[8] <= 1'b0;
    else shift_register[8] <= net_1250;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[9] <= 1'b0;
    else shift_register[9] <= net_1315;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[10] <= 1'b0;
    else shift_register[10] <= net_1412;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[11] <= 1'b0;
    else shift_register[11] <= net_1514;
  end

  // register_02: state/counter register candidate
  always @(posedge clk) begin
    register_02[0] <= net_2332;
  end
  always @(posedge clk) begin
    register_02[1] <= net_2388;
  end
  always @(posedge clk) begin
    register_02[2] <= net_2411;
  end
  always @(posedge clk) begin
    register_02[3] <= net_2317;
  end

  // register_03: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[0] <= 1'b0;
    else register_03[0] <= net_1307;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[1] <= 1'b0;
    else register_03[1] <= net_1568;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[2] <= 1'b0;
    else register_03[2] <= net_1448;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[3] <= 1'b0;
    else register_03[3] <= net_1394;
  end

  // register_04: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[0] <= 1'b0;
    else register_04[0] <= net_921;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[1] <= 1'b0;
    else register_04[1] <= net_1059;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[2] <= 1'b0;
    else register_04[2] <= net_827;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[3] <= 1'b0;
    else register_04[3] <= net_972;
  end

  // register_05: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_05[0] <= 1'b0;
    else register_05[0] <= net_1800;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_05[1] <= 1'b0;
    else register_05[1] <= net_1752;
  end

  // register_06: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[0] <= 1'b0;
    else register_06[0] <= net_928;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[1] <= 1'b0;
    else register_06[1] <= net_831;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[2] <= 1'b0;
    else register_06[2] <= net_1007;
  end

  // register_07: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[0] <= 1'b0;
    else register_07[0] <= net_458;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[1] <= 1'b0;
    else register_07[1] <= net_263;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[2] <= 1'b0;
    else register_07[2] <= net_347;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[3] <= 1'b0;
    else register_07[3] <= net_555;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[4] <= 1'b0;
    else register_07[4] <= net_578;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[5] <= 1'b0;
    else register_07[5] <= net_384;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[6] <= 1'b0;
    else register_07[6] <= net_297;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[7] <= 1'b0;
    else register_07[7] <= net_519;
  end

  // register_08: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[0] <= 1'b0;
    else register_08[0] <= net_1230;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[1] <= 1'b0;
    else register_08[1] <= net_1368;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[2] <= 1'b0;
    else register_08[2] <= net_1206;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[3] <= 1'b0;
    else register_08[3] <= net_1420;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[4] <= 1'b0;
    else register_08[4] <= net_1257;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_08[5] <= 1'b0;
    else register_08[5] <= net_1166;
  end

  // register_09: decoded state/register vector
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[0] <= 1'b0;
    else register_09[0] <= net_2564;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[1] <= 1'b0;
    else register_09[1] <= net_2501;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[2] <= 1'b0;
    else register_09[2] <= net_2543;
  end

  // register_10: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[0] <= 1'b0;
    else register_10[0] <= net_1132;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[1] <= 1'b0;
    else register_10[1] <= net_840;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[2] <= 1'b0;
    else register_10[2] <= net_1039;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[3] <= 1'b0;
    else register_10[3] <= net_892;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[4] <= 1'b0;
    else register_10[4] <= net_1109;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[5] <= 1'b0;
    else register_10[5] <= net_857;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[6] <= 1'b0;
    else register_10[6] <= net_939;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_10[7] <= 1'b0;
    else register_10[7] <= net_1015;
  end

  // register_11: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[0] <= 1'b0;
    else register_11[0] <= net_440;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[1] <= 1'b0;
    else register_11[1] <= net_660;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[2] <= 1'b0;
    else register_11[2] <= net_677;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[3] <= 1'b0;
    else register_11[3] <= net_734;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[4] <= 1'b0;
    else register_11[4] <= net_700;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[5] <= 1'b0;
    else register_11[5] <= net_646;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[6] <= 1'b0;
    else register_11[6] <= net_663;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_11[7] <= 1'b0;
    else register_11[7] <= net_522;
  end

  // register_12: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[0] <= 1'b0;
    else register_12[0] <= net_1913;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[1] <= 1'b0;
    else register_12[1] <= net_1927;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[2] <= 1'b0;
    else register_12[2] <= net_1713;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[3] <= 1'b0;
    else register_12[3] <= net_1767;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[4] <= 1'b1;
    else register_12[4] <= net_1850;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[5] <= 1'b1;
    else register_12[5] <= net_1851;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[6] <= 1'b1;
    else register_12[6] <= net_1844;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[7] <= 1'b1;
    else register_12[7] <= net_1730;
  end

  // register_13: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[0] <= 1'b0;
    else register_13[0] <= net_2531;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[1] <= 1'b0;
    else register_13[1] <= net_2583;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[2] <= 1'b0;
    else register_13[2] <= net_2557;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[3] <= 1'b0;
    else register_13[3] <= net_2489;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[4] <= 1'b0;
    else register_13[4] <= net_2510;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[5] <= 1'b0;
    else register_13[5] <= net_2582;
  end

  // register_14: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[0] <= 1'b0;
    else register_14[0] <= net_2307;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[1] <= 1'b0;
    else register_14[1] <= net_2354;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[2] <= 1'b0;
    else register_14[2] <= net_2438;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[3] <= 1'b0;
    else register_14[3] <= net_2464;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[4] <= 1'b0;
    else register_14[4] <= net_2274;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[5] <= 1'b0;
    else register_14[5] <= net_2345;
  end

  // register_15: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[0] <= 1'b0;
    else register_15[0] <= net_2240;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[1] <= 1'b0;
    else register_15[1] <= net_2075;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[2] <= 1'b0;
    else register_15[2] <= net_1997;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[3] <= 1'b0;
    else register_15[3] <= net_2160;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[4] <= 1'b0;
    else register_15[4] <= net_2243;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[5] <= 1'b0;
    else register_15[5] <= net_2132;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[6] <= 1'b0;
    else register_15[6] <= net_2097;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15[7] <= 1'b0;
    else register_15[7] <= net_2011;
  end

  // register_16: ungrouped one-bit register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_16 <= 1'b0;
    else register_16 <= net_2007;
  end

  // register_17: ungrouped one-bit register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_17 <= 1'b0;
    else register_17 <= net_1466;
  end

endmodule
