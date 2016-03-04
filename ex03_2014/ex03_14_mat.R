#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Matemáticas

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Alum_Mat.7z", "Excale03_2014_Alum_Mat.7z")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Alum_Mat.7z")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 28, 29, 33, 40, 46, 51, 66, 67, 69, 71, 82, 83, 84, 85, 86, 97, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 181, 189, 197, 205, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 231, 242, 253, 264, 275, 286, 297, 308, 319, 330, 341, 352, 363, 374, 385, 396, 407, 418, 429, 440, 451, 462, 473, 484, 495, 506, 517, 528, 539, 550, 561, 572, 583, 594, 605, 616, 627, 638, 649, 660, 671, 682, 693, 704, 715, 726, 737, 748, 759, 770, 781, 792, 803, 814, 825, 836, 847, 858, 869, 880, 891, 902, 913, 924, 935, 946, 957, 968, 979, 990, 1001, 1012, 1023, 1034, 1045, 1056, 1067, 1078, 1089, 1100, 1111, 1122, 1133, 1144, 1155, 1166, 1177, 1188, 1199, 1210, 1221, 1232, 1243, 1254, 1265, 1276, 1287, 1298, 1309, 1320)
fin = c(1, 5, 7, 27, 28, 32, 39, 45, 50, 65, 66, 68, 70, 81, 82, 83, 84, 85, 96, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 180, 188, 196, 204, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 230, 241, 252, 263, 274, 285, 296, 307, 318, 329, 340, 351, 362, 373, 384, 395, 406, 417, 428, 439, 450, 461, 472, 483, 494, 505, 516, 527, 538, 549, 560, 571, 582, 593, 604, 615, 626, 637, 648, 659, 670, 681, 692, 703, 714, 725, 736, 747, 758, 769, 780, 791, 802, 813, 824, 835, 846, 857, 868, 879, 890, 901, 912, 923, 934, 945, 956, 967, 978, 989, 1000, 1011, 1022, 1033, 1044, 1055, 1066, 1077, 1088, 1099, 1110, 1121, 1132, 1143, 1154, 1165, 1176, 1187, 1198, 1209, 1220, 1231, 1242, 1253, 1264, 1275, 1286, 1297, 1308, 1319, 1330)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PMA_01", "PMA_02", "PMA_03", "PMA_04", "PMA_05", "PMA_06", "PMA_07", "PMA_08", "PMA_09", "PMA_10", "PMA_11", "PMA_13", "PMB_01", "PMB_02", "PMB_03", "PMB_04", "PMB_05", "PMB_06", "PMB_07", "PMB_08", "PMB_09", "PMB_10", "PMB_11", "PMB_13", "PMC_01", "PMC_02", "PMC_04", "PMC_05", "PMC_06", "PMC_07", "PMC_08", "PMC_09", "PMC_10", "PMC_11", "PMC_12", "PMC_13", "PMD_01", "PMD_02", "PMD_03", "PMD_04", "PMD_05", "PMD_06", "PMD_07", "PMD_08", "PMD_09", "PMD_10", "PMD_11", "PMD_13", "PMD_14", "PME_01", "PME_02", "PME_03", "PME_04", "PME_05", "PME_06", "PME_07", "PME_08", "PME_10", "PME_11", "PME_13", "PMF_01", "PMF_02", "PMF_04", "PMF_05", "PMF_06", "PMF_07", "PMF_09", "PMF_10", "PMF_11", "PMF_12", "PMF_13", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "MATNVBL1", "MATNVBL2", "MATNVBL3", "MATNVBL4", "MATNVBL5", "MATNVML1", "MATNVML2", "MATNVML3", "MATNVML4", "MATNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable ex03_14_mat -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
ex03_14_mat <- read_fwf("Excale03_2014_Alum_MAT.txt", fwf_positions(inicio, fin, nombre))

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_mat[ , 8][ex03_14_mat[, 8] == "999999"] <- NA
ex03_14_mat[ , 11][ex03_14_mat[, 11] > 7] <- NA
ex03_14_mat[ , 14][ex03_14_mat[, 14] == 99] <- NA
ex03_14_mat[ , c(12,13)][ex03_14_mat[, c(12,13)] > 97] <- NA
ex03_14_mat[ , c(15:18)][ex03_14_mat[ , c(15:18)] == 9] <- NA
ex03_14_mat[ , 20][ex03_14_mat[ , 20] == 99999] <- NA
ex03_14_mat[ , c(21:91)][ex03_14_mat[ , c(21:91)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_mat, "ex03_14_mat.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_mat ----
ex03_14_mat <- read_csv("ex03_14_mat.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
