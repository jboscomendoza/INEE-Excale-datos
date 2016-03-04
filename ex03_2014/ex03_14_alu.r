#Este documento contiene cÃ³digo de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - AplicaciÃ³n 2014 - Cuestionario de Contexto del Alumno

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Cuest.zip", "Excale06_2013_Alum_Cuest.zip")

#3. ExtracciÃ³n de la base de datos a la carpeta de trabajo ----
unzip("Excale06_2013_Alum_Cuest.zip", files = "Excale06_2013_Alum_Cuest.TXT")

#4. AsignaciÃ³n de informaciÃ³n de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
inicio = c(1, 2, 6, 8, 27, 28, 32, 39, 44, 49, 64, 65, 67, 69, 80, 81, 82, 83, 84, 95, 100, 101, 102, 103, 104, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 119, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 162, 165, 176, 187, 198, 209, 220, 231, 242, 253, 264, 275, 286, 297, 308, 319, 330, 341, 352, 363, 374, 385, 396, 407, 418, 429, 440, 451, 462, 473, 484, 495, 506, 517, 528, 539, 550, 561, 572, 583, 594, 605, 616, 627, 638, 649, 660, 671, 682, 693, 704, 715, 726, 737, 748, 759, 770, 781, 792, 803, 814, 825, 836, 847, 858, 869, 880, 891, 902, 913, 924, 935, 946, 957, 968, 979, 990, 1001, 1012, 1023, 1034, 1045, 1056, 1067, 1078, 1089, 1100, 1111, 1122, 1133, 1144, 1155, 1166, 1177, 1188, 1199, 1210, 1221, 1232, 1243, 1254)
fin = c(1, 5, 7, 26, 27, 31, 38, 43, 48, 63, 64, 66, 68, 79, 80, 81, 82, 83, 94, 99, 100, 101, 102, 103, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 118, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 161, 164, 175, 186, 197, 208, 219, 230, 241, 252, 263, 274, 285, 296, 307, 318, 329, 340, 351, 362, 373, 384, 395, 406, 417, 428, 439, 450, 461, 472, 483, 494, 505, 516, 527, 538, 549, 560, 571, 582, 593, 604, 615, 626, 637, 648, 659, 670, 681, 692, 703, 714, 725, 736, 747, 758, 769, 780, 791, 802, 813, 824, 835, 846, 857, 868, 879, 890, 901, 912, 923, 934, 945, 956, 967, 978, 989, 1000, 1011, 1022, 1033, 1044, 1055, 1066, 1077, 1088, 1099, 1110, 1121, 1132, 1143, 1154, 1165, 1176, 1187, 1198, 1209, 1220, 1231, 1242, 1253, 1264)
nombre = c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "AP001", "AP002", "AP003", "AP004", "AP005", "AP006", "AP007", "AP008", "AP009", "AP010", "AP011", "AP012", "AP013", "AP014", "AP015", "AP016", "AP017", "AP018", "AP019", "AP020", "AP021", "AP022", "AP023", "AP024", "AP025", "AP026", "AP027", "AP028", "AP029", "AP030", "AP031", "AP032", "AP033", "AP034", "AP035", "AP036", "AP037", "AP038", "AP039", "AP040", "AP041", "AP042", "AP043", "AP044", "AP045", "AP046", "AP047", "AP048", "AP049", "AP050", "AP051", "AP052", "AP053", "AP054", "AP055", "AP056", "AP057", "AP058", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignaciÃ³n a la variable ex03_14_alu -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es mÃ¡s rÃ¡pida que la funciÃ³n read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cÃ³mputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_alu <- read_fwf("Excale03_2014_Alum_Cuest.txt", fwf_positions(inicio, fin, nombre))

#6. Recodes ----
ex03_14_alu[ , 8][ex03_14_alu[, 8] == "999999"] <- NA
ex03_14_alu[ , 20][ex03_14_alu[, 20] == 99999] <- NA
ex03_14_alu[ , c(12:14, 25, 37, 38, 78)][ex03_14_alu[ , c(12:14, 25, 37, 38, 78)] > 97] <- NA
ex03_14_alu[ , c(11, 15:18, 21:24, 26:36, 39:77)][ex03_14_alu[ , c(11, 15:18, 21:24, 26:36, 39:77)] > 7] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura mÃ¡s sencilla de la misma con la funciÃ³n read_csv de readr o read.csv de base ----
write_csv(ex03_14_alu, "ex03_14_alu.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignaciÃ³n a la variable ex03_14_alu ----
ex03_14_alu <- read_csv("ex03_14_alu.csv")

#9. EliminaciÃ³n de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
