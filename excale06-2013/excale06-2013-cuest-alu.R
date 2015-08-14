#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondiente al Cuestionario de Contexto del Alumno del EXCALE 06 (Sexto de Primaria), aplicación 2013.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Cuest.zip", "Excale06_2013_Alum_Cuest.zip")
unzip("Excale06_2013_Alum_Cuest.zip", files = "Excale06_2013_Alum_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable alu
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 5, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "AP001", "AP002", "AP003", "AP004", "AP005", "AP006", "AP007", "AP008", "AP009", "AP010", "AP011", "AP012", "AP013", "AP014", "AP015", "AP016", "AP017", "AP018", "AP019", "AP020", "AP021", "AP022", "AP023", "AP024", "AP025", "AP026", "AP027", "AP028", "AP029", "AP030", "AP031", "AP032", "AP033", "AP034", "AP035", "AP036", "AP037", "AP038", "AP039", "AP040", "AP041", "AP042", "AP043", "AP044", "AP045", "AP046", "AP047", "AP048", "AP049", "AP050", "AP051", "AP052", "AP053", "AP054", "AP055", "AP056", "AP057", "AP058", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
alu <- read.fwf(unz(temp, "Excale06_2013_Alum_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar
alu <- read.fwf("Excale06_2013_Alum_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)
alu <- read_fwf(unz(temp, "Excale06_2013_Alum_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar
alu <- read_fwf("Excale06_2013_Alum_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
alu01 <- subset(alu, select = c(NACIONAL:ID_INSTR))
alu02 <- subset(alu, select = c(SEXO))
alu03 <- subset(alu, select = c(EDAD_AC:MES_NAC))
alu04 <- subset(alu, select = c(EDAD))
alu05 <- subset(alu, select = c(EDAD_ACC:EDAD_EES))
alu06 <- subset(alu, select = c(W_ALU))
alu07 <- subset(alu, select = c(DOCENTE))
alu08 <- subset(alu, select = c(AP001:AP005))
alu09 <- subset(alu, select = c(AP006))
alu10 <- subset(alu, select = c(AP007:AP040))
alu11 <- subset(alu, select = c(AP041:AP042))
alu12 <- subset(alu, select = c(AP043:AP057))
alu13 <- subset(alu, select = c(AP058))
alu14 <- subset(alu, select = c(WVARSTRR:W_FSTR100))

alu02[alu02 > 7] <- NA
alu03[alu03 > 97] <- NA
alu04[alu04 > 97] <- NA
alu05[alu05 > 7] <- NA
alu07[alu07 == 99999] <- NA
alu08[alu08 > 7] <- NA
alu09[alu09 > 97] <- NA
alu10[alu10 > 7] <- NA
alu11[alu11 > 97] <- NA
alu12[alu12 > 7] <- NA
alu13[alu13 > 97] <- NA

alu <- data.frame(cbind(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14))
rm(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(alu, "excale06_2013_cuest_alu.csv")
#Lectura a variable alu
alu <- read.csv("excale06_2013_cuest_alu.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(alu, "excale06_2013_cuest_alu.csv")
#Lectura a variable alu
alu <- read_csv("excale06_2013_cuest_alu.csv")