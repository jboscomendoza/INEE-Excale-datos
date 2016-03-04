#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Formación Cívica y Ética

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Alum_FCE.zip", "Excale03_2014_Alum_FCE.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Alum_FCE.zip")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 28, 29, 33, 41, 47, 52, 67, 68, 70, 72, 83, 84, 85, 86, 87, 98, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 212, 220, 228, 236, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 262, 273, 284, 295, 306, 317, 328, 339, 350, 361, 372, 383, 394, 405, 416, 427, 438, 449, 460, 471, 482, 493, 504, 515, 526, 537, 548, 559, 570, 581, 592, 603, 614, 625, 636, 647, 658, 669, 680, 691, 702, 713, 724, 735, 746, 757, 768, 779, 790, 801, 812, 823, 834, 845, 856, 867, 878, 889, 900, 911, 922, 933, 944, 955, 966, 977, 988, 999, 1010, 1021, 1032, 1043, 1054, 1065, 1076, 1087, 1098, 1109, 1120, 1131, 1142, 1153, 1164, 1175, 1186, 1197, 1208, 1219, 1230, 1241, 1252, 1263, 1274, 1285, 1296, 1307, 1318, 1329, 1340, 1351)
fin = c(1, 5, 7, 27, 28, 32, 40, 46, 51, 66, 67, 69, 71, 82, 83, 84, 85, 86, 97, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 211, 219, 227, 235, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 261, 272, 283, 294, 305, 316, 327, 338, 349, 360, 371, 382, 393, 404, 415, 426, 437, 448, 459, 470, 481, 492, 503, 514, 525, 536, 547, 558, 569, 580, 591, 602, 613, 624, 635, 646, 657, 668, 679, 690, 701, 712, 723, 734, 745, 756, 767, 778, 789, 800, 811, 822, 833, 844, 855, 866, 877, 888, 899, 910, 921, 932, 943, 954, 965, 976, 987, 998, 1009, 1020, 1031, 1042, 1053, 1064, 1075, 1086, 1097, 1108, 1119, 1130, 1141, 1152, 1163, 1174, 1185, 1196, 1207, 1218, 1229, 1240, 1251, 1262, 1273, 1284, 1295, 1306, 1317, 1328, 1339, 1350, 1361)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCA_07", "PCA_08", "PCA_09", "PCA_10", "PCA_11", "PCA_12", "PCA_13", "PCA_14", "PCA_15", "PCA_16", "PCA_17", "PCB_01", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCB_08", "PCB_09", "PCB_10", "PCB_11", "PCB_12", "PCB_13", "PCB_14", "PCB_15", "PCB_16", "PCB_17", "PCC_01", "PCC_02", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCC_08", "PCC_09", "PCC_10", "PCC_11", "PCC_12", "PCC_13", "PCC_14", "PCC_15", "PCC_16", "PCC_17", "PCD_01", "PCD_02", "PCD_03", "PCD_04", "PCD_05", "PCD_06", "PCD_07", "PCD_08", "PCD_09", "PCD_10", "PCD_11", "PCD_12", "PCD_13", "PCD_14", "PCD_15", "PCD_16", "PCD_17", "PCD_18", "PCE_01", "PCE_02", "PCE_03", "PCE_04", "PCE_05", "PCE_06", "PCE_07", "PCE_08", "PCE_10", "PCE_11", "PCE_12", "PCE_13", "PCE_14", "PCE_15", "PCE_16", "PCE_17", "PCF_01", "PCF_02", "PCF_03", "PCF_04", "PCF_05", "PCF_06", "PCF_07", "PCF_08", "PCF_10", "PCF_11", "PCF_12", "PCF_13", "PCF_14", "PCF_15", "PCF_16", "PCF_17", "PV1FCE", "PV2FCE", "PV3FCE", "PV4FCE", "PV5FCE", "FCENVL1", "FCENVL2", "FCENVL3", "FCENVL4", "FCENVL5", "FCENVBL1", "FCENVBL2", "FCENVBL3", "FCENVBL4", "FCENVBL5", "FCENVML1", "FCENVML2", "FCENVML3", "FCENVML4", "FCENVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable ex03_14_fce -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_fce <- read_fwf("Excale03_2014_Alum_FCE.txt", fwf_positions(inicio, fin, nombre))

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_fce[ , 8][ex03_14_fce[, 8] == "999999"] <- NA
ex03_14_fce[ , 11][ex03_14_fce[, 11] > 7] <- NA
ex03_14_fce[ , 14][ex03_14_fce[, 14] == 99] <- NA
ex03_14_fce[ , c(12,13)][ex03_14_fce[, c(12,13)] > 97] <- NA
ex03_14_fce[ , c(15:18)][ex03_14_fce[ , c(15:18)] == 9] <- NA
ex03_14_fce[ , 20][ex03_14_fce[ , 20] == 99999] <- NA
ex03_14_fce[ , c(21:121)][ex03_14_fce[ , c(21:121)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_fce, "ex03_14_fce.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_fce ----
ex03_14_fce <- read_csv("ex03_14_fce.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
