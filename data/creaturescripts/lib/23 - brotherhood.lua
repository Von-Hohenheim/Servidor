function doSummonNpcBrotherhood(cid)

local summons = {
["Easy"] = {
	npcs = {"B-ana", "B-annie", "B-brandier", "B-caska", "B-creator", "B-danjen", "B-flednan", "B-guth", "B-hick", "B-issei", "B-jamal", "B-jendon", "B-josue", "B-lady", "B-lesgeor", "B-marma", "B-nielwen", "B-nigrim", "B-nigrim", "B-riani", "B-saphira", "B-sarao", "B-stele", "B-taza", "B-waldron"},
	pos = {{x = 1119, y = 738, z = 7}, {x = 1197, y = 818, z = 7}, {x = 1173, y = 917, z = 7}, {x = 1239, y = 899, z = 7}, {x = 1247, y = 867, z = 6}, {x = 1198, y = 869, z = 5}, {x = 1212, y = 803, z = 5}, {x = 1269, y = 898, z = 5}, {x = 1228, y = 946, z = 5}, {x = 1201, y = 925, z = 5}, {x = 1162, y = 874, z = 6}, {x = 1101, y = 888, z = 7}, {x = 955, y = 889, z = 7}, {x = 1008, y = 889, z = 8}, {x = 989, y = 969, z = 8}, {x = 1067, y = 957, z = 8}, {x = 840, y = 1074, z = 7}, {x = 1058, y = 1207, z = 7}, {x = 1074, y = 1095, z = 6}, {x = 1042, y = 1126, z = 6}, {x = 1059, y = 1058, z = 6}, {x = 1056, y = 1059, z = 5}, {x = 1069, y = 1129, z = 5}, {x = 1067, y = 1062, z = 4}, {x = 806, y = 830, z = 7}, {x = 804, y = 778, z = 7}, {x = 768, y = 819, z = 7}, {x = 887, y = 869, z = 7}, {x = 1046, y = 1360, z = 7}, {x = 1078, y = 1399, z = 7}, {x = 1142, y = 1426, z = 7}, {x = 1108, y = 1512, z = 7}, {x = 1052, y = 1526, z = 7}, {x = 1022, y = 1579, z = 7}, {x = 573, y = 1180, z = 7}, {x = 430, y = 1110, z = 7}, {x = 334, y = 1098, z = 7}, {x = 435, y = 1013, z = 7}}
},
["Medium"] = {
	npcs = {"B-anke", "B-caiou", "B-conmann", "B-dania", "B-ealorah", "B-eversa", "B-fercon", "B-fernya", "B-fred", "B-hamchell", "B-jack", "B-kreegel", "B-larisswan", "B-lesung", "B-loren", "B-mel", "B-munfa", "B-niel", "B-paulcan", "B-rah", "B-ron", "B-ruthta", "B-stella", "B-taja", "B-tyren"},
	pos = {{x = 1361, y = 874, z = 7}, {x = 1360, y = 871, z = 6}, {x = 1321, y = 875, z = 6},{x = 1336, y = 864, z = 6}, {x = 1310, y = 882, z = 6}, {x = 1309, y = 866, z = 6}, {x = 1318, y = 873, z = 5}, {x = 1333, y = 865, z = 5}, {x = 1339, y = 879, z = 5}, {x = 1309, y = 862, z = 5}, {x = 1325, y = 873, z = 4}, {x = 1325, y = 873, z = 4}, {x = 1324, y = 891, z = 4}, {x = 1323, y = 874, z = 3}, {x = 1325, y = 874, z = 2}, {x = 1328, y = 872, z = 1}, {x = 1323, y = 872, z = 0}, {x = 1228, y = 992, z = 4}, {x = 1222, y = 991, z = 5}, {x = 1075, y = 1095, z = 6}, {x = 1034, y = 1115, z = 6}, {x = 877, y = 1071, z = 5}, {x = 893, y = 944, z = 5}, {x = 759, y = 777, z = 5}, {x = 734, y = 747, z = 5}, {x = 704, y = 774, z = 4}, {x = 755, y = 776, z = 4}, {x = 488, y = 902, z = 7}, {x = 483, y = 860, z = 6}, {x = 540, y = 947, z = 7}, {x = 540, y = 947, z = 7}, {x = 650, y = 971, z = 6}, {x = 303, y = 1869, z = 7}, {x = 374, y = 1893, z = 7}, {x = 434, y = 1833, z = 7}, {x = 422, y = 1785, z = 7}, {x = 409, y = 1772, z = 6}, {x = 304, y = 1824, z = 5}, {x = 385, y = 1878, z = 5}, {x = 419, y = 1876, z = 6}}
},
["Hard"] = {
	npcs = {"B-ace", "B-anfas", "B-archela", "B-bandio", "B-carson", "B-charnea", "B-cia", "B-cristopher", "B-drowner", "B-egelrah", "B-elfmann", "B-gar", "B-kimto", "B-lessha", "B-leyeli", "B-marberou", "B-nanhe", "B-nasrah", "B-rencuth", "B-rogerio", "B-solarah", "B-sylkya", "B-tarlon", "B-thonya", "B-wilson"},
	pos = {{x = 1437, y = 240, z = 5}, {x = 1407, y = 388, z = 6}, {x = 1356, y = 273, z = 5}, {x = 1302, y = 269, z = 5}, {x = 1322, y = 306, z = 5}, {x = 1355, y = 240, z = 5}, {x = 1472, y = 276, z = 5}, {x = 1509, y = 380, z = 5}, {x = 1507, y = 335, z = 5}, {x = 1472, y = 402, z = 5}, {x = 1443, y = 371, z = 5}, {x = 1476, y = 368, z = 5}, {x = 1534, y = 366, z = 5}, {x = 1335, y = 399, z = 5}, {x = 1306, y = 412, z = 5}, {x = 1308, y = 386, z = 5}, {x = 1278, y = 413, z = 5}, {x = 1276, y = 437, z = 5}, {x = 1220, y = 440, z = 5}, {x = 1187, y = 414, z = 5}, {x = 1170, y = 415, z = 5}, {x = 1221, y = 390, z = 5}, {x = 1172, y = 355, z = 5}, {x = 1204, y = 330, z = 5}, {x = 1232, y = 323, z = 5}, {x = 1231, y = 290, z = 5}, {x = 1220, y = 255, z = 5}, {x = 1179, y = 266, z = 5}, {x = 1169, y = 298, z = 5}, {x = 1141, y = 333, z = 5}, {x = 1110, y = 233, z = 7}, {x = 899, y = 468, z = 7}, {x = 867, y = 496, z = 7}, {x = 814, y = 498, z = 7}, {x = 837, y = 439, z = 7}, {x = 814, y = 478, z = 7}, {x = 775, y = 449, z = 7}, {x = 760, y = 417, z = 7}, {x = 798, y = 390, z = 7}, {x = 802, y = 424, z = 7}, {x = 786, y = 417, z = 6}, {x = 822, y = 417, z = 6}, {x = 792, y = 399, z = 6}, {x = 823, y = 371, z = 6}, {x = 849, y = 379, z = 6}, {x = 858, y = 415, z = 6}, {x = 882, y = 442, z = 6}, {x = 866, y = 471, z = 6}, {x = 815, y = 472, z = 5}, {x = 822, y = 440, z = 5}, {x = 851, y = 442, z = 5}, {x = 929, y = 443, z = 6}, {x = 958, y = 453, z = 6}, {x = 977, y = 460, z = 5}, {x = 926, y = 471, z = 5}, {x = 979, y = 457, z = 5}, {x = 991, y = 466, z = 4}, {x = 929, y = 476, z = 4}, {x = 909, y = 443, z = 5}, {x = 956, y = 429, z = 5}, {x = 981, y = 392, z = 5}, {x = 936, y = 384, z = 5}, {x = 959, y = 365, z = 5}, {x = 985, y = 432, z = 5}, {x = 913, y = 361, z = 4}, {x = 878, y = 381, z = 4}, {x = 905, y = 414, z = 4}, {x = 846, y = 406, z = 5}, {x = 849, y = 353, z = 5}, {x = 796, y = 334, z = 5}, {x = 779, y = 370, z = 5}, {x = 799, y = 398, z = 5}, {x = 773, y = 416, z = 5}, {x = 743, y = 440, z = 5}, {x = 766, y = 459, z = 5}, {x = 797, y = 430, z = 5}, {x = 846, y = 442, z = 5}, {x = 814, y = 454, z = 5}, {x = 824, y = 474, z = 5}, {x = 1468, y = 324, z = 6}, {x = 1392, y = 321, z = 6}, {x = 1320, y = 337, z = 6}, {x = 1288, y = 291, z = 6}, {x = 1249, y = 312, z = 6}, {x = 1216, y = 357, z = 6}, {x = 1281, y = 390, z = 6}, {x = 1200, y = 379, z = 6}, {x = 1377, y = 394, z = 6}, {x = 1449, y = 330, z = 6}, {x = 1441, y = 300, z = 5}, {x = 1402, y = 264, z = 5}, {x = 1406, y = 1020, z = 6}, {x = 1449, y = 1024, z = 6}, {x = 1425, y = 970, z = 6}, {x = 1266, y = 953, z = 8}, {x = 1273, y = 885, z = 8}, {x = 1341, y = 898, z = 8}, {x = 1374, y = 927, z = 8}, {x = 1341, y = 948, z = 8}, {x = 1304, y = 930, z = 8}, {x = 1374, y = 883, z = 8}, {x = 1300, y = 864, z = 8}, {x = 1273, y = 892, z = 8}, {x = 1274, y = 882, z = 8}, {x = 1596, y = 1120, z = 7}, {x = 1600, y = 1123, z = 6}, {x = 1589, y = 1118, z = 5}, {x = 1595, y = 1121, z = 4}, {x = 1522, y = 1218, z = 7}, {x = 1456, y = 1247, z = 7}, {x = 1463, y = 1181, z = 7}, {x = 1561, y = 1266, z = 7}, {x = 1514, y = 1287, z = 7}, {x = 1456, y = 1307, z = 7}, {x = 1470, y = 1305, z = 7}, {x = 1427, y = 1265, z = 7}, {x = 1432, y = 1241, z = 8}, {x = 1374, y = 927, z = 8}, {x = 1270, y = 1245, z = 8}, {x = 1323, y = 1318, z = 8}, {x = 1361, y = 1286, z = 8}, {x = 1264, y = 1346, z = 8}, {x = 1243, y = 1317, z = 8}, {x = 1306, y = 1118, z = 8}, {x = 1372, y = 1106, z = 8}, {x = 1392, y = 1056, z = 8}, {x = 1429, y = 1080, z = 8}, {x = 1312, y = 1052, z = 8}, {x = 1340, y = 1024, z = 8}, {x = 1289, y = 1187, z = 7}, {x = 1311, y = 1241, z = 8}, {x = 331, y = 1833, z = 8}, {x = 280, y = 1859, z = 8}, {x = 383, y = 1890, z = 10}, {x = 403, y = 1889, z = 10}, {x = 396, y = 1856, z = 10}, {x = 420, y = 1888, z = 11}, {x = 438, y = 1902, z = 11}, {x = 431, y = 1892, z = 11}, {x = 445, y = 1889, z = 11}, {x = 416, y = 1855, z = 11}, {x = 394, y = 1854, z = 11}, {x = 392, y = 1853, z = 9}, {x = 373, y = 1826, z = 9}, {x = 416, y = 1812, z = 9}, {x = 327, y = 1821, z = 9}, {x = 357, y = 1854, z = 9}, {x = 336, y = 1871, z = 9}, {x = 318, y = 1842, z = 9}, {x = 280, y = 1834, z = 9}, {x = 300, y = 1814, z = 9}, {x = 370, y = 1830, z = 1}, {x = 406, y = 1784, z = 1}, {x = 377, y = 1757, z = 1}, {x = 422, y = 1771, z = 5}, {x = 442, y = 1745, z = 5}, {x = 629, y = 1506, z = 3}, {x = 665, y = 1522, z = 3}, {x = 669, y = 1487, z = 3}, {x = 638, y = 1504, z = 4}, {x = 632, y = 1485, z = 4}, {x = 609, y = 1500, z = 4}, {x = 611, y = 1482, z = 4}, {x = 674, y = 1487, z = 4}, {x = 631, y = 1531, z = 5}, {x = 638, y = 1519, z = 5}, {x = 665, y = 1505, z = 5}, {x = 628, y = 1510, z = 5}, {x = 628, y = 1510, z = 5}, {x = 625, y = 1484, z = 5}, {x = 630, y = 1491, z = 6}, {x = 663, y = 1513, z = 6}, {x = 649, y = 1548, z = 7}, {x = 708, y = 1510, z = 7}, {x = 597, y = 1553, z = 7}, {x = 609, y = 1490, z = 7}, {x = 647, y = 1480, z = 7}, {x = 817, y = 1349, z = 7}, {x = 802, y = 1361, z = 7}, {x = 814, y = 1372, z = 7}, {x = 795, y = 1373, z = 7}, {x = 854, y = 1347, z = 7}, {x = 822, y = 1325, z = 7}, {x = 863, y = 1309, z = 7}, {x = 914, y = 1306, z = 7}, {x = 894, y = 1316, z = 7}, {x = 895, y = 1299, z = 7}, {x = 822, y = 1365, z = 6}, {x = 799, y = 1355, z = 5}, {x = 814, y = 1354, z = 5}, {x = 808, y = 1344, z = 5}, {x = 887, y = 1318, z = 6}, {x = 900, y = 1315, z = 5}, {x = 886, y = 1304, z = 5}, {x = 897, y = 1293, z = 5}, {x = 909, y = 1306, z = 5}, {x = 911, y = 1289, z = 5}, {x = 737, y = 1284, z = 7}, {x = 691, y = 1311, z = 7}, {x = 678, y = 1278, z = 6}, {x = 688, y = 1262, z = 5}, {x = 789, y = 1194, z = 7}, {x = 776, y = 1183, z = 7}, {x = 784, y = 1159, z = 7}, {x = 809, y = 1164, z = 7}, {x = 811, y = 1131, z = 7}, {x = 841, y = 1158, z = 7}, {x = 845, y = 1153, z = 6}, {x = 806, y = 1176, z = 6}, {x = 787, y = 1208, z = 6}, {x = 768, y = 1172, z = 6}, {x = 786, y = 1139, z = 6}, {x = 1023, y = 1304, z = 7}, {x = 1084, y = 1344, z = 7}, {x = 1084, y = 1306, z = 7}, {x = 1064, y = 1299, z = 7}}
},
["Expert"] = {
	npcs = {"B-champion", "B-house", "B-luffy", "B-slash", "B-tony"},
	pos = {{x = 1437, y = 240, z = 5}, {x = 1407, y = 388, z = 6}, {x = 1356, y = 273, z = 5}, {x = 1302, y = 269, z = 5}, {x = 1322, y = 306, z = 5}, {x = 1355, y = 240, z = 5}, {x = 1472, y = 276, z = 5}, {x = 1509, y = 380, z = 5}, {x = 1507, y = 335, z = 5}, {x = 1472, y = 402, z = 5}, {x = 1443, y = 371, z = 5}, {x = 1476, y = 368, z = 5}, {x = 1534, y = 366, z = 5}, {x = 1335, y = 399, z = 5}, {x = 1306, y = 412, z = 5}, {x = 1308, y = 386, z = 5}, {x = 1278, y = 413, z = 5}, {x = 1276, y = 437, z = 5}, {x = 1220, y = 440, z = 5}, {x = 1187, y = 414, z = 5}, {x = 1170, y = 415, z = 5}, {x = 1221, y = 390, z = 5}, {x = 1172, y = 355, z = 5}, {x = 1204, y = 330, z = 5}, {x = 1232, y = 323, z = 5}, {x = 1231, y = 290, z = 5}, {x = 1220, y = 255, z = 5}, {x = 1179, y = 266, z = 5}, {x = 1169, y = 298, z = 5}, {x = 1141, y = 333, z = 5}, {x = 1110, y = 233, z = 7}, {x = 899, y = 468, z = 7}, {x = 867, y = 496, z = 7}, {x = 814, y = 498, z = 7}, {x = 837, y = 439, z = 7}, {x = 814, y = 478, z = 7}, {x = 775, y = 449, z = 7}, {x = 760, y = 417, z = 7}, {x = 798, y = 390, z = 7}, {x = 802, y = 424, z = 7}, {x = 786, y = 417, z = 6}, {x = 822, y = 417, z = 6}, {x = 792, y = 399, z = 6}, {x = 823, y = 371, z = 6}, {x = 849, y = 379, z = 6}, {x = 858, y = 415, z = 6}, {x = 882, y = 442, z = 6}, {x = 866, y = 471, z = 6}, {x = 815, y = 472, z = 5}, {x = 822, y = 440, z = 5}, {x = 851, y = 442, z = 5}, {x = 929, y = 443, z = 6}, {x = 958, y = 453, z = 6}, {x = 977, y = 460, z = 5}, {x = 926, y = 471, z = 5}, {x = 979, y = 457, z = 5}, {x = 991, y = 466, z = 4}, {x = 929, y = 476, z = 4}, {x = 909, y = 443, z = 5}, {x = 956, y = 429, z = 5}, {x = 981, y = 392, z = 5}, {x = 936, y = 384, z = 5}, {x = 959, y = 365, z = 5}, {x = 985, y = 432, z = 5}, {x = 913, y = 361, z = 4}, {x = 878, y = 381, z = 4}, {x = 905, y = 414, z = 4}, {x = 846, y = 406, z = 5}, {x = 849, y = 353, z = 5}, {x = 796, y = 334, z = 5}, {x = 779, y = 370, z = 5}, {x = 799, y = 398, z = 5}, {x = 773, y = 416, z = 5}, {x = 743, y = 440, z = 5}, {x = 766, y = 459, z = 5}, {x = 797, y = 430, z = 5}, {x = 846, y = 442, z = 5}, {x = 814, y = 454, z = 5}, {x = 824, y = 474, z = 5}, {x = 1468, y = 324, z = 6}, {x = 1392, y = 321, z = 6}, {x = 1320, y = 337, z = 6}, {x = 1288, y = 291, z = 6}, {x = 1249, y = 312, z = 6}, {x = 1216, y = 357, z = 6}, {x = 1281, y = 390, z = 6}, {x = 1200, y = 379, z = 6}, {x = 1377, y = 394, z = 6}, {x = 1449, y = 330, z = 6}, {x = 1441, y = 300, z = 5}, {x = 1402, y = 264, z = 5}, {x = 1406, y = 1020, z = 6}, {x = 1449, y = 1024, z = 6}, {x = 1425, y = 970, z = 6}, {x = 1266, y = 953, z = 8}, {x = 1273, y = 885, z = 8}, {x = 1341, y = 898, z = 8}, {x = 1374, y = 927, z = 8}, {x = 1341, y = 948, z = 8}, {x = 1304, y = 930, z = 8}, {x = 1374, y = 883, z = 8}, {x = 1300, y = 864, z = 8}, {x = 1273, y = 892, z = 8}, {x = 1274, y = 882, z = 8}, {x = 1596, y = 1120, z = 7}, {x = 1600, y = 1123, z = 6}, {x = 1589, y = 1118, z = 5}, {x = 1595, y = 1121, z = 4}, {x = 1522, y = 1218, z = 7}, {x = 1456, y = 1247, z = 7}, {x = 1463, y = 1181, z = 7}, {x = 1561, y = 1266, z = 7}, {x = 1514, y = 1287, z = 7}, {x = 1456, y = 1307, z = 7}, {x = 1470, y = 1305, z = 7}, {x = 1427, y = 1265, z = 7}, {x = 1432, y = 1241, z = 8}, {x = 1374, y = 927, z = 8}, {x = 1270, y = 1245, z = 8}, {x = 1323, y = 1318, z = 8}, {x = 1361, y = 1286, z = 8}, {x = 1264, y = 1346, z = 8}, {x = 1243, y = 1317, z = 8}, {x = 1306, y = 1118, z = 8}, {x = 1372, y = 1106, z = 8}, {x = 1392, y = 1056, z = 8}, {x = 1429, y = 1080, z = 8}, {x = 1312, y = 1052, z = 8}, {x = 1340, y = 1024, z = 8}, {x = 1289, y = 1187, z = 7}, {x = 1311, y = 1241, z = 8}, {x = 331, y = 1833, z = 8}, {x = 280, y = 1859, z = 8}, {x = 383, y = 1890, z = 10}, {x = 403, y = 1889, z = 10}, {x = 396, y = 1856, z = 10}, {x = 420, y = 1888, z = 11}, {x = 438, y = 1902, z = 11}, {x = 431, y = 1892, z = 11}, {x = 445, y = 1889, z = 11}, {x = 416, y = 1855, z = 11}, {x = 394, y = 1854, z = 11}, {x = 392, y = 1853, z = 9}, {x = 373, y = 1826, z = 9}, {x = 416, y = 1812, z = 9}, {x = 327, y = 1821, z = 9}, {x = 357, y = 1854, z = 9}, {x = 336, y = 1871, z = 9}, {x = 318, y = 1842, z = 9}, {x = 280, y = 1834, z = 9}, {x = 300, y = 1814, z = 9}, {x = 370, y = 1830, z = 1}, {x = 406, y = 1784, z = 1}, {x = 377, y = 1757, z = 1}, {x = 422, y = 1771, z = 5}, {x = 442, y = 1745, z = 5}, {x = 629, y = 1506, z = 3}, {x = 665, y = 1522, z = 3}, {x = 669, y = 1487, z = 3}, {x = 638, y = 1504, z = 4}, {x = 632, y = 1485, z = 4}, {x = 609, y = 1500, z = 4}, {x = 611, y = 1482, z = 4}, {x = 674, y = 1487, z = 4}, {x = 631, y = 1531, z = 5}, {x = 638, y = 1519, z = 5}, {x = 665, y = 1505, z = 5}, {x = 628, y = 1510, z = 5}, {x = 628, y = 1510, z = 5}, {x = 625, y = 1484, z = 5}, {x = 630, y = 1491, z = 6}, {x = 663, y = 1513, z = 6}, {x = 649, y = 1548, z = 7}, {x = 708, y = 1510, z = 7}, {x = 597, y = 1553, z = 7}, {x = 609, y = 1490, z = 7}, {x = 647, y = 1480, z = 7}, {x = 817, y = 1349, z = 7}, {x = 802, y = 1361, z = 7}, {x = 814, y = 1372, z = 7}, {x = 795, y = 1373, z = 7}, {x = 854, y = 1347, z = 7}, {x = 822, y = 1325, z = 7}, {x = 863, y = 1309, z = 7}, {x = 914, y = 1306, z = 7}, {x = 894, y = 1316, z = 7}, {x = 895, y = 1299, z = 7}, {x = 822, y = 1365, z = 6}, {x = 799, y = 1355, z = 5}, {x = 814, y = 1354, z = 5}, {x = 808, y = 1344, z = 5}, {x = 887, y = 1318, z = 6}, {x = 900, y = 1315, z = 5}, {x = 886, y = 1304, z = 5}, {x = 897, y = 1293, z = 5}, {x = 909, y = 1306, z = 5}, {x = 911, y = 1289, z = 5}, {x = 737, y = 1284, z = 7}, {x = 691, y = 1311, z = 7}, {x = 678, y = 1278, z = 6}, {x = 688, y = 1262, z = 5}, {x = 789, y = 1194, z = 7}, {x = 776, y = 1183, z = 7}, {x = 784, y = 1159, z = 7}, {x = 809, y = 1164, z = 7}, {x = 811, y = 1131, z = 7}, {x = 841, y = 1158, z = 7}, {x = 845, y = 1153, z = 6}, {x = 806, y = 1176, z = 6}, {x = 787, y = 1208, z = 6}, {x = 768, y = 1172, z = 6}, {x = 786, y = 1139, z = 6}, {x = 1023, y = 1304, z = 7}, {x = 1084, y = 1344, z = 7}, {x = 1084, y = 1306, z = 7}, {x = 1064, y = 1299, z = 7}}
},
["Legendary"] = {
	npcs = {},
	pos = {}
}
}
	
	for a, b in pairs(summons) do
	
		local name = math.random(b.npcs)
		local posi = math.random(b.pos)
	
		if getPlayerBrotherhoodRank(cid) == a then
			doCreateNpc(name, posi)
			addEvent(doPlayerSendChannelMessage, 5 * 60 * 1000, cid, "O "..getCreatureName(cid).." está procurando "..name.." visto pela ultima vez na posição [X: "..posi.x..", Y: "..posi.y..", Z: "..posi.y.."].", 14)
			doPlayerSendTextMessage(cid, 20, "O criminoso se chama "..name..", ele foi visto pela ultima vez na posição [X: "..posi.x..", Y: "..posi.y..", Z: "..posi.y.."].")	
			return true
		end
	end
	
	return true
end

function getPlayerKillCount(cid, dif)

local npcs = {
["Easy"] = {storage = 2145671},
["Medium"] = {storage = 2145672},
["Hard"] = {storage = 2145673},
["Expert"] = {storage = 2145674},
["Legendary"] = {storage = 2145675}
}

	for a, b in pairs(npcs) do
		if string.lower(a) == string.lower(dif) then
			return tonumber(getPlayerStorageValue(cid, b.storage))
		end
	end
	
	return tonumber(0)
end

function isMemberBrotherhood(cid)
	if getPlayerStorageValue(cid, 2145669) >= 1 then
		return true
	end
	return false
end
	
function getPlayerBrotherhoodRank(cid)
	return getPlayerStorageValue(cid, 2145670)
end

function setPlayerBrotherhoodRank(cid, rank)
	return setPlayerStorageValue(cid, 2145670, rank)
end	

function setMemberBrotherhood(cid)

	setPlayerStorageValue(cid, 2145669, 1)
	setPlayerStorageValue(cid, 252512, 1)
	setPlayerBrotherhoodRank(cid, "Easy")	
	
	for i = 2145671, 2145675 do
		setPlayerStorageValue(cid, i, 0)
	end
	
	return true
end

function setContractFinish(cid, pid)

local monster = {
["Hoodeasy"] = {storage = 2145671, rank = "Easy"}, 
["Hoodeasyf"] = {storage = 2145671, rank = "Easy"}, 
["Hoodmedium"] = {storage = 2145672, rank = "Easy"}, 
["Hoodmediumf"] = {storage = 2145672, rank = "Easy"}, 
["Hoodhard"] = {storage = 2145673, rank = "Easy"}, 
["Hoodhardf"] = {storage = 2145673, rank = "Easy"}, 
["Hoodexpert"] = {storage = 2145674, rank = "Expert"}, 
["Hoodexpertf"] = {storage = 2145674, rank = "Expert"},
["Hoodelegendary"] = {storage = 2145675, rank = "Legendary"}, 
["Hoodelegendaryf"] = {storage = 2145675, rank = "Legendary"}
} 

	for a, b in pairs(monster) do
		if getCreatureName(cid) == a then
			if isMemberBrotherhood(pid) then
				setPlayerStorageValue(pid, b.storage, getPlayerStorageValue(pid, b.storage) + 1)
				doSendMsg(pid, "Parabéns você acaba de eliminar um foragido da Rank "..b.rank.." da Brotherhood.")
				doSendMsg(pid, "Você já executou ["..getPlayerKillCount(pid, "easy").."] Easy, ["..getPlayerKillCount(pid, "medium").."] Medium, ["..getPlayerKillCount(pid, "hard").."], Hard, ["..getPlayerKillCount(pid, "expert").."], Expert, ["..getPlayerKillCount(pid, "legendary").."], Legendary.")
			end
		end
	end
	
	return true
end

local helds = {
	["X-Attack"] = {t1 = 15559, t2 = 15560, t3 = 15561, t4 = 15562, t5 = 15563, t6 = 15564, t7 = 15565},	
	["X-Block"] = {t1 = 15566, t2 = 15567, t3 = 15568, t4 = 15569, t5 = 15570, t6 = 15571, t7 = 15572},
	["X-Boost"] = {t1 = 15573, t2 = 15574, t3 = 15575, t4 = 15576, t5 = 15577, t6 = 15578, t7 = 15579}, 
	["X-Critical"] = {t1 = 15580, t2 = 15581, t3 = 15582, t4 = 15583, t5 = 15584, t6 = 15585, t7 = 15586}, 
	["X-Defense"] = {t1 = 15587, t2 = 15588, t3 = 15589, t4 = 15590, t5 = 15591, t6 = 15592, t7 = 15593}, 
	["X-Experience"] = {t1 = 15594, t2 = 15595, t3 = 15596, t4 = 15597, t5 = 15598, t6 = 15599, t7 = 15600}, 
	["X-Hellfire"] = {t1 = 15601, t2 = 15602, t3 = 15603, t4 = 15604, t5 = 15605, t6 = 15606, t7 = 15607}, 
	["X-Haste"] = {t1 = 15608, t2 = 15609, t3 = 15610, t4 = 15611, t5 = 15612, t6 = 15613, t7 = 15614}, 
	["X-Lucky"] = {t1 = 15615, t2 = 15616, t3 = 15617, t4 = 15618, t5 = 15619, t6 = 15620, t7 = 15621}, 
	["X-Poison"] = {t1 = 15622, t2 = 15623, t3 = 15624, t4 = 15625, t5 = 15626, t6 = 15627, t7 = 15628}, 
	["X-Return"] = {t1 = 15629, t2 = 15630, t3 = 15631, t4 = 15632, t5 = 15633, t6 = 15634, t7 = 15635}, 
	["X-Elemental"] = {t1 = 17315, t2 = 17316, t3 = 17317, t4 = 17318, t5 = 17319, t6 = 17320, t7 = 17321}, 
	["X-Rage"] = {t1 = 17343, t2 = 17344, t3 = 17345, t4 = 17347, t5 = 17346, t6 = 17348, t7 = 17349}, 
	["X-Strafe"] = {t1 = 17336, t2 = 17337, t3 = 17338, t4 = 17339, t5 = 17340, t6 = 17341, t7 = 17342}, 
	["X-Harden"] = {t1 = 17322, t2 = 17323, t3 = 17324, t4 = 17325, t5 = 17326, t6 = 17327, t7 = 17328}, 
	["X-Agility"] = {t1 = 17329, t2 = 17330, t3 = 17331, t4 = 17332, t5 = 17333, t6 = 17334, t7 = 17335}, 
	["X-Accuracy"] = {t1 = 17203, t2 = 17204, t3 = 17205, t4 = 17206, t5 = 17207, t6 = 17208, t7 = 17209}, 
	["X-Vitality"] = {t1 = 15636, t2 = 15637, t3 = 15638, t4 = 15639, t5 = 15640, t6 = 15641, t7 = 15642},
	["X-Blink"] = {t1 = 15636, t2 = 15637, t3 = 15638, t4 = 15639, t5 = 17372, t6 = 15641, t7 = 15642},
	["X-Cooldown"] = {t1 = 17343, t2 = 17344, t3 = 17367, t4 = 17206, t5 = 17368, t6 = 15641, t7 = 17369},
	["Y-Regeneration"] = {held = "Y", t1 = 17217, t2 = 17218, t3 = 17219, t4 = 17220, t5 = 17221, t6 = 17222, t7 = 17223},
	["Y-Cure"] = {held = "Y", t1 = 17301, t2 = 17302, t3 = 17303, t4 = 17304, t5 = 17305, t6 = 17306, t7 = 17307},
	["Y-Cut"] = {held = "Y", t1 = 17375, t2 = 17337, t3 = 17338, t4 = 17339, t5 = 17340, t6 = 17341, t7 = 17342},
	["Y-Antiself"] = {held = "Y", t1 = 15594, t2 = 15595, t3 = 15596, t4 = 15597, t5 = 17370, t6 = 15606, t7 = 15607},
	["Y-Dig"] = {held = "Y", t1 = 17376, t2 = 15560, t3 = 15561, t4 = 15562, t5 = 15563, t6 = 15564, t7 = 15565},
	["Y-Headbutt"] = {held = "Y", t1 = 17374, t2 = 17330, t3 = 17331, t4 = 17332, t5 = 17333, t6 = 17334, t7 = 17335},
	["Y-Smash"] = {held = "Y", t1 = 17377, t2 = 17323, t3 = 17324, t4 = 17325, t5 = 17326, t6 = 17327, t7 = 17328},
	["Y-Light"] = {held = "Y", t1 = 17373, t2 = 17323, t3 = 17324, t4 = 17325, t5 = 17326, t6 = 17327, t7 = 17328},
	["Y-Teleport"] = {held = "Y", t1 = 17357, t2 = 17358, t3 = 17359, t4 = 17360, t5 = 17361, t6 = 17362, t7 = 17363},
	["Y-Wing"] = {held = "Y", t1 = 17308, t2 = 17309, t3 = 17310, t4 = 17311, t5 = 17312, t6 = 17313, t7 = 17314},
	["Y-Control"] = {held = "Y", t1 = 17210, t2 = 17211, t3 = 17212, t4 = 17213, t5 = 17214, t6 = 17215, t7 = 17216},
	["Y-Antiburn"] = {held = "Y", t1 = 15587, t2 = 15588, t3 = 15589, t4 = 15590, t5 = 15591, t6 = 15592, t7 = 17366},
	["Y-Blur"] = {held = "Y", t1 = 17329, t2 = 17330, t3 = 17331, t4 = 17332, t5 = 17365, t6 = 17334, t7 = 17335},
	["Y-Antipoison"] = {held = "Y",t1 = 15608, t2 = 15609, t3 = 15610, t4 = 15611, t5 = 15612, t6 = 15613, t7 = 17364},
	["Y-Ghost"] = {held = "Y", t1 = 15608, t2 = 15609, t3 = 15610, t4 = 15611, t5 = 15643, t6 = 15613, t7 = 17364},	
}

local heldsName = {"X-Agility", "X-Accuracy", "X-Blink", "X-Cooldown", "Y-Regeneration", "Y-Cure", "Y-Cute", "Y-Antiself", "Y-Dig", "Y-Wing", "Y-Control", "Y-Antiburn", "Y-Blur", "Y-Antipoison", "Y-Antiburn", "Y-Headbutt", "Y-Smash", "Y-Light", "Y-Teleport", "X-Attack", "X-Block", "X-Boost", "X-Critical", "X-Defense", "X-Experience", "X-Hellfire", "X-Haste", "X-Lucky", "X-Poison", "X-Return", "X-Elemental", "X-Rage", "X-Harden", "X-Strafe", "X-Vitality"}

function doPlayerAddRandomHeld(cid, tier)
   local heldT = helds[heldsName[math.random(1, #heldsName)]]
   local held = heldT.t1
	if held then
		if tier == 2 then
		   held = heldT.t2 
		elseif tier == 3 then
		   held = heldT.t3 
		elseif tier == 4 then
		   held = heldT.t4 
		elseif tier == 5 then
		   held = heldT.t5 
		elseif tier == 6 then
		   held = heldT.t6 
		elseif tier == 7 then
		   held = heldT.t7 
		end
	else 
	    	held = heldT.id
	end
	doPlayerAddItem(cid, held, 1)
end

function doPlayerAddRandomHeldQuest(cid)
   local newTable = heldsName
   local index = math.random(1, #heldsName)
   local heldT = helds[heldsName[index]]
   table.remove(newTable, index)
   local index2 = math.random(1, #newTable)
   local heldT2 = helds[newTable[index2]]

   local held = heldT.t7
   local held2 = heldT2.t7
	if not held then
	    held = heldT.id
	end
	if not held2 then
	    held2 = heldT2.id
	end
	doPlayerAddItem(cid, held, 1)
	doPlayerAddItem(cid, held2, 1)
	doSendMagicEffect(getThingPos(cid), 28)
end
