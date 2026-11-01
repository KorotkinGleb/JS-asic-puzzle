// Native output decoder recovered from labeled GDS output nets.
// Register vectors form its sequential boundary.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_67: sky130_fd_sc_hd__a211oi_2
  assign net_1136 = (!register_02[1]&!register_02[0]&!register_02[3]) | (!register_02[2]&!register_02[0]&!register_02[3]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_02[3]) | (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_385: sky130_fd_sc_hd__inv_2
  assign net_2356 = (!register_09[2]);
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
  // u_3287: sky130_fd_sc_hd__or3b_2
  assign net_1700 = (register_02[1]) | (register_02[0]) | (!register_02[2]);
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
  // u_5612: sky130_fd_sc_hd__or3_2
  assign net_480 = (register_07[3]) | (register_07[0]) | (register_07[4]);
  // u_6032: sky130_fd_sc_hd__and2_2
  assign net_457 = (register_07[6]&register_07[5]);
  // u_6094: sky130_fd_sc_hd__and2b_2
  assign net_488 = (!register_07[2]&register_07[3]);
  // u_6194: sky130_fd_sc_hd__and4bb_2
  assign net_537 = (!register_07[1]&!register_07[4]&register_07[7]&register_07[0]);
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
  // u_2933: sky130_fd_sc_hd__o211a_2
  assign net_1426 = (net_1429&net_1370&register_02[2]) | (register_02[0]&net_1370&register_02[2]);
  // u_2925: sky130_fd_sc_hd__xnor2_2
  assign net_1610 = (!register_02[3]&!net_1820) | (register_02[3]&net_1820);
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
  // u_5616: sky130_fd_sc_hd__nor3_2
  assign net_340 = (!register_07[5]&!register_07[7]&!net_480);
  // u_6092: sky130_fd_sc_hd__and3_2
  assign net_581 = (net_537&net_488&net_457);
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
  // u_3809: sky130_fd_sc_hd__nand2_2
  assign net_1611 = (!net_1629) | (!net_1610);
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
  // u_6107: sky130_fd_sc_hd__nor4b_2
  assign net_393 = (!register_07[2]&!register_07[1]&!register_07[6]&net_340);
  // u_387: sky130_fd_sc_hd__o21ba_2
  assign net_2401 = (register_09[2]&!net_581) | (register_09[1]&!net_581);
  // u_6992: sky130_fd_sc_hd__o32ai_2
  assign net_789 = (!net_752&!net_766&!net_786) | (!net_785&!register_02[1]);
  // u_6972: sky130_fd_sc_hd__o31a_2
  assign net_768 = (net_752&net_771) | (net_766&net_771) | (net_765&net_771);
  // u_7167: sky130_fd_sc_hd__o21bai_2
  assign net_897 = (!net_805&!net_785) | (net_802);
  // u_7326: sky130_fd_sc_hd__xnor2_2
  assign net_846 = (!net_802&!net_801) | (net_802&net_801);
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
  // u_203: sky130_fd_sc_hd__a211oi_2
  assign net_2112 = (!net_2356&!net_581&!net_393) | (!register_09[1]&!net_581&!net_393);
  // u_536: sky130_fd_sc_hd__or4b_2
  assign net_2355 = (net_393) | (register_09[2]) | (net_581) | (!register_09[1]);
  // u_498: sky130_fd_sc_hd__nor2_2
  assign net_2165 = (!net_393&!net_2401);
  // u_3161: sky130_fd_sc_hd__xnor2_2
  assign net_1707 = (!register_12[4]&!net_1659) | (register_12[4]&net_1659);
  // u_169: sky130_fd_sc_hd__xor2_2
  assign net_2015 = (register_12[5]&!net_1879) | (!register_12[5]&net_1879);
  // u_2951: sky130_fd_sc_hd__xor2_2
  assign net_1654 = (register_12[1]&!net_1633) | (!register_12[1]&net_1633);
  // u_200: sky130_fd_sc_hd__inv_2
  assign net_2166 = (!net_2355);
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

  assign O[0] = net_2363;  // net_2363
  assign O[1] = net_1697;  // net_1697
  assign O[2] = net_1474;  // net_1474
  assign O[3] = net_1155;  // net_1155
  assign O[4] = net_1862;  // net_1862
  assign O[5] = net_673;  // net_673
  assign O[6] = net_627;  // net_627
  assign O[7] = net_2361;  // net_2361
  assign success = register_09[2];  // net_2380
endmodule
