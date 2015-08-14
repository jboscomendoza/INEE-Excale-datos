#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Alumnos y Padres del EXCALE 00 (Tercero de Preescolar), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_alum_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_alum_cuest.zip", "excale00_2007_alum_cuest.zip")
unzip("excale00_2007_alum_cuest.zip", files = "Excale00_2007_Alum_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable ayp
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 19, 1, 4, 6, 5, 15, 1, 11, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 11, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "AE001", "AE002", "AE003", "AE004", "AE005", "AE006", "AE007", "TE000", "TE001", "TE002", "TE003", "TE004", "TE005", "TE006", "TE007", "TE008", "TE009", "TE010", "TE011", "TE012", "TE013", "TE014", "TE015", "TE016", "TE017", "TE018", "TE019", "TE020", "TE021", "TE022", "TE023", "TE024", "TE025", "TE026", "TE027", "TE028", "TE029", "TE030", "TE031", "TE032", "TE033", "TE034", "TE035", "TE036", "TE037", "TE038", "TE039", "TE040", "TE041", "TE042", "TE043", "TE044", "TE045", "TE046", "TE047", "TE048", "TE049", "TE050", "PEA01", "PEA02", "PEA03", "PEA04", "PEA05", "DEDICACION", "CCE", "CRIANZA", "COBERTURA", "EQUIP", "DEDICA_IMP", "CCE_IMP", "CRIANZ_IMP", "COBERT_IMP", "EQUIP_IMP", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
ayp <- read.fwf(unz(temp, "Excale00_2007_Alum_Cuest.TXT"), widths = anchos, col.names = c(nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
ayp <- read.fwf("Excale00_2007_Alum_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

ayp <- read_fwf(unz(temp, "Excale00_2007_Alum_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
ayp <- read_fwf("Excale00_2007_Alum_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)

ayp01 <- subset(ayp, select = c(NACIONAL:ID_INSTR))
ayp02 <- subset(ayp, select = c(SEXO))
ayp03 <- subset(ayp, select = c(EDAD))
ayp04 <- subset(ayp, select = c(EDADC))
ayp05 <- subset(ayp, select = c(EDAD1SEP))
ayp06 <- subset(ayp, select = c(EDAD1SEPC:EDADN))
ayp07 <- subset(ayp, select = c(EDAD_AC:MES_NAC))
ayp08 <- subset(ayp, select = c(W_ALU))
ayp09 <- subset(ayp, select = c(DOCENTE))
ayp10 <- subset(ayp, select = c(AE001:AE007))
ayp11 <- subset(ayp, select = c(TE000:TE005))
ayp12 <- subset(ayp, select = c(TE006:TE007))
ayp13 <- subset(ayp, select = c(TE008:TE050))
ayp14 <- subset(ayp, select = c(PEA01:PEA05))
ayp15 <- subset(ayp, select = c(WVARSTRR:W_FSTR80))

ayp02[ayp02 > 7] <- NA
ayp03[ayp03 == 99] <- NA
ayp04[ayp04 == 9] <- NA
ayp05[ayp05 == 99] <- NA
ayp06[ayp06 == 9] <- NA
ayp07[ayp07 > 97] <- NA
ayp09[ayp09 == 99999] <- NA
ayp10[ayp10 > 7] <- NA
ayp11[ayp11 > 6] <- NA
ayp12[ayp12 > 96] <- NA
ayp13[ayp13 > 6] <- NA
ayp14[ayp14 > 6] <- NA

ayp <- cbind(ayp01, ayp02, ayp03, ayp04, ayp05, ayp06, ayp07, ayp08, ayp09, ayp10, ayp11, ayp12, ayp13, ayp14, ayp15)
rm(ayp01, ayp02, ayp03, ayp04, ayp05, ayp06, ayp07, ayp08, ayp09, ayp10, ayp11, ayp12, ayp13, ayp14, ayp15, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(ayp, "excale00_2007_ayp.csv")
#Lectura a variable ayp
ayp <- read.csv("excale00_2007_ayp.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(ayp, "excale00_2007_ayp.csv")
#Lectura a variable ayp
ayp <- read_csv("excale00_2007_ayp.csv")
