#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para el Alumno de EXCALE 12 (Tercero de Bachillerato), aplicación 2010.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE12_2010/excale12_2010_alum_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE12_2010/excale12_2010_alum_cuest.zip", "excale12_2010_alum_cuest.zip")
unzip("excale12_2010_alum_cuest.zip", "Excale12_2010_Alum_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable alu
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 2, 4, 7, 6, 16, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "W_ALU", "AB001", "AB002", "AB003", "AB004", "AB005", "AB006", "AB007", "AB008", "AB009", "AB010", "AB011", "AB012", "AB013", "AB014", "AB015", "AB016", "AB017", "AB018", "AB019", "AB020", "AB021", "AB022", "AB023", "AB024", "AB025", "AB026", "AB027", "AB028", "AB029", "AB030", "AB031", "AB032", "AB033", "AB034", "AB035", "AB036", "AB037", "AB038", "AB039", "AB040", "AB041", "AB042", "AB043", "AB044", "AB045", "AB046", "AB047", "AB048", "AB049", "AB050", "AB051", "AB052", "AB053", "AB054", "AB055", "AB056", "AB057", "AB058", "AB059", "AB060", "AB061", "AB062", "AB063", "AB064", "AB065", "AB066", "AB067", "AB068", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100", "W_FSTR101", "W_FSTR102", "W_FSTR103", "W_FSTR104", "W_FSTR105", "W_FSTR106", "W_FSTR107", "W_FSTR108", "W_FSTR109", "W_FSTR110", "W_FSTR111", "W_FSTR112", "W_FSTR113", "W_FSTR114", "W_FSTR115", "W_FSTR116", "W_FSTR117", "W_FSTR118", "W_FSTR119", "W_FSTR120", "W_FSTR121", "W_FSTR122", "W_FSTR123", "W_FSTR124", "W_FSTR125", "W_FSTR126", "W_FSTR127", "W_FSTR128")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
alu <- read.fwf(unz(temp, "Excale12_2010_Alum_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read.fwf("Excale12_2010_Alum_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

alu <- read_fwf(unz(temp, "Excale12_2010_Alum_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read_fwf("Excale12_2010_Alum_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
alu01 <- subset(alu, select = c(NACIONAL:ID_INSTR))
alu02 <- subset(alu, select = c(SEXO))
alu03 <- subset(alu, select = c(EDAD_AC))
alu04 <- subset(alu, select = c(W_ALU))
alu05 <- subset(alu, select = c(AB001:AB068))
alu06 <- subset(alu, select = c(WVARSTRR:W_FSTR126))

alu02[alu02 > 7] <- NA
alu03[alu03 > 7] <- NA
alu05[alu05 > 7] <- NA

alu<- cbind(alu01, alu02, alu03, alu04, alu05, alu06)
rm(alu01, alu02, alu03, alu04, alu05, alu06, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(alu, "excale00-2011-cuest-alu.csv")
#Lectura a variable alu
alu <- read.csv("excale00-2011-cuest-alu.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(alu, "excale00-2011-cuest-alu.csv")
#Lectura a variable alu
alu <- read_csv("excale00-2011-cuest-alu.csv")
