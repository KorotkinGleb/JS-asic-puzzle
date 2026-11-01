// Complete dependency-free RTL recovered from puzzle.gds.
// 728 functional cells; 2767/2767 functional pins resolved.
// No PDK modules or include files are required for simulation.
`timescale 1ps / 1ps

module puzzle (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       enable,
    input  wire       I,
    output wire [7:0] O,
    output wire       success
);

  // Extracted electrical nets.
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
  reg net_114;
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
  reg net_169;
  wire net_170;
  reg net_171;
  wire net_172;
  reg net_173;
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
  reg net_205;
  reg net_206;
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
  wire net_294;
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
  reg net_338;
  reg net_339;
  wire net_340;
  wire net_341;
  reg net_342;
  wire net_347;
  wire net_348;
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
  reg net_415;
  wire net_416;
  wire net_417;
  wire net_418;
  wire net_419;
  wire net_430;
  reg net_433;
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
  reg net_484;
  wire net_488;
  wire net_491;
  reg net_492;
  wire net_493;
  wire net_497;
  wire net_501;
  wire net_502;
  wire net_507;
  wire net_509;
  wire net_519;
  wire net_521;
  wire net_522;
  wire net_533;
  reg net_534;
  wire net_537;
  reg net_547;
  wire net_548;
  wire net_549;
  wire net_555;
  wire net_559;
  wire net_562;
  wire net_571;
  wire net_573;
  wire net_578;
  wire net_581;
  reg net_582;
  wire net_583;
  wire net_584;
  wire net_586;
  reg net_603;
  wire net_604;
  wire net_627;
  wire net_635;
  reg net_636;
  wire net_637;
  wire net_638;
  wire net_640;
  wire net_643;
  wire net_646;
  wire net_655;
  wire net_656;
  reg net_657;
  reg net_658;
  wire net_660;
  wire net_661;
  wire net_663;
  wire net_669;
  wire net_673;
  wire net_674;
  wire net_676;
  wire net_677;
  wire net_678;
  wire net_683;
  wire net_684;
  wire net_695;
  reg net_698;
  wire net_699;
  wire net_700;
  reg net_707;
  wire net_715;
  reg net_717;
  wire net_734;
  reg net_749;
  reg net_751;
  wire net_752;
  wire net_761;
  reg net_762;
  wire net_764;
  wire net_765;
  wire net_766;
  wire net_767;
  wire net_768;
  wire net_769;
  wire net_770;
  wire net_771;
  wire net_775;
  wire net_776;
  wire net_779;
  wire net_783;
  wire net_785;
  wire net_786;
  wire net_787;
  wire net_789;
  wire net_790;
  reg net_796;
  wire net_797;
  wire net_800;
  wire net_801;
  wire net_802;
  wire net_803;
  wire net_805;
  wire net_806;
  wire net_808;
  wire net_820;
  wire net_821;
  wire net_827;
  reg net_828;
  wire net_829;
  wire net_831;
  reg net_837;
  wire net_838;
  reg net_839;
  wire net_840;
  wire net_846;
  reg net_848;
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
  wire net_926;
  wire net_927;
  wire net_928;
  wire net_929;
  wire net_930;
  wire net_938;
  wire net_939;
  wire net_941;
  reg net_942;
  wire net_949;
  wire net_951;
  wire net_956;
  wire net_965;
  wire net_968;
  wire net_970;
  wire net_972;
  reg net_974;
  wire net_976;
  wire net_978;
  wire net_979;
  wire net_984;
  reg net_1001;
  wire net_1002;
  wire net_1004;
  wire net_1005;
  reg net_1006;
  wire net_1007;
  wire net_1011;
  reg net_1012;
  wire net_1013;
  wire net_1015;
  wire net_1026;
  wire net_1029;
  reg net_1031;
  wire net_1038;
  wire net_1039;
  wire net_1040;
  wire net_1041;
  wire net_1042;
  wire net_1051;
  wire net_1059;
  wire net_1070;
  wire net_1078;
  wire net_1079;
  wire net_1080;
  wire net_1082;
  wire net_1083;
  wire net_1096;
  wire net_1108;
  wire net_1109;
  reg net_1110;
  wire net_1117;
  wire net_1124;
  reg net_1129;
  wire net_1131;
  wire net_1132;
  wire net_1133;
  wire net_1135;
  wire net_1136;
  wire net_1155;
  wire net_1160;
  wire net_1161;
  wire net_1163;
  reg net_1164;
  reg net_1165;
  wire net_1166;
  wire net_1173;
  wire net_1174;
  wire net_1175;
  wire net_1176;
  wire net_1177;
  wire net_1179;
  reg net_1187;
  wire net_1189;
  wire net_1190;
  wire net_1191;
  reg net_1193;
  wire net_1196;
  wire net_1198;
  wire net_1199;
  wire net_1200;
  wire net_1206;
  reg net_1212;
  wire net_1214;
  wire net_1220;
  wire net_1221;
  wire net_1223;
  wire net_1230;
  wire net_1231;
  wire net_1232;
  wire net_1235;
  reg net_1248;
  wire net_1250;
  wire net_1257;
  wire net_1265;
  wire net_1268;
  wire net_1279;
  wire net_1293;
  wire net_1303;
  wire net_1307;
  reg net_1308;
  reg net_1309;
  wire net_1311;
  wire net_1313;
  wire net_1315;
  wire net_1322;
  wire net_1323;
  reg net_1325;
  wire net_1331;
  wire net_1332;
  wire net_1338;
  wire net_1348;
  reg net_1349;
  wire net_1351;
  wire net_1354;
  reg net_1358;
  reg net_1360;
  wire net_1361;
  wire net_1368;
  wire net_1370;
  wire net_1372;
  wire net_1373;
  wire net_1374;
  reg net_1379;
  wire net_1380;
  wire net_1391;
  wire net_1394;
  wire net_1400;
  reg net_1402;
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
  reg net_1458;
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
  reg net_1512;
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
  reg net_1547;
  wire net_1553;
  wire net_1554;
  wire net_1565;
  wire net_1568;
  wire net_1573;
  wire net_1575;
  reg net_1577;
  wire net_1584;
  reg net_1596;
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
  wire net_1668;
  wire net_1669;
  wire net_1670;
  wire net_1671;
  wire net_1673;
  reg net_1675;
  wire net_1677;
  wire net_1683;
  wire net_1684;
  wire net_1695;
  wire net_1696;
  wire net_1697;
  wire net_1700;
  wire net_1707;
  wire net_1712;
  wire net_1713;
  wire net_1714;
  reg net_1715;
  wire net_1725;
  wire net_1726;
  wire net_1730;
  wire net_1731;
  wire net_1732;
  reg net_1740;
  wire net_1752;
  wire net_1759;
  wire net_1760;
  reg net_1763;
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
  reg net_1797;
  wire net_1800;
  reg net_1805;
  reg net_1806;
  wire net_1808;
  reg net_1812;
  reg net_1813;
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
  wire net_1943;
  wire net_1947;
  reg net_1950;
  wire net_1958;
  reg net_1968;
  wire net_1970;
  wire net_1971;
  wire net_1972;
  wire net_1978;
  reg net_1996;
  wire net_1997;
  reg net_1998;
  wire net_2007;
  wire net_2008;
  wire net_2010;
  wire net_2011;
  wire net_2015;
  wire net_2016;
  wire net_2023;
  wire net_2033;
  wire net_2045;
  wire net_2055;
  wire net_2057;
  wire net_2058;
  wire net_2059;
  wire net_2061;
  wire net_2063;
  reg net_2069;
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
  reg net_2101;
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
  reg net_2155;
  reg net_2157;
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
  wire net_2210;
  wire net_2212;
  wire net_2215;
  wire net_2216;
  wire net_2218;
  wire net_2219;
  reg net_2226;
  wire net_2229;
  wire net_2232;
  wire net_2235;
  wire net_2236;
  wire net_2240;
  reg net_2241;
  wire net_2242;
  wire net_2243;
  wire net_2245;
  wire net_2261;
  reg net_2273;
  wire net_2274;
  wire net_2275;
  reg net_2276;
  wire net_2277;
  wire net_2280;
  wire net_2296;
  wire net_2301;
  wire net_2302;
  wire net_2307;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2322;
  reg net_2329;
  wire net_2330;
  wire net_2332;
  wire net_2344;
  wire net_2345;
  reg net_2346;
  reg net_2347;
  wire net_2354;
  wire net_2355;
  wire net_2356;
  wire net_2359;
  wire net_2361;
  wire net_2363;
  wire net_2377;
  wire net_2379;
  reg net_2380;
  wire net_2388;
  wire net_2397;
  wire net_2401;
  reg net_2403;
  wire net_2411;
  wire net_2418;
  wire net_2419;
  wire net_2438;
  wire net_2440;
  wire net_2441;
  reg net_2442;
  reg net_2443;
  wire net_2464;
  wire net_2477;
  wire net_2478;
  wire net_2479;
  wire net_2483;
  wire net_2487;
  wire net_2489;
  wire net_2490;
  reg net_2493;
  wire net_2501;
  wire net_2510;
  reg net_2511;
  reg net_2512;
  wire net_2520;
  wire net_2522;
  wire net_2530;
  wire net_2531;
  reg net_2532;
  wire net_2533;
  wire net_2542;
  wire net_2543;
  wire net_2554;
  wire net_2557;
  wire net_2564;
  reg net_2579;
  reg net_2581;
  wire net_2582;
  wire net_2583;
  wire net_2584;
  wire net_2611;
  wire net_2612;

  // Recovered top-level output mapping.
  assign O[0] = net_2363;
  assign O[1] = net_1697;
  assign O[2] = net_1474;
  assign O[3] = net_1155;
  assign O[4] = net_1862;
  assign O[5] = net_673;
  assign O[6] = net_627;
  assign O[7] = net_2361;
  assign success = net_2380;

  // Extracted conductor islands with no recognized driver.
  assign net_806 = 1'bx;  // physically undriven conductor island

  // Inlined recovered combinational standard cells.
  // u_51: sky130_fd_sc_hd__clkbuf_4
  assign net_683 = (net_348);
  // u_52: sky130_fd_sc_hd__clkbuf_8
  assign net_348 = (net_695);
  // u_63: sky130_fd_sc_hd__a211o_2
  assign net_1135 = (net_749&net_1136) | (net_1041) | (net_1083);
  // u_67: sky130_fd_sc_hd__a211oi_2
  assign net_1136 = (!net_762&!net_751&!net_848) | (!net_749&!net_751&!net_848);
  // u_72: sky130_fd_sc_hd__a31o_2
  assign net_1133 = (I&net_604&net_1131) | (net_1129);
  // u_75: sky130_fd_sc_hd__o21a_2
  assign net_1132 = (net_1110&net_1133) | (net_1108&net_1133);
  // u_103: sky130_fd_sc_hd__clkbuf_8
  assign net_2033 = (net_695);
  // u_142: sky130_fd_sc_hd__or2_2
  assign net_1782 = (net_1806) | (net_1808);
  // u_144: sky130_fd_sc_hd__or4_2
  assign net_2010 = (net_1998) | (net_2008) | (net_1972) | (net_1971);
  // u_145: sky130_fd_sc_hd__a21o_2
  assign net_2011 = (net_1996&net_1970) | (net_1998);
  // u_147: sky130_fd_sc_hd__o21a_2
  assign net_1997 = (net_1996&net_2010) | (net_1970&net_2010);
  // u_159: sky130_fd_sc_hd__clkbuf_8
  assign net_1265 = (net_695);
  // u_169: sky130_fd_sc_hd__xor2_2
  assign net_2015 = (net_1813&!net_1879) | (!net_1813&net_1879);
  // u_171: sky130_fd_sc_hd__a21oi_2
  assign net_1958 = (!net_1978&!net_2016) | (!net_1683&!net_2016);
  // u_173: sky130_fd_sc_hd__nand2_2
  assign net_1788 = (!net_1806) | (!net_1808);
  // u_174: sky130_fd_sc_hd__a22o_2
  assign net_1917 = (net_1878&net_751) | (net_762&net_1786);
  // u_198: sky130_fd_sc_hd__and2_2
  assign net_1911 = (net_2329&net_2302);
  // u_199: sky130_fd_sc_hd__a21boi_2
  assign net_2388 = (!net_762&net_2329) | (!net_2302&net_2329);
  // u_200: sky130_fd_sc_hd__inv_2
  assign net_2166 = (!net_2355);
  // u_202: sky130_fd_sc_hd__xnor2_2
  assign net_2359 = (!net_749&!net_762) | (net_749&net_762);
  // u_203: sky130_fd_sc_hd__a211oi_2
  assign net_2112 = (!net_2356&!net_581&!net_393) | (!net_2403&!net_581&!net_393);
  // u_215: sky130_fd_sc_hd__a21boi_2
  assign net_2317 = (!net_2311&net_2329) | (!net_2316&net_2329);
  // u_217: sky130_fd_sc_hd__o31a_2
  assign net_2219 = (net_2109&net_2138) | (net_2218&net_2138) | (net_2140&net_2138);
  // u_222: sky130_fd_sc_hd__and3_2
  assign net_2363 = (net_2329&net_2236&net_2302);
  // u_223: sky130_fd_sc_hd__and3_2
  assign net_1474 = (net_2329&net_2168&net_2302);
  // u_225: sky130_fd_sc_hd__a22o_2
  assign net_2235 = (net_2187&net_1174) | (net_1380&net_2167);
  // u_229: sky130_fd_sc_hd__and3_2
  assign net_2361 = (net_2329&net_2141&net_2302);
  // u_230: sky130_fd_sc_hd__and3_2
  assign net_673 = (net_2329&net_2191&net_2302);
  // u_231: sky130_fd_sc_hd__o31a_2
  assign net_2236 = (net_2109&net_2057) | (net_2235&net_2057) | (net_2110&net_2057);
  // u_232: sky130_fd_sc_hd__o31a_2
  assign net_2191 = (net_2109&net_2194) | (net_2193&net_2194) | (net_2117&net_2194);
  // u_233: sky130_fd_sc_hd__a32o_2
  assign net_2543 = (net_1361&net_2487&net_2542) | (net_2380&net_2520);
  // u_238: sky130_fd_sc_hd__a22o_2
  assign net_2063 = (net_2059&net_769) | (net_1653&net_2084);
  // u_239: sky130_fd_sc_hd__a22o_2
  assign net_2117 = (net_2059&net_984) | (net_2015&net_2084);
  // u_240: sky130_fd_sc_hd__xor2_2
  assign net_1947 = (net_1812&!net_1950) | (!net_1812&net_1950);
  // u_241: sky130_fd_sc_hd__a22o_2
  assign net_2090 = (net_2059&net_956) | (net_1707&net_2084);
  // u_242: sky130_fd_sc_hd__a22o_2
  assign net_2140 = (net_2059&net_846) | (net_1654&net_2084);
  // u_246: sky130_fd_sc_hd__o31a_2
  assign net_2168 = (net_2109&net_2098) | (net_2169&net_2098) | (net_2090&net_2098);
  // u_247: sky130_fd_sc_hd__inv_2
  assign net_2522 = (!net_1361);
  // u_305: sky130_fd_sc_hd__and3_2
  assign net_1862 = (net_2329&net_2190&net_2302);
  // u_341: sky130_fd_sc_hd__a21boi_2
  assign net_2411 = (!net_2302&net_2329) | (!net_2359&net_2329);
  // u_350: sky130_fd_sc_hd__and3_2
  assign net_1155 = (net_2329&net_2219&net_2302);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!net_848) | (!net_751) | (!net_749) | (!net_762);
  // u_385: sky130_fd_sc_hd__inv_2
  assign net_2356 = (!net_2380);
  // u_387: sky130_fd_sc_hd__o21ba_2
  assign net_2401 = (net_2380&!net_581) | (net_2403&!net_581);
  // u_395: sky130_fd_sc_hd__or2_2
  assign net_2564 = (net_1968) | (net_2329);
  // u_399: sky130_fd_sc_hd__a32o_2
  assign net_2501 = (net_2522&net_2487&net_2542) | (net_2403&net_2520);
  // u_406: sky130_fd_sc_hd__nand2b_2
  assign net_2520 = (net_2329) | (!net_1968);
  // u_450: sky130_fd_sc_hd__and4b_2
  assign net_2542 = (!net_2329&net_1968&net_164&net_1573);
  // u_460: sky130_fd_sc_hd__and2_2
  assign net_2487 = (net_855&net_367);
  // u_494: sky130_fd_sc_hd__nand3_2
  assign net_2316 = (!net_751) | (!net_749) | (!net_762);
  // u_498: sky130_fd_sc_hd__nor2_2
  assign net_2165 = (!net_393&!net_2401);
  // u_500: sky130_fd_sc_hd__a21o_2
  assign net_2330 = (net_749&net_762) | (net_751);
  // u_536: sky130_fd_sc_hd__or4b_2
  assign net_2355 = (net_393) | (net_2380) | (net_581) | (!net_2403);
  // u_553: sky130_fd_sc_hd__and3_2
  assign net_627 = (net_2329&net_2232&net_2302);
  // u_599: sky130_fd_sc_hd__clkbuf_4
  assign net_2210 = (net_2212);
  // u_600: sky130_fd_sc_hd__o31a_2
  assign net_2216 = (net_2109&net_2058) | (net_2215&net_2058) | (net_2085&net_2058);
  // u_603: sky130_fd_sc_hd__a22o_2
  assign net_2169 = (net_2187&net_1173) | (net_1426&net_2167);
  // u_604: sky130_fd_sc_hd__or3_2
  assign net_2082 = (net_1136) | (net_2084) | (net_2055);
  // u_608: sky130_fd_sc_hd__o211a_2
  assign net_2332 = (net_848&net_2330&net_2329) | (net_2316&net_2330&net_2329);
  // u_611: sky130_fd_sc_hd__a22o_2
  assign net_2215 = (net_2187&net_1231) | (net_1436&net_2167);
  // u_624: sky130_fd_sc_hd__inv_2
  assign net_2311 = (!net_848);
  // u_683: sky130_fd_sc_hd__a22o_2
  assign net_2193 = (net_2187&net_1232) | (net_1427&net_2167);
  // u_687: sky130_fd_sc_hd__a22o_2
  assign net_2218 = (net_2187&net_1200) | (net_1523&net_2167);
  // u_709: sky130_fd_sc_hd__a22o_2
  assign net_2189 = (net_2187&net_1293) | (net_1332&net_2167);
  // u_727: sky130_fd_sc_hd__clkbuf_8
  assign net_2212 = (net_695);
  // u_741: sky130_fd_sc_hd__nor2_2
  assign net_2109 = (!net_2084&!net_2055);
  // u_742: sky130_fd_sc_hd__a22o_2
  assign net_2085 = (net_2059&net_768) | (net_1760&net_2084);
  // u_743: sky130_fd_sc_hd__nand2b_2
  assign net_2016 = (net_604) | (!net_1911);
  // u_744: sky130_fd_sc_hd__nor3b_2
  assign net_2084 = (!net_2165&!net_2166&net_2112);
  // u_745: sky130_fd_sc_hd__nor3b_2
  assign net_2059 = (!net_2112&!net_2165&net_2166);
  // u_747: sky130_fd_sc_hd__a22o_2
  assign net_2110 = (net_2059&net_897) | (net_1677&net_2084);
  // u_751: sky130_fd_sc_hd__or3_2
  assign net_2057 = (net_1079) | (net_2084) | (net_2055);
  // u_753: sky130_fd_sc_hd__nor3b_2
  assign net_2167 = (!net_2112&!net_2166&net_2165);
  // u_754: sky130_fd_sc_hd__nor3_2
  assign net_2187 = (!net_2112&!net_2165&!net_2166);
  // u_790: sky130_fd_sc_hd__o31a_2
  assign net_2190 = (net_2109&net_2082) | (net_2189&net_2082) | (net_2087&net_2082);
  // u_834: sky130_fd_sc_hd__a21oi_2
  assign net_2055 = (!net_2165&!net_2112) | (!net_2166&!net_2112);
  // u_867: sky130_fd_sc_hd__or3_2
  assign net_2138 = (net_1135) | (net_2084) | (net_2055);
  // u_882: sky130_fd_sc_hd__or2_2
  assign net_1846 = (net_1911) | (net_604);
  // u_939: sky130_fd_sc_hd__a22o_2
  assign net_2061 = (net_2059&net_949) | (net_1919&net_2084);
  // u_960: sky130_fd_sc_hd__a22o_2
  assign net_2087 = (net_2059&net_789) | (net_1764&net_2084);
  // u_976: sky130_fd_sc_hd__a22o_2
  assign net_2172 = (net_2187&net_1331) | (net_1554&net_2167);
  // u_1046: sky130_fd_sc_hd__and3_2
  assign net_1697 = (net_2329&net_2216&net_2302);
  // u_1076: sky130_fd_sc_hd__or3_2
  assign net_2194 = (net_1117) | (net_2084) | (net_2055);
  // u_1077: sky130_fd_sc_hd__or3_2
  assign net_2118 = (net_1038) | (net_2084) | (net_2055);
  // u_1080: sky130_fd_sc_hd__or3_2
  assign net_2145 = (net_1124) | (net_2084) | (net_2055);
  // u_1081: sky130_fd_sc_hd__o31a_2
  assign net_2232 = (net_2109&net_2145) | (net_2172&net_2145) | (net_2061&net_2145);
  // u_1143: sky130_fd_sc_hd__o31a_2
  assign net_2141 = (net_2109&net_2118) | (net_2143&net_2118) | (net_2063&net_2118);
  // u_1154: sky130_fd_sc_hd__a22o_2
  assign net_2143 = (net_2187&net_1160) | (net_1553&net_2167);
  // u_1166: sky130_fd_sc_hd__nor2_2
  assign net_1915 = (!net_2016&!net_1731);
  // u_1190: sky130_fd_sc_hd__or3_2
  assign net_2098 = (net_1078) | (net_2084) | (net_2055);
  // u_1203: sky130_fd_sc_hd__or3_2
  assign net_2058 = (net_1042) | (net_2084) | (net_2055);
  // u_1231: sky130_fd_sc_hd__nand2_2
  assign net_2280 = (!I) | (!net_604);
  // u_1232: sky130_fd_sc_hd__a31o_2
  assign net_2301 = (I&net_604&net_2277) | (net_2276);
  // u_1234: sky130_fd_sc_hd__a31o_2
  assign net_2377 = (I&net_604&net_2419) | (net_2347);
  // u_1235: sky130_fd_sc_hd__o21a_2
  assign net_2354 = (net_2346&net_2377) | (net_2344&net_2377);
  // u_1240: sky130_fd_sc_hd__nand2b_2
  assign net_2345 = (net_2346) | (!net_2344);
  // u_1244: sky130_fd_sc_hd__or4_2
  assign net_2245 = (net_2226) | (net_2261) | (net_2229) | (net_2280);
  // u_1246: sky130_fd_sc_hd__and4bb_2
  assign net_2419 = (!net_169&!net_547&net_1001&net_114);
  // u_1248: sky130_fd_sc_hd__and4b_2
  assign net_2418 = (!net_547&net_1001&net_169&net_114);
  // u_1252: sky130_fd_sc_hd__or4_2
  assign net_2072 = (net_2101) | (net_2129) | (net_2074) | (net_2073);
  // u_1255: sky130_fd_sc_hd__nand2_2
  assign net_2073 = (!I) | (!net_604);
  // u_1262: sky130_fd_sc_hd__and2b_2
  assign net_1505 = (!net_2532&net_2493);
  // u_1285: sky130_fd_sc_hd__clkbuf_4
  assign net_2379 = (net_2296);
  // u_1286: sky130_fd_sc_hd__a31o_2
  assign net_2554 = (I&net_604&net_2533) | (net_2532);
  // u_1287: sky130_fd_sc_hd__a31o_2
  assign net_2611 = (I&net_604&net_2612) | (net_2581);
  // u_1323: sky130_fd_sc_hd__and4bb_2
  assign net_2612 = (!net_169&!net_1001&net_547&net_114);
  // u_1362: sky130_fd_sc_hd__nand2_2
  assign net_2479 = (!I) | (!net_604);
  // u_1363: sky130_fd_sc_hd__or4_2
  assign net_2483 = (net_2511) | (net_2490) | (net_2478) | (net_2479);
  // u_1364: sky130_fd_sc_hd__nand4_2
  assign net_2584 = (!I) | (!net_604) | (!net_2581) | (!net_2612);
  // u_1365: sky130_fd_sc_hd__nand4_2
  assign net_2530 = (!I) | (!net_604) | (!net_2532) | (!net_2533);
  // u_1366: sky130_fd_sc_hd__o21a_2
  assign net_2531 = (net_2493&net_2554) | (net_2530&net_2554);
  // u_1367: sky130_fd_sc_hd__a21o_2
  assign net_2510 = (net_2512&net_2477) | (net_2511);
  // u_1370: sky130_fd_sc_hd__and4bb_2
  assign net_2533 = (!net_114&!net_1001&net_547&net_169);
  // u_1376: sky130_fd_sc_hd__and2b_2
  assign net_1509 = (!net_2443&net_2442);
  // u_1377: sky130_fd_sc_hd__nor2_2
  assign net_2477 = (!net_2478&!net_2479);
  // u_1381: sky130_fd_sc_hd__nand4_2
  assign net_2441 = (!I) | (!net_604) | (!net_2443) | (!net_2418);
  // u_1387: sky130_fd_sc_hd__o21a_2
  assign net_2557 = (net_2512&net_2483) | (net_2477&net_2483);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!net_2512);
  // u_1451: sky130_fd_sc_hd__or4b_2
  assign net_2478 = (net_114) | (net_169) | (net_1001) | (!net_547);
  // u_1560: sky130_fd_sc_hd__and2_2
  assign net_1502 = (net_2511&net_2490);
  // u_1569: sky130_fd_sc_hd__nand2b_2
  assign net_2489 = (net_2493) | (!net_2530);
  // u_1570: sky130_fd_sc_hd__nand2b_2
  assign net_2582 = (net_2579) | (!net_2584);
  // u_1579: sky130_fd_sc_hd__o21a_2
  assign net_2583 = (net_2579&net_2611) | (net_2584&net_2611);
  // u_1591: sky130_fd_sc_hd__and2b_2
  assign net_1501 = (!net_2581&net_2579);
  // u_1611: sky130_fd_sc_hd__o21a_2
  assign net_2438 = (net_2442&net_2440) | (net_2441&net_2440);
  // u_1628: sky130_fd_sc_hd__clkbuf_8
  assign net_2322 = (net_695);
  // u_1630: sky130_fd_sc_hd__and2b_2
  assign net_1507 = (!net_2347&net_2346);
  // u_1635: sky130_fd_sc_hd__a31o_2
  assign net_2440 = (I&net_604&net_2418) | (net_2443);
  // u_1641: sky130_fd_sc_hd__nand4_2
  assign net_2344 = (!I) | (!net_604) | (!net_2347) | (!net_2419);
  // u_1675: sky130_fd_sc_hd__nand2b_2
  assign net_2464 = (net_2442) | (!net_2441);
  // u_1701: sky130_fd_sc_hd__clkbuf_4
  assign net_2397 = (net_2322);
  // u_1736: sky130_fd_sc_hd__clkbuf_8
  assign net_2296 = (net_695);
  // u_1770: sky130_fd_sc_hd__or4b_2
  assign net_2074 = (net_169) | (net_547) | (net_1001) | (!net_114);
  // u_1772: sky130_fd_sc_hd__nand4_2
  assign net_2275 = (!I) | (!net_604) | (!net_2276) | (!net_2277);
  // u_1775: sky130_fd_sc_hd__and2b_2
  assign net_1510 = (!net_2276&net_2273);
  // u_1776: sky130_fd_sc_hd__and2_2
  assign net_1504 = (net_2226&net_2261);
  // u_1777: sky130_fd_sc_hd__a21o_2
  assign net_2240 = (net_2241&net_2242) | (net_2226);
  // u_1780: sky130_fd_sc_hd__o21a_2
  assign net_2160 = (net_2155&net_2184) | (net_2154&net_2184);
  // u_1781: sky130_fd_sc_hd__o21a_2
  assign net_2243 = (net_2241&net_2245) | (net_2242&net_2245);
  // u_1788: sky130_fd_sc_hd__and4bb_2
  assign net_2185 = (!net_547&!net_1001&net_169&net_114);
  // u_1790: sky130_fd_sc_hd__o21a_2
  assign net_2307 = (net_2273&net_2301) | (net_2275&net_2301);
  // u_1792: sky130_fd_sc_hd__nand2b_2
  assign net_2132 = (net_2155) | (!net_2154);
  // u_1793: sky130_fd_sc_hd__clkbuf_8
  assign net_2023 = (net_695);
  // u_1794: sky130_fd_sc_hd__and2_2
  assign net_1538 = (net_2101&net_2129);
  // u_1795: sky130_fd_sc_hd__o21a_2
  assign net_2097 = (net_2069&net_2072) | (net_2070&net_2072);
  // u_1796: sky130_fd_sc_hd__a21o_2
  assign net_2075 = (net_2069&net_2070) | (net_2101);
  // u_1798: sky130_fd_sc_hd__nor2_2
  assign net_2242 = (!net_2229&!net_2280);
  // u_1803: sky130_fd_sc_hd__or4b_2
  assign net_2229 = (net_114) | (net_169) | (net_547) | (!net_1001);
  // u_1807: sky130_fd_sc_hd__and4bb_2
  assign net_2277 = (!net_114&!net_547&net_1001&net_169);
  // u_1959: sky130_fd_sc_hd__nand2b_2
  assign net_2274 = (net_2273) | (!net_2275);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!net_2241);
  // u_1982: sky130_fd_sc_hd__and2_2
  assign net_1543 = (net_1998&net_2008);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!net_2069);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!net_1996);
  // u_2023: sky130_fd_sc_hd__clkbuf_4
  assign net_2045 = (net_2023);
  // u_2034: sky130_fd_sc_hd__nand4_2
  assign net_2154 = (!I) | (!net_604) | (!net_2157) | (!net_2185);
  // u_2049: sky130_fd_sc_hd__a31o_2
  assign net_2184 = (I&net_604&net_2185) | (net_2157);
  // u_2107: sky130_fd_sc_hd__and2b_2
  assign net_1541 = (!net_2157&net_2155);
  // u_2143: sky130_fd_sc_hd__nor2_2
  assign net_2070 = (!net_2074&!net_2073);
  // u_2296: sky130_fd_sc_hd__nand2_2
  assign net_1196 = (!I) | (!net_604);
  // u_2298: sky130_fd_sc_hd__nor2_2
  assign net_1191 = (!net_1220&!net_1196);
  // u_2302: sky130_fd_sc_hd__nand2b_2
  assign net_1230 = (net_1193) | (!net_1223);
  // u_2327: sky130_fd_sc_hd__clkbuf_4
  assign net_1668 = (net_1265);
  // u_2358: sky130_fd_sc_hd__clkbuf_16
  assign net_695 = (clk);
  // u_2359: sky130_fd_sc_hd__nor2_2
  assign net_1970 = (!net_1972&!net_1971);
  // u_2361: sky130_fd_sc_hd__a31o_2
  assign net_1842 = (I&net_604&net_1876) | (net_1805);
  // u_2363: sky130_fd_sc_hd__o21a_2
  assign net_1800 = (net_1797&net_1842) | (net_1796&net_1842);
  // u_2364: sky130_fd_sc_hd__and2b_2
  assign net_1542 = (!net_1805&net_1797);
  // u_2365: sky130_fd_sc_hd__nor4_2
  assign net_1876 = (!net_114&!net_169&!net_547&!net_1001);
  // u_2369: sky130_fd_sc_hd__nand4_2
  assign net_1796 = (!I) | (!net_604) | (!net_1805) | (!net_1876);
  // u_2370: sky130_fd_sc_hd__nand2_2
  assign net_1971 = (!I) | (!net_604);
  // u_2396: sky130_fd_sc_hd__or4b_2
  assign net_1972 = (net_114) | (net_547) | (net_1001) | (!net_169);
  // u_2437: sky130_fd_sc_hd__nand2b_2
  assign net_1752 = (net_1797) | (!net_1796);
  // u_2501: sky130_fd_sc_hd__clkbuf_4
  assign net_1943 = (net_1575);
  // u_2507: sky130_fd_sc_hd__clkbuf_8
  assign net_1575 = (net_695);
  // u_2540: sky130_fd_sc_hd__o21a_2
  assign net_1420 = (net_1379&net_1322) | (net_1418&net_1322);
  // u_2543: sky130_fd_sc_hd__a21o_2
  assign net_1166 = (net_1165&net_1191) | (net_1164);
  // u_2544: sky130_fd_sc_hd__a31o_2
  assign net_1190 = (I&net_604&net_1189) | (net_1187);
  // u_2548: sky130_fd_sc_hd__o21a_2
  assign net_1257 = (net_1165&net_1221) | (net_1191&net_1221);
  // u_2552: sky130_fd_sc_hd__or4_2
  assign net_1221 = (net_1164) | (net_1163) | (net_1220) | (net_1196);
  // u_2553: sky130_fd_sc_hd__a31o_2
  assign net_1322 = (I&net_604&net_1323) | (net_1325);
  // u_2555: sky130_fd_sc_hd__and2b_2
  assign net_163 = (!net_1187&net_1193);
  // u_2561: sky130_fd_sc_hd__and2_2
  assign net_160 = (net_1164&net_1163);
  // u_2563: sky130_fd_sc_hd__and4bb_2
  assign net_1323 = (!net_643&!net_559&net_584&net_497);
  // u_2571: sky130_fd_sc_hd__and2b_2
  assign net_161 = (!net_1325&net_1379);
  // u_2572: sky130_fd_sc_hd__nand2b_2
  assign net_1368 = (net_1379) | (!net_1418);
  // u_2622: sky130_fd_sc_hd__nand4_2
  assign net_1418 = (!I) | (!net_604) | (!net_1325) | (!net_1323);
  // u_2671: sky130_fd_sc_hd__or4b_2
  assign net_1220 = (net_497) | (net_643) | (net_559) | (!net_584);
  // u_2706: sky130_fd_sc_hd__and4bb_2
  assign net_1189 = (!net_497&!net_559&net_584&net_643);
  // u_2707: sky130_fd_sc_hd__and4b_2
  assign net_1131 = (!net_584&net_559&net_643&net_497);
  // u_2711: sky130_fd_sc_hd__inv_2
  assign net_1163 = (!net_1165);
  // u_2717: sky130_fd_sc_hd__nand4_2
  assign net_1108 = (!I) | (!net_604) | (!net_1129) | (!net_1131);
  // u_2740: sky130_fd_sc_hd__o21a_2
  assign net_1206 = (net_1193&net_1190) | (net_1223&net_1190);
  // u_2782: sky130_fd_sc_hd__nand4_2
  assign net_1223 = (!I) | (!net_604) | (!net_1187) | (!net_1189);
  // u_2843: sky130_fd_sc_hd__and2b_2
  assign net_104 = (!net_1129&net_1110);
  // u_2925: sky130_fd_sc_hd__xnor2_2
  assign net_1610 = (!net_848&!net_1820) | (net_848&net_1820);
  // u_2926: sky130_fd_sc_hd__a21oi_2
  assign net_1554 = (!net_762&!net_848) | (!net_1431&!net_848);
  // u_2928: sky130_fd_sc_hd__inv_2
  assign net_1429 = (!net_762);
  // u_2932: sky130_fd_sc_hd__and3_2
  assign net_1427 = (net_762&net_1370&net_1431);
  // u_2933: sky130_fd_sc_hd__o211a_2
  assign net_1426 = (net_1429&net_1370&net_749) | (net_751&net_1370&net_749);
  // u_2935: sky130_fd_sc_hd__o21ai_2
  assign net_1268 = (!net_749&!net_751) | (!net_848);
  // u_2936: sky130_fd_sc_hd__and2b_2
  assign net_1173 = (!net_1176&net_1179);
  // u_2937: sky130_fd_sc_hd__inv_2
  assign net_1370 = (!net_848);
  // u_2938: sky130_fd_sc_hd__nand2b_2
  assign net_1179 = (net_762) | (!net_749);
  // u_2939: sky130_fd_sc_hd__o221a_2
  assign net_1200 = (net_1176&net_1198&net_1179) | (net_1177&net_1198&net_1179) | (net_1176&net_1199&net_1179) | (net_1177&net_1199&net_1179);
  // u_2940: sky130_fd_sc_hd__o211a_2
  assign net_1293 = (net_749&net_1235&net_1268) | (net_1176&net_1235&net_1268);
  // u_2941: sky130_fd_sc_hd__o31a_2
  assign net_1380 = (net_1372&net_1370) | (net_1374&net_1370) | (net_1373&net_1370);
  // u_2942: sky130_fd_sc_hd__o21a_2
  assign net_1331 = (net_749&net_1268) | (net_1235&net_1268);
  // u_2949: sky130_fd_sc_hd__xnor2_2
  assign net_1612 = (!net_1814&!net_1817) | (net_1814&net_1817);
  // u_2950: sky130_fd_sc_hd__and3_2
  assign net_1820 = (net_762&net_749&net_751);
  // u_2951: sky130_fd_sc_hd__xor2_2
  assign net_1654 = (net_1812&!net_1633) | (!net_1812&net_1633);
  // u_2953: sky130_fd_sc_hd__nor3b_2
  assign net_1373 = (!net_762&!net_751&net_749);
  // u_2954: sky130_fd_sc_hd__nor3b_2
  assign net_1634 = (!net_604&!net_1635&net_1612);
  // u_2955: sky130_fd_sc_hd__a2111oi_2
  assign net_1523 = (!net_762&!net_848&!net_1431&!net_1522) | (!net_751&!net_848&!net_1431&!net_1522);
  // u_2956: sky130_fd_sc_hd__a21boi_2
  assign net_1621 = (!I&net_604) | (!net_1612&net_604);
  // u_2961: sky130_fd_sc_hd__a211o_2
  assign net_1658 = (net_762&net_751) | (net_1644) | (net_1627);
  // u_2963: sky130_fd_sc_hd__xnor2_2
  assign net_1731 = (!net_1715&!net_1732) | (net_1715&net_1732);
  // u_2965: sky130_fd_sc_hd__a221o_2
  assign net_1730 = (net_1740&net_1882) | (net_604&net_1715) | (net_1684);
  // u_2966: sky130_fd_sc_hd__and2b_2
  assign net_1849 = (!net_1673&net_1613);
  // u_2967: sky130_fd_sc_hd__xor2_2
  assign net_1732 = (net_1812&!net_1740) | (!net_1812&net_1740);
  // u_2968: sky130_fd_sc_hd__a22oi_2
  assign net_1646 = (!net_762&!net_1629) | (!net_762&!net_1648) | (!net_1644&!net_1629) | (!net_1644&!net_1648);
  // u_2969: sky130_fd_sc_hd__a221o_2
  assign net_1767 = (net_1882&net_1763) | (net_604&net_1812) | (net_1894);
  // u_2972: sky130_fd_sc_hd__a221o_2
  assign net_1789 = (net_1613&net_1635) | (net_604&net_1806) | (net_1882);
  // u_2973: sky130_fd_sc_hd__o22a_2
  assign net_1927 = (net_1812&net_1634) | (net_1846&net_1634) | (net_1812&net_1789) | (net_1846&net_1789);
  // u_2974: sky130_fd_sc_hd__o21a_2
  assign net_1894 = (net_1978&net_1958) | (net_1683&net_1958);
  // u_3012: sky130_fd_sc_hd__xnor2_2
  assign net_1635 = (!net_1675&!net_1947) | (net_1675&net_1947);
  // u_3014: sky130_fd_sc_hd__xor2_2
  assign net_1673 = (net_1675&!net_1808) | (!net_1675&net_1808);
  // u_3015: sky130_fd_sc_hd__xor2_2
  assign net_1759 = (net_1950&!net_1629) | (!net_1950&net_1629);
  // u_3017: sky130_fd_sc_hd__xnor2_2
  assign net_1808 = (!net_1715&!net_1814) | (net_1715&net_1814);
  // u_3161: sky130_fd_sc_hd__xnor2_2
  assign net_1707 = (!net_1806&!net_1659) | (net_1806&net_1659);
  // u_3163: sky130_fd_sc_hd__o21ai_2
  assign net_1659 = (!net_1650&!net_1611) | (!net_1658);
  // u_3164: sky130_fd_sc_hd__o21ai_2
  assign net_1626 = (!I&!net_1612) | (!net_1621);
  // u_3167: sky130_fd_sc_hd__xor2_2
  assign net_1683 = (net_1675&!net_1763) | (!net_1675&net_1763);
  // u_3191: sky130_fd_sc_hd__nor2_2
  assign net_1684 = (!net_1612&!net_2016);
  // u_3276: sky130_fd_sc_hd__nand2_2
  assign net_1625 = (!net_751) | (!net_1627);
  // u_3277: sky130_fd_sc_hd__and3b_2
  assign net_1671 = (!net_604&net_1612&net_1673);
  // u_3278: sky130_fd_sc_hd__xnor2_2
  assign net_1725 = (!net_1715&!net_1726) | (net_1715&net_1726);
  // u_3279: sky130_fd_sc_hd__a31o_2
  assign net_1649 = (net_751&net_1644&net_1648) | (net_1646);
  // u_3281: sky130_fd_sc_hd__a21o_2
  assign net_1848 = (net_604&net_1950) | (net_1882);
  // u_3282: sky130_fd_sc_hd__xnor2_2
  assign net_1726 = (!net_1806&!net_1813) | (net_1806&net_1813);
  // u_3283: sky130_fd_sc_hd__xnor2_2
  assign net_1912 = (!net_1726&!net_1947) | (net_1726&net_1947);
  // u_3284: sky130_fd_sc_hd__o32a_2
  assign net_1850 = (net_1849&net_1846) | (net_1849&net_1806) | (net_1671&net_1846) | (net_1848&net_1846) | (net_1671&net_1806) | (net_1848&net_1806);
  // u_3285: sky130_fd_sc_hd__a221o_2
  assign net_1913 = (net_1950&net_1882) | (net_604&net_1675) | (net_1915);
  // u_3286: sky130_fd_sc_hd__xnor2_2
  assign net_1760 = (!net_1783&!net_1759) | (net_1783&net_1759);
  // u_3287: sky130_fd_sc_hd__or3b_2
  assign net_1700 = (net_762) | (net_751) | (!net_749);
  // u_3288: sky130_fd_sc_hd__clkbuf_8
  assign net_1712 = (net_695);
  // u_3289: sky130_fd_sc_hd__xnor2_2
  assign net_1814 = (!net_1763&!net_1812) | (net_1763&net_1812);
  // u_3295: sky130_fd_sc_hd__xnor2_2
  assign net_1817 = (!net_1813&!net_1740) | (net_1813&net_1740);
  // u_3296: sky130_fd_sc_hd__xor2_2
  assign net_1978 = (net_1806&!net_1950) | (!net_1806&net_1950);
  // u_3297: sky130_fd_sc_hd__xnor2_2
  assign net_1919 = (!net_1715&!net_1917) | (net_1715&net_1917);
  // u_3298: sky130_fd_sc_hd__xor2_2
  assign net_1764 = (net_1763&!net_1714) | (!net_1763&net_1714);
  // u_3315: sky130_fd_sc_hd__or3_2
  assign net_1783 = (net_1645) | (net_1618) | (net_1786);
  // u_3477: sky130_fd_sc_hd__a22o_2
  assign net_1880 = (net_1813&net_1882) | (net_604&net_1763);
  // u_3478: sky130_fd_sc_hd__nand2b_2
  assign net_1878 = (net_749) | (!net_762);
  // u_3480: sky130_fd_sc_hd__nand2_2
  assign net_1879 = (!net_1878) | (!net_1695);
  // u_3483: sky130_fd_sc_hd__nor2_2
  assign net_1882 = (!net_1911&!net_604);
  // u_3484: sky130_fd_sc_hd__and2b_2
  assign net_1627 = (!net_762&net_749);
  // u_3487: sky130_fd_sc_hd__a22o_2
  assign net_1781 = (net_1882&net_1715) | (net_604&net_1813);
  // u_3489: sky130_fd_sc_hd__a31o_2
  assign net_1713 = (net_1787&net_1788&net_1782) | (net_1781);
  // u_3516: sky130_fd_sc_hd__a21o_2
  assign net_1851 = (net_1787&net_1912) | (net_1880);
  // u_3518: sky130_fd_sc_hd__and2b_2
  assign net_1787 = (!net_604&net_1911);
  // u_3531: sky130_fd_sc_hd__nor2_2
  assign net_1618 = (!net_762&!net_749);
  // u_3533: sky130_fd_sc_hd__nor2_2
  assign net_1786 = (!net_751&!net_848);
  // u_3576: sky130_fd_sc_hd__nand2_2
  assign net_1669 = (!net_749) | (!net_848);
  // u_3587: sky130_fd_sc_hd__o221a_2
  assign net_1844 = (net_1675&net_2016&net_1626) | (net_1846&net_2016&net_1626) | (net_1675&net_1725&net_1626) | (net_1846&net_1725&net_1626);
  // u_3636: sky130_fd_sc_hd__a21oi_2
  assign net_1670 = (!net_1625&!net_1645) | (!net_1669&!net_1645);
  // u_3639: sky130_fd_sc_hd__clkbuf_4
  assign net_1696 = (net_1712);
  // u_3660: sky130_fd_sc_hd__a22o_2
  assign net_1695 = (net_1610&net_1700) | (net_1645&net_1629);
  // u_3669: sky130_fd_sc_hd__inv_2
  assign net_1644 = (!net_848);
  // u_3685: sky130_fd_sc_hd__nor2_2
  assign net_1645 = (!net_762&!net_1644);
  // u_3701: sky130_fd_sc_hd__nand2_2
  assign net_1648 = (!net_762) | (!net_749);
  // u_3703: sky130_fd_sc_hd__o31a_2
  assign net_1714 = (net_751&net_1669) | (net_1645&net_1669) | (net_1627&net_1669);
  // u_3708: sky130_fd_sc_hd__inv_2
  assign net_1650 = (!net_1625);
  // u_3709: sky130_fd_sc_hd__xnor2_2
  assign net_1677 = (!net_1675&!net_1670) | (net_1675&net_1670);
  // u_3710: sky130_fd_sc_hd__o32a_2
  assign net_1633 = (net_1650&net_1630) | (net_1650&net_1611) | (net_1610&net_1630) | (net_1631&net_1630) | (net_1610&net_1611) | (net_1631&net_1611);
  // u_3711: sky130_fd_sc_hd__xnor2_2
  assign net_1653 = (!net_1740&!net_1649) | (net_1740&net_1649);
  // u_3712: sky130_fd_sc_hd__nor2_2
  assign net_1631 = (!net_751&!net_1630);
  // u_3715: sky130_fd_sc_hd__or2_2
  assign net_1629 = (net_749) | (net_751);
  // u_3809: sky130_fd_sc_hd__nand2_2
  assign net_1611 = (!net_1629) | (!net_1610);
  // u_3816: sky130_fd_sc_hd__and2b_2
  assign net_1630 = (!net_1618&net_1648);
  // u_3821: sky130_fd_sc_hd__nor2_2
  assign net_1613 = (!net_604&!net_1612);
  // u_3852: sky130_fd_sc_hd__and2b_2
  assign net_1374 = (!net_749&net_762);
  // u_3857: sky130_fd_sc_hd__conb_1
  assign net_1565 = 1;
  assign net_1553 = 0;
  // u_3858: sky130_fd_sc_hd__o21a_2
  assign net_1436 = (net_1429&net_1370) | (net_1372&net_1370);
  // u_3873: sky130_fd_sc_hd__nor2_2
  assign net_1522 = (!net_762&!net_749);
  // u_3900: sky130_fd_sc_hd__and3_2
  assign net_1372 = (net_762&net_749&net_751);
  // u_3931: sky130_fd_sc_hd__conb_1
  assign net_1338 = 1;
  assign net_1332 = 0;
  // u_3968: sky130_fd_sc_hd__a21oi_2
  assign net_1174 = (!net_1176&!net_1175) | (!net_1177&!net_1175);
  // u_3976: sky130_fd_sc_hd__nor2_2
  assign net_1198 = (!net_848&!net_1177);
  // u_3978: sky130_fd_sc_hd__a21oi_2
  assign net_1199 = (!net_762&!net_751) | (!net_848&!net_751);
  // u_3980: sky130_fd_sc_hd__mux2_1
  assign net_1175 = (net_749&!net_751) | (net_848&net_751);
  // u_3984: sky130_fd_sc_hd__and3b_2
  assign net_1232 = (!net_848&net_1177&net_751);
  // u_4002: sky130_fd_sc_hd__and3b_2
  assign net_1231 = (!net_848&net_751&net_749);
  // u_4022: sky130_fd_sc_hd__conb_1
  assign net_1161 = 1;
  assign net_1160 = 0;
  // u_4023: sky130_fd_sc_hd__and2b_2
  assign net_1177 = (!net_749&net_762);
  // u_4052: sky130_fd_sc_hd__or2_2
  assign net_1176 = (net_751) | (net_848);
  // u_4070: sky130_fd_sc_hd__and2b_2
  assign net_1431 = (!net_751&net_749);
  // u_4127: sky130_fd_sc_hd__nand2_2
  assign net_1235 = (!net_762) | (!net_1176);
  // u_4602: sky130_fd_sc_hd__a31o_2
  assign net_2007 = (net_873&net_821&net_604) | (net_1968);
  // u_4660: sky130_fd_sc_hd__and3_2
  assign net_1303 = (net_114&net_169&net_604);
  // u_4663: sky130_fd_sc_hd__a221oi_2
  assign net_1568 = (!net_604&!net_1391&!net_1535) | (!net_604&!net_547&!net_1535) | (!net_873&!net_1391&!net_1535) | (!net_873&!net_547&!net_1535);
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!net_169&!net_1001&net_547&net_114);
  // u_4710: sky130_fd_sc_hd__nor2_2
  assign net_1448 = (!net_873&!net_1497);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!net_1968&enable);
  // u_4835: sky130_fd_sc_hd__a211oi_2
  assign net_1394 = (!net_604&!net_1453&!net_1303) | (!net_873&!net_1453&!net_1303);
  // u_4837: sky130_fd_sc_hd__a21oi_2
  assign net_1453 = (!net_169&!net_114) | (!net_604&!net_114);
  // u_4859: sky130_fd_sc_hd__xnor2_2
  assign net_1497 = (!net_169&!net_604) | (net_169&net_604);
  // u_4862: sky130_fd_sc_hd__xor2_2
  assign net_1307 = (net_1001&!net_1303) | (!net_1001&net_1303);
  // u_4863: sky130_fd_sc_hd__a41oi_2
  assign net_1535 = (!net_114&!net_547) | (!net_169&!net_547) | (!net_1001&!net_547) | (!net_604&!net_547);
  // u_4949: sky130_fd_sc_hd__and4_2
  assign net_1391 = (net_114&net_169&net_1001&net_604);
  // u_4999: sky130_fd_sc_hd__a22o_2
  assign net_1456 = (net_978&net_1512) | (net_1029&net_1577);
  // u_5006: sky130_fd_sc_hd__clkbuf_4
  assign net_1311 = (net_1313);
  // u_5007: sky130_fd_sc_hd__mux2_1
  assign net_1597 = (net_1596&!net_604) | (net_1547&net_604);
  // u_5008: sky130_fd_sc_hd__mux2_1
  assign net_1544 = (net_1547&!net_604) | (net_1577&net_604);
  // u_5010: sky130_fd_sc_hd__and4_2
  assign net_1539 = (net_1543&net_1542&net_1541&net_1538);
  // u_5011: sky130_fd_sc_hd__mux2_1
  assign net_1464 = (net_1458&!net_604) | (net_1596&net_604);
  // u_5012: sky130_fd_sc_hd__clkbuf_8
  assign net_1313 = (net_695);
  // u_5013: sky130_fd_sc_hd__and3_2
  assign net_1573 = (net_1506&net_1539&net_1500);
  // u_5178: sky130_fd_sc_hd__clkbuf_8
  assign net_1348 = (net_695);
  // u_5205: sky130_fd_sc_hd__mux2_1
  assign net_1279 = (net_1349&!net_604) | (net_1402&net_604);
  // u_5225: sky130_fd_sc_hd__and4_2
  assign net_1506 = (net_1510&net_1504&net_1509&net_1507);
  // u_5229: sky130_fd_sc_hd__a221o_2
  assign net_1454 = (net_926&net_1358) | (net_1002&net_1308) | (net_1456);
  // u_5230: sky130_fd_sc_hd__and3_2
  assign net_1500 = (net_1505&net_1502&net_1501);
  // u_5256: sky130_fd_sc_hd__a31o_2
  assign net_1466 = (I&net_604&net_1454) | (net_1360);
  // u_5263: sky130_fd_sc_hd__mux2_1
  assign net_1351 = (net_1309&!net_604) | (net_1349&net_604);
  // u_5265: sky130_fd_sc_hd__mux2_1
  assign net_1214 = (net_1212&!net_604) | (net_1309&net_604);
  // u_5290: sky130_fd_sc_hd__clkbuf_4
  assign net_1400 = (net_1348);
  // u_5340: sky130_fd_sc_hd__mux2_1
  assign net_1584 = (net_1577&!net_604) | (I&net_604);
  // u_5347: sky130_fd_sc_hd__mux2_1
  assign net_1412 = (net_1358&!net_604) | (net_1308&net_604);
  // u_5400: sky130_fd_sc_hd__mux2_1
  assign net_1514 = (net_1512&!net_604) | (net_1358&net_604);
  // u_5403: sky130_fd_sc_hd__mux2_1
  assign net_1315 = (net_1308&!net_604) | (net_1248&net_604);
  // u_5433: sky130_fd_sc_hd__mux2_1
  assign net_1354 = (net_1402&!net_604) | (net_1458&net_604);
  // u_5532: sky130_fd_sc_hd__inv_2
  assign net_1361 = (!net_1360);
  // u_5537: sky130_fd_sc_hd__mux2_1
  assign net_1250 = (net_1248&!net_604) | (net_1212&net_604);
  // u_5603: sky130_fd_sc_hd__and2b_2
  assign net_263 = (!net_272&net_274);
  // u_5612: sky130_fd_sc_hd__or3_2
  assign net_480 = (net_603) | (net_433) | (net_534);
  // u_5613: sky130_fd_sc_hd__and4_2
  assign net_573 = (net_484&net_457&net_477&net_478);
  // u_5614: sky130_fd_sc_hd__nor2_2
  assign net_555 = (!net_477&!net_533);
  // u_5615: sky130_fd_sc_hd__and2b_2
  assign net_519 = (!net_573&net_571);
  // u_5616: sky130_fd_sc_hd__nor3_2
  assign net_340 = (!net_415&!net_484&!net_480);
  // u_5626: sky130_fd_sc_hd__inv_2
  assign net_459 = (!net_477);
  // u_5627: sky130_fd_sc_hd__o21a_2
  assign net_384 = (net_341&net_386) | (net_430&net_386);
  // u_5628: sky130_fd_sc_hd__nand2_2
  assign net_341 = (!net_339) | (!net_415);
  // u_5629: sky130_fd_sc_hd__clkbuf_8
  assign net_829 = (net_695);
  // u_5630: sky130_fd_sc_hd__inv_2
  assign net_907 = (!net_873);
  // u_5636: sky130_fd_sc_hd__inv_2
  assign net_929 = (!net_974);
  // u_5637: sky130_fd_sc_hd__clkbuf_8
  assign net_294 = (net_695);
  // u_5640: sky130_fd_sc_hd__a31o_2
  assign net_831 = (net_873&net_604&net_882) | (net_828);
  // u_5673: sky130_fd_sc_hd__clkbuf_8
  assign net_1070 = (net_695);
  // u_5677: sky130_fd_sc_hd__o211a_2
  assign net_1004 = (net_974&net_976&net_604) | (net_930&net_976&net_604);
  // u_5680: sky130_fd_sc_hd__or4bb_2
  assign net_1002 = (net_169) | (net_1001) | (!net_547) | (!net_114);
  // u_5681: sky130_fd_sc_hd__or4_2
  assign net_1029 = (net_169) | (net_114) | (net_1001) | (net_547);
  // u_5682: sky130_fd_sc_hd__a21oi_2
  assign net_928 = (!net_929&!net_927) | (!net_930&!net_927);
  // u_5683: sky130_fd_sc_hd__mux2_1
  assign net_882 = (net_930&!net_974) | (net_976&net_974);
  // u_5684: sky130_fd_sc_hd__or2_2
  assign net_976 = (net_1006) | (I);
  // u_5702: sky130_fd_sc_hd__clkbuf_4
  assign net_1096 = (net_1070);
  // u_5711: sky130_fd_sc_hd__nand2_2
  assign net_930 = (!net_1006) | (!I);
  // u_5765: sky130_fd_sc_hd__conb_1
  assign net_926 = 1;
  assign net_965 = 0;
  // u_5775: sky130_fd_sc_hd__inv_2
  assign net_1005 = (!net_604);
  // u_5778: sky130_fd_sc_hd__mux2_1
  assign net_927 = (net_873&!net_1005) | (net_929&net_1005);
  // u_5781: sky130_fd_sc_hd__a22o_2
  assign net_1007 = (net_1004&net_907) | (net_1005&net_1006);
  // u_5789: sky130_fd_sc_hd__buf_2
  assign net_978 = (net_1029);
  // u_5830: sky130_fd_sc_hd__clkbuf_4
  assign net_715 = (net_294);
  // u_5836: sky130_fd_sc_hd__inv_2
  assign net_855 = (!net_828);
  // u_5882: sky130_fd_sc_hd__clkbuf_4
  assign net_1026 = (net_829);
  // u_5947: sky130_fd_sc_hd__a31o_2
  assign net_571 = (net_457&net_477&net_478) | (net_484);
  // u_6017: sky130_fd_sc_hd__a31o_2
  assign net_386 = (net_339&net_477&net_478) | (net_415);
  // u_6032: sky130_fd_sc_hd__and2_2
  assign net_457 = (net_339&net_415);
  // u_6033: sky130_fd_sc_hd__and3_2
  assign net_272 = (net_338&net_342&net_477);
  // u_6041: sky130_fd_sc_hd__o21a_2
  assign net_458 = (net_433&net_430) | (net_272&net_430);
  // u_6067: sky130_fd_sc_hd__nand2_2
  assign net_430 = (!net_477) | (!net_478);
  // u_6092: sky130_fd_sc_hd__and3_2
  assign net_581 = (net_537&net_488&net_457);
  // u_6094: sky130_fd_sc_hd__and2b_2
  assign net_488 = (!net_338&net_603);
  // u_6103: sky130_fd_sc_hd__a32o_2
  assign net_347 = (I&net_604&net_488) | (net_459&net_338);
  // u_6107: sky130_fd_sc_hd__nor4b_2
  assign net_393 = (!net_338&!net_342&!net_339&net_340);
  // u_6110: sky130_fd_sc_hd__xor2_2
  assign net_578 = (net_534&!net_573) | (!net_534&net_573);
  // u_6160: sky130_fd_sc_hd__a21oi_2
  assign net_533 = (!I&!net_603) | (!net_604&!net_603);
  // u_6166: sky130_fd_sc_hd__and3_2
  assign net_477 = (net_603&I&net_604);
  // u_6194: sky130_fd_sc_hd__and4bb_2
  assign net_537 = (!net_342&!net_534&net_484&net_433);
  // u_6195: sky130_fd_sc_hd__xnor2_2
  assign net_297 = (!net_339&!net_430) | (net_339&net_430);
  // u_6298: sky130_fd_sc_hd__and4_2
  assign net_367 = (net_338&net_342&net_339&net_340);
  // u_6350: sky130_fd_sc_hd__and3_2
  assign net_478 = (net_338&net_342&net_433);
  // u_6356: sky130_fd_sc_hd__a21o_2
  assign net_274 = (net_338&net_477) | (net_342);
  // u_6403: sky130_fd_sc_hd__a31o_2
  assign net_918 = (net_873&net_604&net_171) | (net_205);
  // u_6404: sky130_fd_sc_hd__and4_2
  assign net_968 = (net_873&net_604&net_205&net_171);
  // u_6437: sky130_fd_sc_hd__o311a_2
  assign net_921 = (net_171&net_878&net_874) | (net_820&net_878&net_874) | (net_879&net_878&net_874);
  // u_6441: sky130_fd_sc_hd__and3_2
  assign net_876 = (net_873&net_604&net_820);
  // u_6444: sky130_fd_sc_hd__mux2_1
  assign net_827 = (net_876&!net_171) | (net_879&net_171);
  // u_6445: sky130_fd_sc_hd__nand2_2
  assign net_879 = (!net_873) | (!net_604);
  // u_6446: sky130_fd_sc_hd__o211a_2
  assign net_972 = (net_820&net_918&net_970) | (net_879&net_918&net_970);
  // u_6472: sky130_fd_sc_hd__nand3b_2
  assign net_820 = (net_173) | (!net_206) | (!net_205);
  // u_6473: sky130_fd_sc_hd__nand3_2
  assign net_878 = (!net_173) | (!net_206) | (!net_968);
  // u_6474: sky130_fd_sc_hd__a21o_2
  assign net_874 = (net_173&net_968) | (net_206);
  // u_6478: sky130_fd_sc_hd__inv_2
  assign net_970 = (!net_968);
  // u_6481: sky130_fd_sc_hd__xor2_2
  assign net_1059 = (net_173&!net_968) | (!net_173&net_968);
  // u_6609: sky130_fd_sc_hd__nor2_2
  assign net_821 = (!net_171&!net_820);
  // u_6802: sky130_fd_sc_hd__and3_2
  assign net_164 = (net_126&net_165&net_192);
  // u_6806: sky130_fd_sc_hd__and4_2
  assign net_126 = (net_105&net_127&net_104&net_102);
  // u_6809: sky130_fd_sc_hd__and3_2
  assign net_192 = (net_163&net_160&net_161);
  // u_6822: sky130_fd_sc_hd__and4_2
  assign net_165 = (net_168&net_195&net_194&net_193);
  // u_6872: sky130_fd_sc_hd__nor2_2
  assign net_232 = (!net_15&!net_36);
  // u_6921: sky130_fd_sc_hd__nor2_2
  assign net_134 = (!net_69&!net_106);
  // u_6936: sky130_fd_sc_hd__nor2_2
  assign net_202 = (!net_136&!net_50);
  // u_6945: sky130_fd_sc_hd__xnor2_2
  assign net_74 = (!net_279&!net_280) | (net_279&net_280);
  // u_6946: sky130_fd_sc_hd__xor2_2
  assign net_12 = (net_237&!net_586) | (!net_237&net_586);
  // u_6947: sky130_fd_sc_hd__o211a_2
  assign net_239 = (net_203&net_74&net_196) | (net_14&net_74&net_196);
  // u_6948: sky130_fd_sc_hd__o311a_2
  assign net_264 = (net_202&net_74&net_216) | (net_12&net_74&net_216) | (net_45&net_74&net_216);
  // u_6949: sky130_fd_sc_hd__o2bb2a_2
  assign net_265 = (!net_1001&net_204) | (!net_178&net_204) | (!net_1001&net_173) | (!net_178&net_173);
  // u_6950: sky130_fd_sc_hd__xor2_2
  assign net_236 = (net_171&!net_173) | (!net_171&net_173);
  // u_6952: sky130_fd_sc_hd__a21o_2
  assign net_237 = (net_138&net_238) | (net_234);
  // u_6953: sky130_fd_sc_hd__nand2_2
  assign net_235 = (!net_206) | (!net_236);
  // u_6954: sky130_fd_sc_hd__a31o_2
  assign net_277 = (net_205&net_173&net_206) | (net_275);
  // u_6955: sky130_fd_sc_hd__a21oi_2
  assign net_178 = (!net_205&!net_172) | (!net_236&!net_172);
  // u_6956: sky130_fd_sc_hd__nand2_2
  assign net_350 = (!net_171) | (!net_173);
  // u_6957: sky130_fd_sc_hd__nor2_2
  assign net_233 = (!net_205&!net_235);
  // u_6960: sky130_fd_sc_hd__mux2_1
  assign net_305 = (net_14&!net_17) | (net_50&net_17);
  // u_6962: sky130_fd_sc_hd__inv_2
  assign net_282 = (!net_41);
  // u_6963: sky130_fd_sc_hd__o22ai_2
  assign net_256 = (!net_96&!net_312) | (!net_50&!net_39);
  // u_6964: sky130_fd_sc_hd__xnor2_2
  assign net_50 = (!net_138&!net_181) | (net_138&net_181);
  // u_6968: sky130_fd_sc_hd__a211o_2
  assign net_250 = (net_50&net_42) | (net_91) | (net_12);
  // u_6969: sky130_fd_sc_hd__nand2b_2
  assign net_783 = (net_762) | (!net_751);
  // u_6970: sky130_fd_sc_hd__nand2_2
  assign net_951 = (!net_751) | (!net_848);
  // u_6971: sky130_fd_sc_hd__nor2_2
  assign net_1040 = (!net_749&!net_848);
  // u_6972: sky130_fd_sc_hd__o31a_2
  assign net_768 = (net_752&net_771) | (net_766&net_771) | (net_765&net_771);
  // u_6973: sky130_fd_sc_hd__and4b_2
  assign net_1083 = (!net_848&net_751&net_749&net_762);
  // u_6974: sky130_fd_sc_hd__o22a_2
  assign net_949 = (net_848&net_951) | (net_898&net_951) | (net_848&net_805) | (net_898&net_805);
  // u_6975: sky130_fd_sc_hd__and2b_2
  assign net_752 = (!net_749&net_751);
  // u_6976: sky130_fd_sc_hd__nor3_2
  assign net_765 = (!net_751&!net_805&!net_770);
  // u_6977: sky130_fd_sc_hd__o21ai_2
  assign net_77 = (!net_15&!net_185) | (!net_12);
  // u_6978: sky130_fd_sc_hd__o211a_2
  assign net_584 = (net_400&net_509&net_417) | (net_466&net_509&net_417);
  // u_6979: sky130_fd_sc_hd__a221o_2
  assign net_465 = (net_446&net_447) | (net_12&net_256) | (net_507);
  // u_6980: sky130_fd_sc_hd__xnor2_2
  assign net_181 = (!net_354&!net_265) | (net_354&net_265);
  // u_6981: sky130_fd_sc_hd__xnor2_2
  assign net_507 = (!net_416&!net_398) | (net_416&net_398);
  // u_6982: sky130_fd_sc_hd__xor2_2
  assign net_312 = (net_279&!net_280) | (!net_279&net_280);
  // u_6983: sky130_fd_sc_hd__xor2_2
  assign net_400 = (net_416&!net_398) | (!net_416&net_398);
  // u_6984: sky130_fd_sc_hd__or3_2
  assign net_403 = (net_507) | (net_239) | (net_316);
  // u_6987: sky130_fd_sc_hd__o211a_2
  assign net_559 = (net_400&net_465&net_417) | (net_549&net_465&net_417);
  // u_6989: sky130_fd_sc_hd__o22a_2
  assign net_1079 = (net_749&net_1082) | (net_751&net_1082) | (net_749&net_1083) | (net_751&net_1083);
  // u_6990: sky130_fd_sc_hd__nor4b_2
  assign net_1041 = (!net_762&!net_749&!net_751&net_848);
  // u_6991: sky130_fd_sc_hd__a31oi_2
  assign net_766 = (!net_806&!net_803) | (!net_785&!net_803) | (!net_808&!net_803);
  // u_6992: sky130_fd_sc_hd__o32ai_2
  assign net_789 = (!net_752&!net_766&!net_786) | (!net_785&!net_762);
  // u_6995: sky130_fd_sc_hd__nand2b_2
  assign net_785 = (net_751) | (!net_848);
  // u_7006: sky130_fd_sc_hd__or3_2
  assign net_1124 = (net_1082) | (net_1083) | (net_1041);
  // u_7057: sky130_fd_sc_hd__a21oi_2
  assign net_1082 = (!net_762&!net_848) | (!net_749&!net_848);
  // u_7091: sky130_fd_sc_hd__a311o_2
  assign net_771 = (net_806&net_785&net_808) | (net_790) | (net_803);
  // u_7104: sky130_fd_sc_hd__nand2b_2
  assign net_808 = (net_848) | (!net_751);
  // u_7153: sky130_fd_sc_hd__a21oi_2
  assign net_803 = (!net_762&!net_848) | (!net_749&!net_848);
  // u_7167: sky130_fd_sc_hd__o21bai_2
  assign net_897 = (!net_805&!net_785) | (net_802);
  // u_7169: sky130_fd_sc_hd__nand2_2
  assign net_898 = (!net_762) | (!net_749);
  // u_7216: sky130_fd_sc_hd__and4bb_2
  assign net_1117 = (!net_751&!net_848&net_762&net_749);
  // u_7230: sky130_fd_sc_hd__nor2_2
  assign net_984 = (!net_848&!net_898);
  // u_7237: sky130_fd_sc_hd__a21o_2
  assign net_1042 = (net_762&net_1040) | (net_1041);
  // u_7238: sky130_fd_sc_hd__nor3_2
  assign net_1080 = (!net_762&!net_749&!net_751);
  // u_7240: sky130_fd_sc_hd__conb_1
  assign net_1051 = 1;
  assign net_1038 = 0;
  // u_7252: sky130_fd_sc_hd__and2_2
  assign net_956 = (net_898&net_951);
  // u_7259: sky130_fd_sc_hd__a31o_2
  assign net_1078 = (net_762&net_751&net_1040) | (net_1080);
  // u_7287: sky130_fd_sc_hd__and2b_2
  assign net_790 = (!net_751&net_762);
  // u_7290: sky130_fd_sc_hd__conb_1
  assign net_775 = 1;
  assign net_769 = 0;
  // u_7291: sky130_fd_sc_hd__a21o_2
  assign net_801 = (net_783&net_764) | (net_749);
  // u_7301: sky130_fd_sc_hd__nand2b_2
  assign net_764 = (net_751) | (!net_762);
  // u_7311: sky130_fd_sc_hd__and2_2
  assign net_786 = (net_749&net_783);
  // u_7314: sky130_fd_sc_hd__and3b_2
  assign net_802 = (!net_805&net_783&net_803);
  // u_7317: sky130_fd_sc_hd__and2_2
  assign net_770 = (net_762&net_749);
  // u_7326: sky130_fd_sc_hd__xnor2_2
  assign net_846 = (!net_802&!net_801) | (net_802&net_801);
  // u_7335: sky130_fd_sc_hd__nor2_2
  assign net_805 = (!net_762&!net_749);
  // u_7374: sky130_fd_sc_hd__nor2_2
  assign net_586 = (!net_548&!net_501);
  // u_7375: sky130_fd_sc_hd__nand2_2
  assign net_238 = (!net_354) | (!net_265);
  // u_7376: sky130_fd_sc_hd__a21o_2
  assign net_279 = (net_237&net_586) | (net_548);
  // u_7379: sky130_fd_sc_hd__a211o_2
  assign net_325 = (net_12&net_22) | (net_305) | (net_74);
  // u_7380: sky130_fd_sc_hd__o22ai_2
  assign net_303 = (!net_324&!net_277) | (!net_205&!net_235);
  // u_7381: sky130_fd_sc_hd__a21o_2
  assign net_398 = (net_302&net_275) | (net_352);
  // u_7382: sky130_fd_sc_hd__and3_2
  assign net_501 = (net_442&net_502&net_463);
  // u_7383: sky130_fd_sc_hd__or3_2
  assign net_463 = (net_233) | (net_275) | (net_370);
  // u_7400: sky130_fd_sc_hd__nor2_2
  assign net_417 = (!net_462&!net_208);
  // u_7404: sky130_fd_sc_hd__and3_2
  assign net_406 = (net_74&net_29&net_562);
  // u_7414: sky130_fd_sc_hd__a21oi_2
  assign net_416 = (!net_279&!net_213) | (!net_303&!net_213);
  // u_7415: sky130_fd_sc_hd__nor2_2
  assign net_234 = (!net_354&!net_265);
  // u_7416: sky130_fd_sc_hd__and2b_2
  assign net_280 = (!net_213&net_303);
  // u_7417: sky130_fd_sc_hd__and3_2
  assign net_370 = (net_350&net_235&net_349);
  // u_7435: sky130_fd_sc_hd__nor2_2
  assign net_462 = (!net_416&!net_398);
  // u_7454: sky130_fd_sc_hd__nor2_2
  assign net_275 = (!net_350&!net_349);
  // u_7465: sky130_fd_sc_hd__nand2_2
  assign net_302 = (!net_205) | (!net_173);
  // u_7546: sky130_fd_sc_hd__a21oi_2
  assign net_352 = (!net_206&!net_275) | (!net_302&!net_275);
  // u_7548: sky130_fd_sc_hd__a21oi_2
  assign net_324 = (!net_205&!net_173) | (!net_206&!net_173);
  // u_7560: sky130_fd_sc_hd__a21oi_2
  assign net_548 = (!net_442&!net_463) | (!net_502&!net_463);
  // u_7563: sky130_fd_sc_hd__o211a_2
  assign net_497 = (net_400&net_355&net_417) | (net_419&net_355&net_417);
  // u_7564: sky130_fd_sc_hd__xnor2_2
  assign net_354 = (!net_547&!net_443) | (net_547&net_443);
  // u_7565: sky130_fd_sc_hd__xnor2_2
  assign net_443 = (!net_302&!net_326) | (net_302&net_326);
  // u_7566: sky130_fd_sc_hd__xnor2_2
  assign net_349 = (!net_205&!net_206) | (net_205&net_206);
  // u_7567: sky130_fd_sc_hd__xor2_2
  assign net_326 = (net_206&!net_236) | (!net_206&net_236);
  // u_7656: sky130_fd_sc_hd__nand2b_2
  assign net_442 = (net_302) | (!net_326);
  // u_7660: sky130_fd_sc_hd__nand2_2
  assign net_502 = (!net_547) | (!net_443);
  // u_7764: sky130_fd_sc_hd__o21ai_2
  assign net_549 = (!net_312&!net_329) | (!net_111);
  // u_7766: sky130_fd_sc_hd__or2_2
  assign net_327 = (net_62) | (net_128);
  // u_7767: sky130_fd_sc_hd__a21oi_2
  assign net_316 = (!net_203&!net_74) | (!net_94&!net_74);
  // u_7768: sky130_fd_sc_hd__a21o_2
  assign net_419 = (net_312&net_374) | (net_406);
  // u_7769: sky130_fd_sc_hd__and3_2
  assign net_16 = (net_50&net_282&net_5);
  // u_7816: sky130_fd_sc_hd__o21ai_2
  assign net_562 = (!net_14&!net_16) | (!net_12);
  // u_7819: sky130_fd_sc_hd__mux2_1
  assign net_466 = (net_418&!net_312) | (net_44&net_312);
  // u_7820: sky130_fd_sc_hd__a31o_2
  assign net_404 = (net_312&net_95&net_467) | (net_400);
  // u_7823: sky130_fd_sc_hd__mux2_1
  assign net_328 = (net_327&!net_12) | (net_313&net_12);
  // u_7824: sky130_fd_sc_hd__o211a_2
  assign net_643 = (net_264&net_417&net_403) | (net_404&net_417&net_403);
  // u_7825: sky130_fd_sc_hd__o211ai_2
  assign net_355 = (!net_312&!net_328) | (!net_325) | (!net_400);
  // u_7832: sky130_fd_sc_hd__o32a_2
  assign net_418 = (net_12&net_134) | (net_12&net_184) | (net_45&net_134) | (net_402&net_134) | (net_45&net_184) | (net_402&net_184);
  // u_7852: sky130_fd_sc_hd__a21oi_2
  assign net_447 = (!net_312&!net_12) | (!net_219&!net_12);
  // u_7854: sky130_fd_sc_hd__or2_2
  assign net_446 = (net_312) | (net_232);
  // u_7914: sky130_fd_sc_hd__a211o_2
  assign net_509 = (net_312&net_119) | (net_79) | (net_507);
  // u_8011: sky130_fd_sc_hd__o32a_2
  assign net_329 = (net_12&net_184) | (net_12&net_90) | (net_45&net_184) | (net_31&net_184) | (net_45&net_90) | (net_31&net_90);
  // u_8044: sky130_fd_sc_hd__a21bo_2
  assign net_374 = (net_12&net_170) | (!net_250);
  // u_8087: sky130_fd_sc_hd__clkbuf_4
  assign net_761 = (net_493);
  // u_8089: sky130_fd_sc_hd__clkbuf_8
  assign net_797 = (net_695);
  // u_8099: sky130_fd_sc_hd__a31o_2
  assign net_676 = (I&net_604&net_678) | (net_707);
  // u_8103: sky130_fd_sc_hd__a21o_2
  assign net_700 = (net_657&net_656) | (net_698);
  // u_8106: sky130_fd_sc_hd__inv_2
  assign net_699 = (!net_657);
  // u_8108: sky130_fd_sc_hd__or4_2
  assign net_655 = (net_698) | (net_699) | (net_684) | (net_674);
  // u_8166: sky130_fd_sc_hd__clkbuf_4
  assign net_800 = (net_797);
  // u_8190: sky130_fd_sc_hd__o21a_2
  assign net_939 = (net_942&net_908) | (net_941&net_908);
  // u_8191: sky130_fd_sc_hd__nand2_2
  assign net_779 = (!I) | (!net_604);
  // u_8192: sky130_fd_sc_hd__o21a_2
  assign net_857 = (net_839&net_787) | (net_838&net_787);
  // u_8196: sky130_fd_sc_hd__a21o_2
  assign net_840 = (net_839&net_838) | (net_837);
  // u_8197: sky130_fd_sc_hd__and2_2
  assign net_193 = (net_698&net_699);
  // u_8200: sky130_fd_sc_hd__a31o_2
  assign net_908 = (I&net_604&net_776) | (net_796);
  // u_8201: sky130_fd_sc_hd__nand2b_2
  assign net_734 = (net_717) | (!net_669);
  // u_8202: sky130_fd_sc_hd__nand2b_2
  assign net_1109 = (net_1110) | (!net_1108);
  // u_8203: sky130_fd_sc_hd__nand4_2
  assign net_669 = (!I) | (!net_604) | (!net_707) | (!net_678);
  // u_8211: sky130_fd_sc_hd__o21a_2
  assign net_1015 = (net_1012&net_1011) | (net_1013&net_1011);
  // u_8212: sky130_fd_sc_hd__nand4_2
  assign net_1013 = (!I) | (!net_604) | (!net_1031) | (!net_979);
  // u_8213: sky130_fd_sc_hd__and4bb_2
  assign net_979 = (!net_643&!net_584&net_559&net_497);
  // u_8215: sky130_fd_sc_hd__nand2b_2
  assign net_1039 = (net_1012) | (!net_1013);
  // u_8218: sky130_fd_sc_hd__and2b_2
  assign net_102 = (!net_1031&net_1012);
  // u_8275: sky130_fd_sc_hd__a31o_2
  assign net_1011 = (I&net_604&net_979) | (net_1031);
  // u_8290: sky130_fd_sc_hd__inv_2
  assign net_938 = (!net_839);
  // u_8321: sky130_fd_sc_hd__nand2b_2
  assign net_892 = (net_942) | (!net_941);
  // u_8325: sky130_fd_sc_hd__and2b_2
  assign net_105 = (!net_796&net_942);
  // u_8367: sky130_fd_sc_hd__and2_2
  assign net_127 = (net_837&net_938);
  // u_8408: sky130_fd_sc_hd__and2b_2
  assign net_194 = (!net_707&net_717);
  // u_8427: sky130_fd_sc_hd__nand4_2
  assign net_941 = (!I) | (!net_604) | (!net_796) | (!net_776);
  // u_8428: sky130_fd_sc_hd__and4bb_2
  assign net_776 = (!net_497&!net_584&net_559&net_643);
  // u_8434: sky130_fd_sc_hd__clkbuf_8
  assign net_493 = (net_695);
  // u_8437: sky130_fd_sc_hd__or4b_2
  assign net_767 = (net_497) | (net_643) | (net_584) | (!net_559);
  // u_8461: sky130_fd_sc_hd__or4_2
  assign net_787 = (net_837) | (net_938) | (net_767) | (net_779);
  // u_8490: sky130_fd_sc_hd__nor2_2
  assign net_838 = (!net_767&!net_779);
  // u_8574: sky130_fd_sc_hd__nand2_2
  assign net_637 = (!I) | (!net_604);
  // u_8575: sky130_fd_sc_hd__and2_2
  assign net_168 = (net_636&net_635);
  // u_8576: sky130_fd_sc_hd__nand2_2
  assign net_674 = (!I) | (!net_604);
  // u_8579: sky130_fd_sc_hd__or4b_2
  assign net_684 = (net_643) | (net_584) | (net_559) | (!net_497);
  // u_8581: sky130_fd_sc_hd__nand4_2
  assign net_491 = (!I) | (!net_604) | (!net_582) | (!net_583);
  // u_8583: sky130_fd_sc_hd__a21o_2
  assign net_646 = (net_658&net_661) | (net_636);
  // u_8590: sky130_fd_sc_hd__and2b_2
  assign net_195 = (!net_582&net_492);
  // u_8592: sky130_fd_sc_hd__nor4_2
  assign net_583 = (!net_497&!net_643&!net_584&!net_559);
  // u_8597: sky130_fd_sc_hd__and4bb_2
  assign net_678 = (!net_584&!net_559&net_643&net_497);
  // u_8600: sky130_fd_sc_hd__o21a_2
  assign net_663 = (net_658&net_640) | (net_661&net_640);
  // u_8604: sky130_fd_sc_hd__or4b_2
  assign net_638 = (net_497) | (net_584) | (net_559) | (!net_643);
  // u_8620: sky130_fd_sc_hd__nor2_2
  assign net_661 = (!net_638&!net_637);
  // u_8658: sky130_fd_sc_hd__o21a_2
  assign net_660 = (net_657&net_655) | (net_656&net_655);
  // u_8660: sky130_fd_sc_hd__inv_2
  assign net_635 = (!net_658);
  // u_8695: sky130_fd_sc_hd__o21a_2
  assign net_677 = (net_717&net_676) | (net_669&net_676);
  // u_8711: sky130_fd_sc_hd__or4_2
  assign net_640 = (net_636) | (net_635) | (net_638) | (net_637);
  // u_8741: sky130_fd_sc_hd__a31o_2
  assign net_521 = (I&net_604&net_583) | (net_582);
  // u_8771: sky130_fd_sc_hd__nor2_2
  assign net_656 = (!net_684&!net_674);
  // u_8867: sky130_fd_sc_hd__o21a_2
  assign net_522 = (net_492&net_521) | (net_491&net_521);
  // u_8881: sky130_fd_sc_hd__nand2b_2
  assign net_440 = (net_492) | (!net_491);
  // u_8995: sky130_fd_sc_hd__xor2_2
  assign net_8 = (net_135&!net_72) | (!net_135&net_72);
  // u_8996: sky130_fd_sc_hd__o22a_2
  assign net_18 = (net_15&net_4) | (net_17&net_4) | (net_15&net_40) | (net_17&net_40);
  // u_8997: sky130_fd_sc_hd__o211a_2
  assign net_48 = (net_20&net_50&net_136) | (net_8&net_50&net_136);
  // u_8998: sky130_fd_sc_hd__and4bb_2
  assign net_213 = (!net_171&!net_205&net_173&net_206);
  // u_8999: sky130_fd_sc_hd__xnor2_2
  assign net_38 = (!net_135&!net_72) | (net_135&net_72);
  // u_9000: sky130_fd_sc_hd__xor2_2
  assign net_15 = (net_138&!net_181) | (!net_138&net_181);
  // u_9001: sky130_fd_sc_hd__or3_2
  assign net_94 = (net_12) | (net_14) | (net_48);
  // u_9002: sky130_fd_sc_hd__a22o_2
  assign net_313 = (net_2&net_50) | (net_39&net_14);
  // u_9003: sky130_fd_sc_hd__nor2_2
  assign net_402 = (!net_50&!net_52);
  // u_9004: sky130_fd_sc_hd__nand2_2
  assign net_216 = (!net_12) | (!net_218);
  // u_9005: sky130_fd_sc_hd__nor2_2
  assign net_14 = (!net_50&!net_69);
  // u_9006: sky130_fd_sc_hd__nor2_2
  assign net_62 = (!net_15&!net_22);
  // u_9007: sky130_fd_sc_hd__or3_2
  assign net_96 = (net_20) | (net_15) | (net_2);
  // u_9008: sky130_fd_sc_hd__or3_2
  assign net_113 = (net_20) | (net_6) | (net_78);
  // u_9009: sky130_fd_sc_hd__inv_2
  assign net_185 = (!net_2);
  // u_9010: sky130_fd_sc_hd__nand2_2
  assign net_106 = (!net_50) | (!net_39);
  // u_9012: sky130_fd_sc_hd__o21a_2
  assign net_30 = (net_20&net_51) | (net_106&net_51);
  // u_9013: sky130_fd_sc_hd__or2_2
  assign net_4 = (net_50) | (net_22);
  // u_9043: sky130_fd_sc_hd__a21bo_2
  assign net_95 = (net_38&net_51) | (!net_120);
  // u_9044: sky130_fd_sc_hd__a31o_2
  assign net_60 = (net_15&net_36&net_5) | (net_46);
  // u_9045: sky130_fd_sc_hd__o31ai_2
  assign net_145 = (!net_20&!net_15&!net_8) | (!net_136);
  // u_9046: sky130_fd_sc_hd__a32o_2
  assign net_119 = (net_12&net_106&net_4) | (net_18&net_120);
  // u_9047: sky130_fd_sc_hd__nand2b_2
  assign net_17 = (net_46) | (!net_22);
  // u_9049: sky130_fd_sc_hd__o21a_2
  assign net_128 = (net_15&net_22) | (net_41&net_22);
  // u_9062: sky130_fd_sc_hd__o31ai_2
  assign net_184 = (!net_50&!net_78&!net_185) | (!net_12);
  // u_9063: sky130_fd_sc_hd__mux2_1
  assign net_218 = (net_52&!net_15) | (net_113&net_15);
  // u_9115: sky130_fd_sc_hd__o21ba_2
  assign net_219 = (net_50&!net_170) | (net_42&!net_170);
  // u_9127: sky130_fd_sc_hd__nand2_2
  assign net_467 = (!net_12) | (!net_145);
  // u_9198: sky130_fd_sc_hd__a21oi_2
  assign net_31 = (!net_50&!net_52) | (!net_46&!net_52);
  // u_9245: sky130_fd_sc_hd__o21a_2
  assign net_76 = (net_15&net_4) | (net_1&net_4);
  // u_9265: sky130_fd_sc_hd__or2_2
  assign net_51 = (net_50) | (net_6);
  // u_9336: sky130_fd_sc_hd__o21a_2
  assign net_91 = (net_20&net_15) | (net_2&net_15);
  // u_9337: sky130_fd_sc_hd__or3_2
  assign net_196 = (net_12) | (net_232) | (net_62);
  // u_9338: sky130_fd_sc_hd__or2_2
  assign net_2 = (net_8) | (net_6);
  // u_9340: sky130_fd_sc_hd__nand2_2
  assign net_42 = (!net_135) | (!net_41);
  // u_9341: sky130_fd_sc_hd__nand2_2
  assign net_28 = (!net_114) | (!net_9);
  // u_9342: sky130_fd_sc_hd__or4_2
  assign net_111 = (net_12) | (net_74) | (net_113) | (net_91);
  // u_9343: sky130_fd_sc_hd__o211a_2
  assign net_208 = (net_171&net_173&net_206) | (net_205&net_173&net_206);
  // u_9344: sky130_fd_sc_hd__and2b_2
  assign net_11 = (!net_72&net_59);
  // u_9345: sky130_fd_sc_hd__nor2_2
  assign net_69 = (!net_38&!net_6);
  // u_9346: sky130_fd_sc_hd__nand2_2
  assign net_59 = (!net_71) | (!net_58);
  // u_9347: sky130_fd_sc_hd__a311o_2
  assign net_29 = (net_135&net_12&net_11) | (net_14) | (net_16);
  // u_9348: sky130_fd_sc_hd__a21oi_2
  assign net_120 = (!net_15&!net_12) | (!net_69&!net_12);
  // u_9351: sky130_fd_sc_hd__and2_2
  assign net_1 = (net_36&net_5);
  // u_9353: sky130_fd_sc_hd__xor2_2
  assign net_141 = (net_1001&!net_178) | (!net_1001&net_178);
  // u_9354: sky130_fd_sc_hd__xor2_2
  assign net_9 = (net_171&!net_205) | (!net_171&net_205);
  // u_9355: sky130_fd_sc_hd__a32o_2
  assign net_138 = (net_114&net_9&net_141) | (net_135&net_72);
  // u_9356: sky130_fd_sc_hd__xnor2_2
  assign net_71 = (!net_114&!net_9) | (net_114&net_9);
  // u_9357: sky130_fd_sc_hd__mux2_1
  assign net_44 = (net_30&!net_12) | (net_60&net_12);
  // u_9358: sky130_fd_sc_hd__o221a_2
  assign net_79 = (net_78&net_76&net_74) | (net_77&net_76&net_74) | (net_78&net_12&net_74) | (net_77&net_12&net_74);
  // u_9360: sky130_fd_sc_hd__xnor2_2
  assign net_135 = (!net_28&!net_141) | (net_28&net_141);
  // u_9470: sky130_fd_sc_hd__and2_2
  assign net_108 = (net_169&net_171);
  // u_9540: sky130_fd_sc_hd__and3_2
  assign net_45 = (net_50&net_38&net_46);
  // u_9597: sky130_fd_sc_hd__nor2_2
  assign net_41 = (!net_107&!net_59);
  // u_9598: sky130_fd_sc_hd__nand2_2
  assign net_136 = (!net_135) | (!net_20);
  // u_9602: sky130_fd_sc_hd__nor2_2
  assign net_20 = (!net_71&!net_37);
  // u_9605: sky130_fd_sc_hd__nand2_2
  assign net_39 = (!net_38) | (!net_6);
  // u_9607: sky130_fd_sc_hd__or2_2
  assign net_37 = (net_108) | (net_107);
  // u_9608: sky130_fd_sc_hd__nand2_2
  assign net_58 = (!net_169) | (!net_171);
  // u_9611: sky130_fd_sc_hd__or3_2
  assign net_52 = (net_20) | (net_38) | (net_6);
  // u_9612: sky130_fd_sc_hd__or2_2
  assign net_22 = (net_8) | (net_11);
  // u_9614: sky130_fd_sc_hd__nand2_2
  assign net_203 = (!net_12) | (!net_106);
  // u_9615: sky130_fd_sc_hd__and2_2
  assign net_46 = (net_37&net_11);
  // u_9622: sky130_fd_sc_hd__nand2_2
  assign net_204 = (!net_171) | (!net_205);
  // u_9636: sky130_fd_sc_hd__nor2_2
  assign net_107 = (!net_169&!net_171);
  // u_9637: sky130_fd_sc_hd__nor2_2
  assign net_172 = (!net_205&!net_173);
  // u_9705: sky130_fd_sc_hd__nand2_2
  assign net_36 = (!net_135) | (!net_11);
  // u_9714: sky130_fd_sc_hd__nor2_2
  assign net_170 = (!net_136&!net_15);
  // u_9730: sky130_fd_sc_hd__nor2_2
  assign net_40 = (!net_108&!net_107);
  // u_9760: sky130_fd_sc_hd__nor2_2
  assign net_90 = (!net_15&!net_69);
  // u_9763: sky130_fd_sc_hd__nand2_2
  assign net_5 = (!net_37) | (!net_38);
  // u_9790: sky130_fd_sc_hd__nor2_2
  assign net_78 = (!net_38&!net_41);
  // u_9810: sky130_fd_sc_hd__nor2_2
  assign net_6 = (!net_40&!net_11);
  // u_9818: sky130_fd_sc_hd__nor2_2
  assign net_72 = (!net_71&!net_58);

  // Recovered sequential standard cells.
  // u_226: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2212 or negedge rst_n) begin
    if (!rst_n) net_2329 <= 1'b0;
    else net_2329 <= net_2564;
  end
  // u_227: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2212 or negedge rst_n) begin
    if (!rst_n) net_2403 <= 1'b0;
    else net_2403 <= net_2501;
  end
  // u_228: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2212 or negedge rst_n) begin
    if (!rst_n) net_2380 <= 1'b0;
    else net_2380 <= net_2543;
  end
  // u_234: sky130_fd_sc_hd__dfxtp_2
  always @(posedge net_2033) begin
    net_751 <= net_2332;
  end
  // u_235: sky130_fd_sc_hd__dfxtp_2
  always @(posedge net_2212) begin
    net_762 <= net_2388;
  end
  // u_236: sky130_fd_sc_hd__dfxtp_2
  always @(posedge net_2212) begin
    net_749 <= net_2411;
  end
  // u_237: sky130_fd_sc_hd__dfxtp_2
  always @(posedge net_2033) begin
    net_848 <= net_2317;
  end
  // u_1228: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2276 <= 1'b0;
    else net_2276 <= net_2307;
  end
  // u_1229: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2226 <= 1'b0;
    else net_2226 <= net_2240;
  end
  // u_1230: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2296 or negedge rst_n) begin
    if (!rst_n) net_2347 <= 1'b0;
    else net_2347 <= net_2354;
  end
  // u_1249: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2101 <= 1'b0;
    else net_2101 <= net_2075;
  end
  // u_1250: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2033 or negedge rst_n) begin
    if (!rst_n) net_1996 <= 1'b0;
    else net_1996 <= net_1997;
  end
  // u_1258: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2296 or negedge rst_n) begin
    if (!rst_n) net_2443 <= 1'b0;
    else net_2443 <= net_2438;
  end
  // u_1259: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2532 <= 1'b0;
    else net_2532 <= net_2531;
  end
  // u_1260: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2581 <= 1'b0;
    else net_2581 <= net_2583;
  end
  // u_1261: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2512 <= 1'b0;
    else net_2512 <= net_2557;
  end
  // u_1264: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2157 <= 1'b0;
    else net_2157 <= net_2160;
  end
  // u_1383: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2493 <= 1'b0;
    else net_2493 <= net_2489;
  end
  // u_1384: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2296 or negedge rst_n) begin
    if (!rst_n) net_2511 <= 1'b0;
    else net_2511 <= net_2510;
  end
  // u_1385: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2296 or negedge rst_n) begin
    if (!rst_n) net_2579 <= 1'b0;
    else net_2579 <= net_2582;
  end
  // u_1626: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2442 <= 1'b0;
    else net_2442 <= net_2464;
  end
  // u_1808: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2296 or negedge rst_n) begin
    if (!rst_n) net_2273 <= 1'b0;
    else net_2273 <= net_2274;
  end
  // u_1809: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2241 <= 1'b0;
    else net_2241 <= net_2243;
  end
  // u_1810: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2322 or negedge rst_n) begin
    if (!rst_n) net_2346 <= 1'b0;
    else net_2346 <= net_2345;
  end
  // u_2036: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2023 or negedge rst_n) begin
    if (!rst_n) net_2155 <= 1'b0;
    else net_2155 <= net_2132;
  end
  // u_2037: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2033 or negedge rst_n) begin
    if (!rst_n) net_2069 <= 1'b0;
    else net_2069 <= net_2097;
  end
  // u_2039: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_2033 or negedge rst_n) begin
    if (!rst_n) net_1998 <= 1'b0;
    else net_1998 <= net_2011;
  end
  // u_2293: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1805 <= 1'b0;
    else net_1805 <= net_1800;
  end
  // u_2299: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1193 <= 1'b0;
    else net_1193 <= net_1230;
  end
  // u_2301: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1379 <= 1'b0;
    else net_1379 <= net_1368;
  end
  // u_2372: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1797 <= 1'b0;
    else net_1797 <= net_1752;
  end
  // u_2542: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1187 <= 1'b0;
    else net_1187 <= net_1206;
  end
  // u_2574: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1325 <= 1'b0;
    else net_1325 <= net_1420;
  end
  // u_2708: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1165 <= 1'b0;
    else net_1165 <= net_1257;
  end
  // u_2709: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1129 <= 1'b0;
    else net_1129 <= net_1132;
  end
  // u_2710: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1164 <= 1'b0;
    else net_1164 <= net_1166;
  end
  // u_2944: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1950 <= 1'b0;
    else net_1950 <= net_1913;
  end
  // u_2946: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1812 <= 1'b0;
    else net_1812 <= net_1927;
  end
  // u_2947: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1265 or negedge rst_n) begin
    if (!rst_n) net_1715 <= 1'b0;
    else net_1715 <= net_1713;
  end
  // u_2948: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1763 <= 1'b0;
    else net_1763 <= net_1767;
  end
  // u_2957: sky130_fd_sc_hd__dfstp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1806 <= 1'b1;
    else net_1806 <= net_1850;
  end
  // u_2958: sky130_fd_sc_hd__dfstp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1813 <= 1'b1;
    else net_1813 <= net_1851;
  end
  // u_2959: sky130_fd_sc_hd__dfstp_2
  always @(posedge net_2033 or negedge rst_n) begin
    if (!rst_n) net_1675 <= 1'b1;
    else net_1675 <= net_1844;
  end
  // u_2960: sky130_fd_sc_hd__dfstp_2
  always @(posedge net_1712 or negedge rst_n) begin
    if (!rst_n) net_1740 <= 1'b1;
    else net_1740 <= net_1730;
  end
  // u_4182: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1968 <= 1'b0;
    else net_1968 <= net_2007;
  end
  // u_4659: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_1001 <= 1'b0;
    else net_1001 <= net_1307;
  end
  // u_4661: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_547 <= 1'b0;
    else net_547 <= net_1568;
  end
  // u_4662: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_169 <= 1'b0;
    else net_169 <= net_1448;
  end
  // u_4838: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_114 <= 1'b0;
    else net_114 <= net_1394;
  end
  // u_4993: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1313 or negedge rst_n) begin
    if (!rst_n) net_1309 <= 1'b0;
    else net_1309 <= net_1351;
  end
  // u_5000: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1577 <= 1'b0;
    else net_1577 <= net_1584;
  end
  // u_5004: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_1402 <= 1'b0;
    else net_1402 <= net_1354;
  end
  // u_5093: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1575 or negedge rst_n) begin
    if (!rst_n) net_1596 <= 1'b0;
    else net_1596 <= net_1597;
  end
  // u_5336: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1313 or negedge rst_n) begin
    if (!rst_n) net_1512 <= 1'b0;
    else net_1512 <= net_1514;
  end
  // u_5337: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1313 or negedge rst_n) begin
    if (!rst_n) net_1360 <= 1'b0;
    else net_1360 <= net_1466;
  end
  // u_5339: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1313 or negedge rst_n) begin
    if (!rst_n) net_1358 <= 1'b0;
    else net_1358 <= net_1412;
  end
  // u_5342: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1349 <= 1'b0;
    else net_1349 <= net_1279;
  end
  // u_5343: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1248 <= 1'b0;
    else net_1248 <= net_1250;
  end
  // u_5344: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1308 <= 1'b0;
    else net_1308 <= net_1315;
  end
  // u_5399: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1313 or negedge rst_n) begin
    if (!rst_n) net_1458 <= 1'b0;
    else net_1458 <= net_1464;
  end
  // u_5401: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1348 or negedge rst_n) begin
    if (!rst_n) net_1547 <= 1'b0;
    else net_1547 <= net_1544;
  end
  // u_5569: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1212 <= 1'b0;
    else net_1212 <= net_1214;
  end
  // u_5634: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_974 <= 1'b0;
    else net_974 <= net_928;
  end
  // u_5638: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_828 <= 1'b0;
    else net_828 <= net_831;
  end
  // u_5639: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_1006 <= 1'b0;
    else net_1006 <= net_1007;
  end
  // u_6095: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_433 <= 1'b0;
    else net_433 <= net_458;
  end
  // u_6106: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_342 <= 1'b0;
    else net_342 <= net_263;
  end
  // u_6109: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_338 <= 1'b0;
    else net_338 <= net_347;
  end
  // u_6111: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_603 <= 1'b0;
    else net_603 <= net_555;
  end
  // u_6159: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_534 <= 1'b0;
    else net_534 <= net_578;
  end
  // u_6197: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_415 <= 1'b0;
    else net_415 <= net_384;
  end
  // u_6198: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_339 <= 1'b0;
    else net_339 <= net_297;
  end
  // u_6199: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_484 <= 1'b0;
    else net_484 <= net_519;
  end
  // u_6435: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_206 <= 1'b0;
    else net_206 <= net_921;
  end
  // u_6436: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_173 <= 1'b0;
    else net_173 <= net_1059;
  end
  // u_6442: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_294 or negedge rst_n) begin
    if (!rst_n) net_171 <= 1'b0;
    else net_171 <= net_827;
  end
  // u_6451: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_829 or negedge rst_n) begin
    if (!rst_n) net_205 <= 1'b0;
    else net_205 <= net_972;
  end
  // u_8084: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_492 <= 1'b0;
    else net_492 <= net_440;
  end
  // u_8085: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_837 <= 1'b0;
    else net_837 <= net_840;
  end
  // u_8086: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_797 or negedge rst_n) begin
    if (!rst_n) net_1012 <= 1'b0;
    else net_1012 <= net_1039;
  end
  // u_8090: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_797 or negedge rst_n) begin
    if (!rst_n) net_942 <= 1'b0;
    else net_942 <= net_892;
  end
  // u_8091: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_1070 or negedge rst_n) begin
    if (!rst_n) net_1110 <= 1'b0;
    else net_1110 <= net_1109;
  end
  // u_8092: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_657 <= 1'b0;
    else net_657 <= net_660;
  end
  // u_8095: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_707 <= 1'b0;
    else net_707 <= net_677;
  end
  // u_8199: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_797 or negedge rst_n) begin
    if (!rst_n) net_839 <= 1'b0;
    else net_839 <= net_857;
  end
  // u_8214: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_797 or negedge rst_n) begin
    if (!rst_n) net_796 <= 1'b0;
    else net_796 <= net_939;
  end
  // u_8219: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_797 or negedge rst_n) begin
    if (!rst_n) net_1031 <= 1'b0;
    else net_1031 <= net_1015;
  end
  // u_8429: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_717 <= 1'b0;
    else net_717 <= net_734;
  end
  // u_8431: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_698 <= 1'b0;
    else net_698 <= net_700;
  end
  // u_8591: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_348 or negedge rst_n) begin
    if (!rst_n) net_636 <= 1'b0;
    else net_636 <= net_646;
  end
  // u_8602: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_658 <= 1'b0;
    else net_658 <= net_663;
  end
  // u_8815: sky130_fd_sc_hd__dfrtp_2
  always @(posedge net_493 or negedge rst_n) begin
    if (!rst_n) net_582 <= 1'b0;
    else net_582 <= net_522;
  end
endmodule
