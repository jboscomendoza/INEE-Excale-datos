#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español (Expresión escrita) del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_esc.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_esc.zip", "excale09_2008_alum_esc.zip")
unzip("excale09_2008_alum_esc.zip", "Excale09_2008_Alum_Esc.TXT")

#2. Lectura de la base de datos y asignación a la variable e_e
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "SR_01", "SR_02", "SR_03", "SR_04", "SR_05", "SR_06", "SR_07", "SR_08", "SR_09", "SR_10", "SR_11", "SR_12", "SR_13", "SR_14", "SR_15", "SR_16", "SR_17", "SR_18", "SR_19", "SR_20", "SR_21", "SR_22", "SR_23", "SR_24", "SR_25", "SR_26", "SR_27", "SR_28", "SR_29", "SR_30", "SR_31", "SR_32", "SR_33", "SR_34", "SR_35", "SR_36", "SR_37", "SR_38", "SR_39", "SR_40", "SR_41", "SR_42", "SR_43", "SR_44", "SR_45", "SR_46", "PV1EXPESC", "PV2EXPESC", "PV3EXPESC", "PV4EXPESC", "PV5EXPESC", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
e_e <- read.fwf(unz(temp, "Excale09_2008_Alum_Esc.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
e_e <- read.fwf("Excale09_2008_Alum_Esc.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

e_e <- read_fwf(unz(temp, "Excale09_2008_Alum_Esc.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
e_e <- read_fwf("Excale09_2008_Alum_Esc.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
e_e01 <- subset(e_e, select = c(NACIONAL:MOD))
e_e02 <- subset(e_e, select = c(MAGEB05))
e_e03 <- subset(e_e, select = c(ESTRATO:ID_INSTR))
e_e04 <- subset(e_e, select = c(SEXO))
e_e05 <- subset(e_e, select = c(EDAD))
e_e06 <- subset(e_e, select = c(EDADC:EDADN))
e_e07 <- subset(e_e, select = c(EDAD_AC:MES_NAC))
e_e08 <- subset(e_e, select = c(W_ALU))
e_e09 <- subset(e_e, select = c(DOCENTE))
e_e10 <- subset(e_e, select = c(SR_01:SR_46))
e_e11 <- subset(e_e, select = c(PV1EXPESC:W_FSTR80))

e_e02[e_e02 == "NA"] <- NA
e_e04[e_e04 > 7] <- NA
e_e05[e_e05 > 97] <- NA
e_e06[e_e06 == 9] <- NA
e_e07[e_e07 > 97] <- NA
e_e09[e_e09 == 99999] <- NA
e_e10[e_e10 > 4] <- NA

e_e <- cbind(e_e01, e_e02, e_e03, e_e04, e_e05, e_e06, e_e07, e_e08, e_e09, e_e10, e_e11)
rm(e_e01, e_e02, e_e03, e_e04, e_e05, e_e06, e_e07, e_e08, e_e09, e_e10, e_e11, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(e_e, "excale09-2008-ex-e_e.csv")
#Lectura a variable e_e
e_e <- read.csv("excale09-2008-ex-e_e.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(e_e, "excale09-2008-ex-e_e.csv")
#Lectura a variable e_e
e_e <- read_csv("excale09-2008-ex-e_e.csv")
