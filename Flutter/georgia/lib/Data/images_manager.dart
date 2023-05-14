import 'package:flutter/material.dart';

class ImagesManager {
  static Image? getImage(int index) {
    return _idsImages.contains(index)
        ? Image.asset('assets/images_tiket/georgia_image_for_tiket_$index.jpg')
        : null;
  }

  static final List<int> _idsImages = [
    1,
    2,
    4,
    5,
    6,
    7,
    10,
    13,
    14,
    15,
    16,
    17,
    18,
    20,
    21,
    23,
    24,
    26,
    27,
    29,
    33,
    35,
    37,
    38,
    39,
    41,
    42,
    45,
    47,
    48,
    49,
    50,
    51,
    52,
    53,
    54,
    59,
    63,
    64,
    65,
    66,
    68,
    69,
    73,
    75,
    76,
    78,
    80,
    81,
    88,
    89,
    91,
    92,
    96,
    97,
    99,
    102,
    105,
    106,
    107,
    108,
    109,
    110,
    113,
    114,
    115,
    116,
    118,
    119,
    120,
    121,
    126,
    128,
    134,
    137,
    138,
    139,
    140,
    141,
    142,
    143,
    144,
    146,
    148,
    149,
    150,
    151,
    152,
    153,
    155,
    157,
    158,
    165,
    166,
    167,
    168,
    169,
    170,
    171,
    175,
    187,
    189,
    192,
    193,
    194,
    195,
    196,
    198,
    199,
    200,
    202,
    203,
    205,
    206,
    207,
    211,
    212,
    213,
    224,
    225,
    226,
    228,
    229,
    230,
    231,
    232,
    233,
    235,
    248,
    250,
    254,
    255,
    256,
    257,
    261,
    262,
    264,
    265,
    267,
    269,
    270,
    271,
    273,
    274,
    275,
    276,
    277,
    279,
    280,
    282,
    283,
    285,
    286,
    287,
    288,
    289,
    290,
    291,
    292,
    297,
    298,
    299,
    300,
    301,
    302,
    304,
    305,
    307,
    310,
    311,
    312,
    313,
    314,
    317,
    320,
    321,
    322,
    324,
    326,
    327,
    329,
    330,
    336,
    337,
    339,
    342,
    343,
    344,
    345,
    346,
    348,
    350,
    352,
    353,
    359,
    360,
    361,
    367,
    368,
    369,
    370,
    371,
    372,
    373,
    374,
    375,
    376,
    377,
    378,
    379,
    383,
    384,
    385,
    388,
    389,
    390,
    391,
    402,
    403,
    404,
    405,
    406,
    407,
    408,
    409,
    414,
    415,
    416,
    417,
    418,
    419,
    421,
    422,
    423,
    425,
    427,
    428,
    430,
    431,
    432,
    434,
    435,
    436,
    437,
    440,
    451,
    452,
    453,
    454,
    455,
    456,
    457,
    458,
    460,
    461,
    462,
    464,
    468,
    469,
    472,
    477,
    478,
    479,
    480,
    481,
    482,
    483,
    484,
    485,
    486,
    487,
    488,
    489,
    492,
    497,
    503,
    504,
    507,
    508,
    510,
    511,
    512,
    513,
    515,
    518,
    519,
    539,
    540,
    541,
    544,
    545,
    546,
    547,
    548,
    549,
    550,
    552,
    553,
    590,
    601,
    602,
    605,
    607,
    610,
    611,
    614,
    616,
    618,
    620,
    622,
    625,
    628,
    630,
    631,
    633,
    635,
    636,
    638,
    639,
    640,
    641,
    645,
    646,
    647,
    649,
    650,
    651,
    652,
    653,
    654,
    655,
    656,
    657,
    658,
    659,
    660,
    661,
    662,
    663,
    664,
    665,
    666,
    667,
    668,
    669,
    670,
    671,
    673,
    675,
    677,
    679,
    681,
    683,
    685,
    687,
    689,
    691,
    696,
    697,
    698,
    699,
    706,
    708,
    710,
    712,
    714,
    716,
    718,
    722,
    724,
    726,
    731,
    732,
    735,
    737,
    738,
    740,
    742,
    745,
    746,
    749,
    750,
    751,
    752,
    754,
    756,
    758,
    760,
    762,
    764,
    766,
    768,
    770,
    771,
    774,
    776,
    777,
    778,
    779,
    780,
    782,
    784,
    785,
    787,
    789,
    790,
    792,
    794,
    796,
    798,
    799,
    800,
    999,
    1000,
    1001,
    1013,
    1014,
    1015,
    1016,
    1017,
    1018,
    1019,
    1020,
    1021,
    1024,
    1025,
    1026,
    1028,
    1045,
    1047,
    1102,
    1136,
    1137,
    1138,
    1140,
    1142,
    1145,
    1147,
    1149,
    1151,
    1152,
    1154,
    1155,
    1156,
    1157,
    1158,
    1159,
    1160,
    1161,
    1163,
    1164,
    1168,
    1170,
    1171,
    1172,
    1173,
    1174,
    1175,
    1176,
    1177,
    1178,
    1179,
    1181,
    1182,
    1184,
    1185,
    1186,
    1187,
    1188,
    1189,
    1191,
    1192,
    1193,
    1196,
    1198,
    1199,
    1201,
    1203,
    1205,
    1208,
    1211,
    1213,
    1215,
    1216,
    1219,
    1220,
    1224,
    1225,
    1226,
    1227,
    1228,
    1230,
    1232,
    1234,
    1236,
    1238,
    1239,
    1240,
    1241,
    1242,
    1243,
    1244,
    1245,
    1246,
    1247,
    1248,
    1249,
    1250,
    1252,
    1253,
    1254,
    1255,
    1256,
    1257,
    1258,
    1259,
    1260,
    1261,
    1262,
    1263,
    1269,
    1270,
    1271,
    1273,
    1275,
    1276,
    1278,
    1281,
    1282,
    1325
  ];
}