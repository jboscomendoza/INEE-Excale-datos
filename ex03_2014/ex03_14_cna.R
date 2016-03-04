#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Ciencias Naturales

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Alum_CN.zip", "Excale03_2014_Alum_CN.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Alum_CN.zip")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 27, 28, 32, 40, 46, 51, 66, 67, 69, 71, 82, 83, 84, 85, 86, 97, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 158, 166, 174, 182, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 208, 219, 230, 241, 252, 263, 274, 285, 296, 307, 318, 329, 340, 351, 362, 373, 384, 395, 406, 417, 428, 439, 450, 461, 472, 483, 494, 505, 516, 527, 538, 549, 560, 571, 582, 593, 604, 615, 626, 637, 648, 659, 670, 681, 692, 703, 714, 725, 736, 747, 758, 769, 780, 791, 802, 813, 824, 835, 846, 857, 868, 879, 890, 901, 912, 923, 934, 945, 956, 967, 978, 989, 1000, 1011, 1022, 1033, 1044, 1055, 1066, 1077, 1088, 1099, 1110, 1121, 1132, 1143, 1154, 1165, 1176, 1187, 1198, 1209, 1220, 1231, 1242, 1253, 1264, 1275, 1286, 1297)
fin = c(1, 5, 7, 26, 27, 31, 39, 45, 50, 65, 66, 68, 70, 81, 82, 83, 84, 85, 96, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 157, 165, 173, 181, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 207, 218, 229, 240, 251, 262, 273, 284, 295, 306, 317, 328, 339, 350, 361, 372, 383, 394, 405, 416, 427, 438, 449, 460, 471, 482, 493, 504, 515, 526, 537, 548, 559, 570, 581, 592, 603, 614, 625, 636, 647, 658, 669, 680, 691, 702, 713, 724, 735, 746, 757, 768, 779, 790, 801, 812, 823, 834, 845, 856, 867, 878, 889, 900, 911, 922, 933, 944, 955, 966, 977, 988, 999, 1010, 1021, 1032, 1043, 1054, 1065, 1076, 1087, 1098, 1109, 1120, 1131, 1142, 1153, 1164, 1175, 1186, 1197, 1208, 1219, 1230, 1241, 1252, 1263, 1274, 1285, 1296, 1307)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PNA_01", "PNA_02", "PNA_03", "PNA_04", "PNA_05", "PNA_07", "PNA_08", "PNA_09", "PNA_10", "PNA_11", "PNA_12", "PNA_13", "PNA_14", "PNA_15", "PNA_16", "PNB_01", "PNB_02", "PNB_03", "PNB_04", "PNB_05", "PNB_06", "PNB_07", "PNB_08", "PNB_09", "PNB_10", "PNB_11", "PNB_12", "PNB_13", "PNB_14", "PNB_15", "PNB_16", "PNB_17", "PNC_01", "PNC_02", "PNC_03", "PNC_04", "PNC_05", "PNC_06", "PNC_08", "PNC_09", "PNC_10", "PNC_11", "PNC_12", "PNC_13", "PNC_14", "PNC_15", "PNC_16", "PNC_17", "PV1CN", "PV2CN", "PV3CN", "PV4CN", "PV5CN", "CNNVL1", "CNNVL2", "CNNVL3", "CNNVL4", "CNNVL5", "CNNVBL1", "CNNVBL2", "CNNVBL3", "CNNVBL4", "CNNVBL5", "CNNVML1", "CNNVML2", "CNNVML3", "CNNVML4", "CNNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable ex03_14_cna -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_cna <- read_fwf("Excale03_2014_Alum_CN.txt", fwf_positions(inicio, fin, nombre))

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_cna[ , 8][ex03_14_cna[, 8] == "999999"] <- NA
ex03_14_cna[ , 11][ex03_14_cna[, 11] > 7] <- NA
ex03_14_cna[ , 14][ex03_14_cna[, 14] == 99] <- NA
ex03_14_cna[ , c(12,13)][ex03_14_cna[, c(12,13)] > 97] <- NA
ex03_14_cna[ , c(15:18)][ex03_14_cna[ , c(15:18)] == 9] <- NA
ex03_14_cna[ , 20][ex03_14_cna[ , 20] == 99999] <- NA
ex03_14_cna[ , c(21:68)][ex03_14_cna[ , c(21:68)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_cna, "ex03_14_cna.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_cna ----
ex03_14_cna <- read_csv("ex03_14_cna.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
