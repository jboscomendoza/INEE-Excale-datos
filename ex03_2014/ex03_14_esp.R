#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Español

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Alum_Esp.zip", "Excale03_2014_Alum_Esp.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Alum_Esp.zip")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 28, 29, 33, 40, 46, 51, 66, 67, 69, 71, 82, 83, 84, 85, 86, 97, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 197, 205, 213, 221, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 247, 258, 269, 280, 291, 302, 313, 324, 335, 346, 357, 368, 379, 390, 401, 412, 423, 434, 445, 456, 467, 478, 489, 500, 511, 522, 533, 544, 555, 566, 577, 588, 599, 610, 621, 632, 643, 654, 665, 676, 687, 698, 709, 720, 731, 742, 753, 764, 775, 786, 797, 808, 819, 830, 841, 852, 863, 874, 885, 896, 907, 918, 929, 940, 951, 962, 973, 984, 995, 1006, 1017, 1028, 1039, 1050, 1061, 1072, 1083, 1094, 1105, 1116, 1127, 1138, 1149, 1160, 1171, 1182, 1193, 1204, 1215, 1226, 1237, 1248, 1259, 1270, 1281, 1292, 1303, 1314, 1325, 1336)
fin = c(1, 5, 7, 27, 28, 32, 39, 45, 50, 65, 66, 68, 70, 81, 82, 83, 84, 85, 96, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 196, 204, 212, 220, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 246, 257, 268, 279, 290, 301, 312, 323, 334, 345, 356, 367, 378, 389, 400, 411, 422, 433, 444, 455, 466, 477, 488, 499, 510, 521, 532, 543, 554, 565, 576, 587, 598, 609, 620, 631, 642, 653, 664, 675, 686, 697, 708, 719, 730, 741, 752, 763, 774, 785, 796, 807, 818, 829, 840, 851, 862, 873, 884, 895, 906, 917, 928, 939, 950, 961, 972, 983, 994, 1005, 1016, 1027, 1038, 1049, 1060, 1071, 1082, 1093, 1104, 1115, 1126, 1137, 1148, 1159, 1170, 1181, 1192, 1203, 1214, 1225, 1236, 1247, 1258, 1269, 1280, 1291, 1302, 1313, 1324, 1335, 1346)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PEA_01", "PEA_02", "PEA_03", "PEA_04", "PEA_05", "PEA_06", "PEA_07", "PEA_08", "PEA_09", "PEA_10", "PEA_11", "PEA_12", "PEA_13", "PEB_01", "PEB_03", "PEB_04", "PEB_05", "PEB_06", "PEB_07", "PEB_08", "PEB_09", "PEB_10", "PEB_11", "PEB_12", "PEB_13", "PEC_01", "PEC_02", "PEC_03", "PEC_04", "PEC_05", "PEC_06", "PEC_07", "PEC_08", "PEC_09", "PEC_10", "PEC_11", "PEC_13", "PED_01", "PED_02", "PED_03", "PED_04", "PED_05", "PED_06", "PED_08", "PED_09", "PED_10", "PED_11", "PED_12", "PED_13", "PEE_01", "PEE_03", "PEE_04", "PEE_05", "PEE_06", "PEE_07", "PEE_08", "PEE_09", "PEE_10", "PEE_11", "PEE_12", "PEE_13", "PEF_01", "PEF_02", "PEF_03", "PEF_04", "PEF_05", "PEF_06", "PEF_07", "PEF_08", "PEF_09", "PEF_10", "PEF_11", "PEF_12", "PEF_13", "PEF_14", "PEG_01", "PEG_03", "PEG_04", "PEG_05", "PEG_06", "PEG_07", "PEG_08", "PEG_09", "PEG_10", "PEG_12", "PEG_13", "PEG_14", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVBL1", "ESPNVBL2", "ESPNVBL3", "ESPNVBL4", "ESPNVBL5", "ESPNVML1", "ESPNVML2", "ESPNVML3", "ESPNVML4", "ESPNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable ex03_14_esp -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_esp <- read_fwf("Excale03_2014_Alum_ESP.txt", fwf_positions(inicio, fin, nombre))

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_esp[ , 8][ex03_14_esp[, 8] == "999999"] <- NA
ex03_14_esp[ , 11][ex03_14_esp[, 11] > 7] <- NA
ex03_14_esp[ , 14][ex03_14_esp[, 14] == 99] <- NA
ex03_14_esp[ , c(12,13)][ex03_14_esp[, c(12,13)] > 97] <- NA
ex03_14_esp[ , c(15:18)][ex03_14_esp[ , c(15:18)] == 9] <- NA
ex03_14_esp[ , 20][ex03_14_esp[ , 20] == 99999] <- NA
ex03_14_esp[ , c(21:107)][ex03_14_esp[ , c(21:107)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_esp, "ex03_14_esp.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_esp ----
ex03_14_esp <- read_csv("ex03_14_esp.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
