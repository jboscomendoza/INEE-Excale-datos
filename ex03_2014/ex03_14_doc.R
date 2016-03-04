#Este documento contiene código de R para descargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Primaria) - Aplicación 2014 - Cuestionario de Contexto del Docente

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/2016/excale03-2014/Excale03_2014_Doc_Cuest.zip", "Excale03_2014_Doc_Cuest.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("Excale03_2014_Doc_Cuest.zip")

#4. Asignación de información de inicio, fin y nombre de las columnas a las variables inicio, fin y nombre ----
nombre <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ID_INSTR", "W_DOC", "DOCENTE", "PP001", "PP002", "PP003", "PP004", "PP005", "PP006", "PP007", "PP008", "PP009", "PP010", "PP011", "PP012", "PP013", "PP014", "PP015", "PP016", "PP017", "PP018", "PP019", "PP020", "PP021", "PP022", "PP023", "PP024", "PP025", "PP026", "PP027", "PP028", "PP029", "PP030", "PP031", "PP032", "PP033", "PP034", "PP035", "PP036_1", "PP036_2", "PP036_3", "PP036_4", "PP036_5", "PP036_6", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")
inicio <- c(1, 2, 6, 8, 27, 28, 31, 38, 44, 56, 67, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 116, 127, 138, 149, 160, 171, 182, 193, 204, 215, 226, 237, 248, 259, 270, 281, 292, 303, 314, 325, 336, 347, 358, 369, 380, 391, 402, 413, 424, 435, 446, 457, 468, 479, 490, 501, 512, 523, 534, 545, 556, 567, 578, 589, 600, 611, 622, 633, 644, 655, 666, 677, 688, 699, 710, 721, 732, 743, 754, 765, 776, 787, 798, 809, 820, 831, 842, 853, 864, 875, 886, 897, 908, 919, 930, 941, 952, 963, 974, 985, 996, 1007, 1018, 1029, 1040, 1051, 1062, 1073, 1084, 1095, 1106, 1117, 1128, 1139, 1150, 1161, 1172, 1183, 1194, 1205)
fin <- c(1, 5, 7, 26, 27, 30, 37, 43, 55, 66, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 115, 126, 137, 148, 159, 170, 181, 192, 203, 214, 225, 236, 247, 258, 269, 280, 291, 302, 313, 324, 335, 346, 357, 368, 379, 390, 401, 412, 423, 434, 445, 456, 467, 478, 489, 500, 511, 522, 533, 544, 555, 566, 577, 588, 599, 610, 621, 632, 643, 654, 665, 676, 687, 698, 709, 720, 731, 742, 753, 764, 775, 786, 797, 808, 819, 830, 841, 852, 863, 874, 885, 896, 907, 918, 929, 940, 951, 962, 973, 984, 995, 1006, 1017, 1028, 1039, 1050, 1061, 1072, 1083, 1094, 1105, 1116, 1127, 1138, 1149, 1160, 1171, 1182, 1193, 1204, 1215)

#5. Lectura de la base de datos y asignación a la variable ex03_14_doc -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex03_14_doc <- read_fwf("Excale03_2014_Doc_Cuest.txt", fwf_positions(inicio, fin, nombre))
rm(nombre, inicio, fin)

#6. Recodificación de valores numéricos que indican datos perdidos a NA ----
ex03_14_doc[ , 8][ex03_14_doc[,8] == "999"] <- NA
ex03_14_doc[ , c(12:52)][ex03_14_doc[ , c(12:52)] > 7] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex03_14_doc, "ex03_14_doc.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación a la variable ex03_14_doc----
ex03_14_doc <- reac_csv("ex03_14_doc.csv")

#9. Eliminación de las variables inicio, fin y nombre ----
rm(nombre, inicio, fin)
