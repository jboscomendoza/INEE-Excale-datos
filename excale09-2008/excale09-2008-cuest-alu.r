#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Alumnos del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_cuest.zip", "excale09_2008_alum_cuest.zip")
unzip("excale09_2008_alum_cuest.zip", "Excale09_2008_Alum_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable alu
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "AS001", "AS002", "AS003", "AS004", "AS005", "AS006", "AS007", "AS008", "AS009", "AS010", "AS011", "AS012", "AS013", "AS014", "AS015", "AS016", "AS017", "AS018", "AS019", "AS020", "AS021", "AS022", "AS023", "AS024", "AS025", "AS026", "AS027", "AS028", "AS029", "AS030", "AS031", "AS032", "AS033", "AS034", "AS035", "AS036", "AS037", "AS038", "AS039", "AS040", "AS041", "AS042", "AS043", "AS044", "AS045", "AS046", "AS047", "AS048", "AS049", "AS050", "AS051", "AS052", "AS053", "AS054", "AS055", "AS056", "AS057", "AS058", "AS059", "AS060", "AS061", "AS062", "AS063", "AS064", "AS065", "AS066", "AS067", "AS068", "AS069", "AS070", "AS071", "AS072", "AS073", "AS074", "AS075", "AS076", "AS077", "AS078", "AS079", "AS080", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
alu <- read.fwf(unz(temp, "Excale09_2008_Alum_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read.fwf("Excale09_2008_Alum_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

alu <- read_fwf(unz(temp, "Excale09_2008_Alum_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read_fwf("Excale09_2008_Alum_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
alu01 <- subset(alu, select = c(NACIONAL:MOD))
alu02 <- subset(alu, select = c(MAGEB05))
alu03 <- subset(alu, select = c(ESTRATO:ID_INSTR))
alu04 <- subset(alu, select = c(SEXO))
alu05 <- subset(alu, select = c(EDAD))
alu06 <- subset(alu, select = c(EDADC:EDADN))
alu07 <- subset(alu, select = c(EDAD_AC:MES_NAC))
alu08 <- subset(alu, select = c(W_ALU))
alu09 <- subset(alu, select = c(DOCENTE))
alu10 <- subset(alu, select = c(AS001:AS041))
alu11 <- subset(alu, select = c(AS042))
alu12 <- subset(alu, select = c(AS043))
alu13 <- subset(alu, select = c(AS044))
alu14 <- subset(alu, select = c(AS045:AS080))
alu15 <- subset(alu, select = c(WVARSTRR:W_FSTR80))

alu02[alu02 == "NA"] <- NA
alu04[alu04 > 7] <- NA
alu05[alu05 > 97] <- NA
alu06[alu06 == 9] <- NA
alu07[alu07 > 97] <- NA
alu09[alu09 == 99999] <- NA
alu10[alu10 > 7] <- NA
alu11[alu11 > 97] <- NA
alu12[alu12 > 7] <- NA
alu13[alu13 > 97] <- NA
alu14[alu14 > 7] <- NA

alu <- cbind(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14, alu15)
rm(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14, alu15, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(alu, "excale09-2008-cuest-alu.csv")
#Lectura a variable alu
alu <- read.csv("excale09-2008-cuest-alu.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(alu, "excale09-2008-cuest-alu.csv")
#Lectura a variable alu
alu <- read_csv("excale09-2008-cuest-alu.csv")
