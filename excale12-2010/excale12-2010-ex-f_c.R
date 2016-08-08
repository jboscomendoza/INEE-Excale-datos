#Este documento contiene código de R paradescargar, leer y  guardar la base de datos correspondientes a:
#EXCALE 03 (Tercero de Bachillerato) - Aplicación 2010 - Formación Ciudadana

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#1. Paquetes necesarios ----
#Carga del paquete readr al espacio de trabajo. Si no existe, es descargado e instalado
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos ----
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE12_2010/excale12_2010_alum_fc.zip", "excale12_2010_alum_fc.zip", "excale12_2010_alum_fc.zip")

#3. Extracción de la base de datos a la carpeta de trabajo ----
unzip("excale12_2010_alum_fc.zip", files = "Excale12_2010_Alum_FC.TXT")

#4. Asignación de información de ancho y nombre de las columnas a los objetos ancho y nombre ----
anchos <- c(1, 4, 2, 19, 2, 4, 7, 6, 16, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "W_ALU", "BC__01", "BC__02", "BC__03", "BC__06", "BC__04", "BC__05", "BC__08", "BC__07", "BC__09", "BC__11", "BC__10", "BC__12", "BC__14", "BC__15", "BC__13", "BC__17", "BC__16", "BC__18", "BC__19", "BC__20", "BC__21", "BC__23", "BC__22", "BC__24", "BC__26", "BC__25", "BC__27", "BC__31", "BC__28", "BC__29", "BC__30", "BC__32", "BC__33", "BC__35", "BC__34", "BC__36", "BC__37", "BC__39", "BC__38", "BC__40", "BC__41", "BC__43", "BC__42", "BC__44", "BC__45", "BC__46", "BC__47", "BC__48", "BC__49", "BC__50", "BC__51", "BC__52", "PV1FC", "PV2FC", "PV3FC", "PV4FC", "PV5FC", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100", "W_FSTR101", "W_FSTR102", "W_FSTR103", "W_FSTR104", "W_FSTR105", "W_FSTR106", "W_FSTR107", "W_FSTR108", "W_FSTR109", "W_FSTR110", "W_FSTR111", "W_FSTR112", "W_FSTR113", "W_FSTR114", "W_FSTR115", "W_FSTR116", "W_FSTR117", "W_FSTR118", "W_FSTR119", "W_FSTR120", "W_FSTR121", "W_FSTR122", "W_FSTR123", "W_FSTR124", "W_FSTR125", "W_FSTR126", "W_FSTR127", "W_FSTR128")

#5. Lectura de la base de datos y asignación al objetoex12_10_f_c -----
#En este paso se emplea la funcion read_fwf() del paquete readr para leer la base de datos, la cual es más rápida que la función read.fwf o read.table del paquete base. Esta diferencia es notable particularmente en equipos de cómputo poco poderosos. (readr es instalado en el paso 1.)
ex12_10_f_c <- read_fwf(unz(temp, "Excale12_2010_Alum_FC.TXT"), fwf_widths(anchos, nombres))

#6. Recodes ----
ex12_10_f_c[, c(10, 11, 13:64)][ex12_10_f_c[, c(10, 11, 13:64)] >= 7] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de readr o read.csv de base ----
write_csv(ex12_10_f_c, "ex12_10_f_c.csv")

#8. Lectura de la base de datos a partir del archivo csv creado y asignación al objetoex03_14_alu ----
ex12_10_f_c <- read_csv("ex12_10_f_c.csv")

#9. Eliminación de los objetos ancho y nombre ----
rm(ancho, nombre)
