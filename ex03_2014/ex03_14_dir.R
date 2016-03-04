#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Cuestionario de Contexto del Director

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Dir_Cuest.zip", "Excale03_2014_Dir_Cuest.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Dir_Cuest.zip")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 27, 28, 31, 38, 44, 59, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 135, 137, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 169, 180, 191, 202, 213, 224, 235, 246, 257, 268, 279, 290, 301, 312, 323, 334, 345, 356, 367, 378, 389, 400, 411, 422, 433, 444, 455, 466, 477, 488, 499, 510, 521, 532, 543, 554, 565, 576, 587, 598, 609, 620, 631, 642, 653, 664, 675, 686, 697, 708, 719, 730, 741, 752, 763, 774, 785, 796, 807, 818, 829, 840, 851, 862, 873, 884, 895, 906, 917, 928, 939, 950, 961, 972, 983, 994, 1005, 1016, 1027, 1038, 1049, 1060, 1071, 1082, 1093, 1104, 1115, 1126, 1137, 1148, 1159, 1170, 1181, 1192, 1203, 1214, 1225, 1236, 1247, 1258)
fin = c(1, 5, 7, 26, 27, 30, 37, 43, 58, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 134, 136, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 168, 179, 190, 201, 212, 223, 234, 245, 256, 267, 278, 289, 300, 311, 322, 333, 344, 355, 366, 377, 388, 399, 410, 421, 432, 443, 454, 465, 476, 487, 498, 509, 520, 531, 542, 553, 564, 575, 586, 597, 608, 619, 630, 641, 652, 663, 674, 685, 696, 707, 718, 729, 740, 751, 762, 773, 784, 795, 806, 817, 828, 839, 850, 861, 872, 883, 894, 905, 916, 927, 938, 949, 960, 971, 982, 993, 1004, 1015, 1026, 1037, 1048, 1059, 1070, 1081, 1092, 1103, 1114, 1125, 1136, 1147, 1158, 1169, 1180, 1191, 1202, 1213, 1224, 1235, 1246, 1257, 1268)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ID_INSTR", "W_DIR", "DP001", "DP002", "DP003", "DP004", "DP005", "DP006", "DP007", "DP008", "DP009", "DP010", "DP011", "DP012", "DP013", "DP014", "DP015", "DP016_01", "DP016_02", "DP016_03", "DP016_04", "DP016_05", "DP016_06", "DP016_07", "DP016_08", "DP016_09", "DP016_10", "DP016_11", "DP016_12", "DP016_13", "DP016_14", "DP016_15", "DP016_16", "DP016_17", "DP016_18", "DP016_19", "DP016_20", "DP016_21", "DP016_22", "DP016_23", "DP016_24", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable ex03_14_dir -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_dir <- read_fwf("Excale03_2014_Dir_Cuest.txt", fwf_positions(inicio, fin, nombre))

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_dir[ , c(8, 23)][ex03_14_dir[, c(8, 23)] == "999"] <- NA
ex03_14_dir[ , c(11:20, 24:49)][ex03_14_dir[ , c(11:20, 24:49)] > 7] <- NA
ex03_14_dir[ , 22][ex03_14_dir[ , 22] >= 97] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_dir, "ex03_14_dir.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_dir ----
ex03_14_dir <- read_csv("ex03_14_dir.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
