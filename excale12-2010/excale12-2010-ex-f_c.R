#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Formación Ciudadana del EXCALE 12 (Tercero de Bachillerato), aplicación 2010.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE12_2010/excale12_2010_alum_fc.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE12_2010/excale12_2010_alum_fc.zip", "excale12_2010_alum_fc.zip")
unzip("excale12_2010_alum_fc.zip", "Excale12_2010_Alum_FC.TXT")

#2. Lectura de la base de datos y asignación a la variable f_c
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 2, 4, 7, 6, 16, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "W_ALU", "BC__01", "BC__02", "BC__03", "BC__06", "BC__04", "BC__05", "BC__08", "BC__07", "BC__09", "BC__11", "BC__10", "BC__12", "BC__14", "BC__15", "BC__13", "BC__17", "BC__16", "BC__18", "BC__19", "BC__20", "BC__21", "BC__23", "BC__22", "BC__24", "BC__26", "BC__25", "BC__27", "BC__31", "BC__28", "BC__29", "BC__30", "BC__32", "BC__33", "BC__35", "BC__34", "BC__36", "BC__37", "BC__39", "BC__38", "BC__40", "BC__41", "BC__43", "BC__42", "BC__44", "BC__45", "BC__46", "BC__47", "BC__48", "BC__49", "BC__50", "BC__51", "BC__52", "PV1FC", "PV2FC", "PV3FC", "PV4FC", "PV5FC", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100", "W_FSTR101", "W_FSTR102", "W_FSTR103", "W_FSTR104", "W_FSTR105", "W_FSTR106", "W_FSTR107", "W_FSTR108", "W_FSTR109", "W_FSTR110", "W_FSTR111", "W_FSTR112", "W_FSTR113", "W_FSTR114", "W_FSTR115", "W_FSTR116", "W_FSTR117", "W_FSTR118", "W_FSTR119", "W_FSTR120", "W_FSTR121", "W_FSTR122", "W_FSTR123", "W_FSTR124", "W_FSTR125", "W_FSTR126", "W_FSTR127", "W_FSTR128")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
f_c <- read.fwf(unz(temp, "Excale12_2010_Alum_FC.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
f_c <- read.fwf("Excale12_2010_Alum_FC.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

f_c <- read_fwf(unz(temp, "Excale12_2010_Alum_FC.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
f_c <- read_fwf("Excale12_2010_Alum_FC.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
f_c01 <- subset(f_c, select = c(NACIONAL:ID_INSTR))
f_c02 <- subset(f_c, select = c(SEXO))
f_c03 <- subset(f_c, select = c(EDAD_AC))
f_c04 <- subset(f_c, select = c(W_ALU))
f_c05 <- subset(f_c, select = c(BC__01:BC__52))
f_c06 <- subset(f_c, select = c(PV1FC:W_FSTR128))

f_c02[f_c02 > 7] <- NA
f_c03[f_c03 > 7] <- NA
f_c05[f_c05 > 7] <- NA

f_c<- cbind(f_c01, f_c02, f_c03, f_c04, f_c05, f_c06)
rm(f_c01, f_c02, f_c03, f_c04, f_c05, f_c06, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(f_c, "excale00-2011-ex-f_c.csv")
#Lectura a variable f_c
f_c <- read.csv("excale00-2011-ex-f_c.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(f_c, "excale00-2011-ex-f_c.csv")
#Lectura a variable f_c
f_c <- read_csv("excale00-2011-ex-f_c.csv")
