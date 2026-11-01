// Structural output decoder recovered from labeled GDS nets.
// Compile with cells/*.v from the same output directory.
module recovered_output_logic (
    input wire net_806,  // unlabeled extracted input
    input wire [3:0] register_02,  // recovered register boundary
    input wire [7:0] register_07,  // recovered register boundary
    input wire [2:0] register_09,  // recovered register boundary
    input wire [7:0] register_12,  // recovered register boundary
    output wire success,
    output wire [7:0] O
);

  // Extracted combinational nets.
  wire net_340;
  wire net_393;
  wire net_457;
  wire net_480;
  wire net_488;
  wire net_537;
  wire net_581;
  wire net_627;
  wire net_673;
  wire net_752;
  wire net_764;
  wire net_765;
  wire net_766;
  wire net_768;
  wire net_770;
  wire net_771;
  wire net_783;
  wire net_785;
  wire net_786;
  wire net_789;
  wire net_790;
  wire net_801;
  wire net_802;
  wire net_803;
  wire net_805;
  wire net_808;
  wire net_846;
  wire net_897;
  wire net_898;
  wire net_949;
  wire net_951;
  wire net_956;
  wire net_984;
  wire net_1040;
  wire net_1041;
  wire net_1042;
  wire net_1078;
  wire net_1079;
  wire net_1080;
  wire net_1082;
  wire net_1083;
  wire net_1117;
  wire net_1124;
  wire net_1135;
  wire net_1136;
  wire net_1155;
  wire net_1173;
  wire net_1174;
  wire net_1175;
  wire net_1176;
  wire net_1177;
  wire net_1179;
  wire net_1198;
  wire net_1199;
  wire net_1200;
  wire net_1231;
  wire net_1232;
  wire net_1235;
  wire net_1268;
  wire net_1293;
  wire net_1331;
  wire net_1370;
  wire net_1372;
  wire net_1373;
  wire net_1374;
  wire net_1380;
  wire net_1426;
  wire net_1427;
  wire net_1429;
  wire net_1431;
  wire net_1436;
  wire net_1474;
  wire net_1522;
  wire net_1523;
  wire net_1554;
  wire net_1610;
  wire net_1611;
  wire net_1618;
  wire net_1625;
  wire net_1627;
  wire net_1629;
  wire net_1630;
  wire net_1631;
  wire net_1633;
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
  wire net_1677;
  wire net_1695;
  wire net_1697;
  wire net_1700;
  wire net_1707;
  wire net_1714;
  wire net_1759;
  wire net_1760;
  wire net_1764;
  wire net_1783;
  wire net_1786;
  wire net_1820;
  wire net_1862;
  wire net_1878;
  wire net_1879;
  wire net_1917;
  wire net_1919;
  wire net_2015;
  wire net_2055;
  wire net_2057;
  wire net_2058;
  wire net_2059;
  wire net_2061;
  wire net_2063;
  wire net_2082;
  wire net_2084;
  wire net_2085;
  wire net_2087;
  wire net_2090;
  wire net_2098;
  wire net_2109;
  wire net_2110;
  wire net_2112;
  wire net_2117;
  wire net_2118;
  wire net_2138;
  wire net_2140;
  wire net_2141;
  wire net_2143;
  wire net_2145;
  wire net_2165;
  wire net_2166;
  wire net_2167;
  wire net_2168;
  wire net_2169;
  wire net_2172;
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
  wire net_2232;
  wire net_2235;
  wire net_2236;
  wire net_2302;
  wire net_2355;
  wire net_2356;
  wire net_2361;
  wire net_2363;
  wire net_2401;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__a211oi_2 u_67 (
      .A1(register_02[1]),
      .A2(register_02[2]),
      .B1(register_02[0]),
      .C1(register_02[3]),
      .Y(net_1136)
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

  sky130_fd_sc_hd__or3b_2 u_3287 (
      .A(register_02[1]),
      .B(register_02[0]),
      .C_N(register_02[2]),
      .X(net_1700)
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

  sky130_fd_sc_hd__or3_2 u_5612 (
      .A(register_07[3]),
      .B(register_07[0]),
      .C(register_07[4]),
      .X(net_480)
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

  sky130_fd_sc_hd__nor3_2 u_5616 (
      .A(register_07[5]),
      .B(register_07[7]),
      .C(net_480),
      .Y(net_340)
  );

  sky130_fd_sc_hd__and3_2 u_6092 (
      .A(net_537),
      .B(net_488),
      .C(net_457),
      .X(net_581)
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

  sky130_fd_sc_hd__nand2_2 u_3809 (
      .A(net_1629),
      .B(net_1610),
      .Y(net_1611)
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

  sky130_fd_sc_hd__nor4b_2 u_6107 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[6]),
      .D_N(net_340),
      .Y(net_393)
  );

  sky130_fd_sc_hd__o21ba_2 u_387 (
      .A1(register_09[2]),
      .A2(register_09[1]),
      .B1_N(net_581),
      .X(net_2401)
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

  sky130_fd_sc_hd__nor2_2 u_498 (
      .A(net_393),
      .B(net_2401),
      .Y(net_2165)
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

endmodule
