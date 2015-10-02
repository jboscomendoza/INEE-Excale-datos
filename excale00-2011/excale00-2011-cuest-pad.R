#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Padres de Familia del EXCALE 00 (Tercero de Preescolar), aplicación 2011.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE00_2011/excale00_2011_pad_cuest.zip", "excale00_2011_pad_cuest.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("excale00_2011_pad_cuest.zip", "Excale00_2011_Pad_Cuest.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 6, 5, 12, 1, 10, 11, 1, 1, 2, 11, 1, 1, 2, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 3, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "FECHA_NAC", "EDAD", "EDADC", "EDADN", "EDAD_AC", "W_ALU", "I_PADRES", "PARENT", "TE001", "TE002_1", "TE002_2", "TE002_3", "TE002_4", "TE002_5", "TE003_1", "TE003_2", "TE003_3", "TE003_4", "TE003_5", "TE003_6", "TE003_7", "TE003_8", "TE003_9", "TE004_01", "TE004_02", "TE004_03", "TE004_04", "TE004_05", "TE004_06", "TE004_07", "TE004_08", "TE004_09", "TE004_10", "TE004_11", "TE004_12", "TE004_13", "TE005_1", "TE005_2", "TE005_3", "TE005_4", "TE005_5", "TE005_6", "TE006_1", "TE006_2", "TE006_3", "TE006_4", "TE006_5", "TE006_6", "TE006_7", "TE007", "TE008", "TE009", "TE010", "TE011_01", "TE011_02", "TE011_03", "TE011_04", "TE011_05", "TE011_06", "TE011_07", "TE011_08", "TE011_09", "TE011_10", "TE011_11", "TE012_1", "TE012_2", "TE012_3", "TE012_4", "TE012_5", "TE012_6", "TE013_011", "TE013_012", "TE013_021", "TE013_022", "TE013_031", "TE013_032", "TE013_041", "TE013_042", "TE013_051", "TE013_052", "TE013_061", "TE013_062", "TE013_071", "TE013_072", "TE013_081", "TE013_082", "TE013_091", "TE013_092", "TE013_101", "TE013_102", "TE013_111", "TE013_112", "TE014_1", "TE014_2", "TE014_3", "TE014_4", "TE014_5", "TE014_6", "TE014_7", "TE014_8", "TE015", "TE016", "TE017", "TE018", "TE019", "TE020", "TE021", "TE022", "TE023", "TE024", "TE025", "TE026", "TE027", "TE028_1", "TE028_2", "TE028_3", "TE028_4", "TE028_5", "TE028_6", "TE028_7", "TE028_8", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#5. Lectura de la base de datos y asignación a la variable pad
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
pad <- read_fwf("Excale00_2011_Pad_Cuest.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
pad[ , c(10, 13, 14, 18, 20:24, 47:121, 124:131)][pad[ , c(10, 13, 14, 18, 20:24, 47:121, 124:131)] > 7] <- NA
pad[ , c(12, 15, 19, 25:46)][pad[ , c(12, 15, 19, 25:46)] > 97] <- NA
pad[ , c(122, 123)][pad[ , c(122, 123)] > 997] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(pad, "excale00_2011_cuest_pad.csv")

#8. Lectura de la base de datos como csv y asignación a la variable pad
pad <- read_csv("excale00_2011_cuest_pad.csv")

#9. Eliminación de las variables anchos y nombres
rm(anchos, nombres)
