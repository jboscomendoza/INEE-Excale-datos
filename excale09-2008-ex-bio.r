#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Biología del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_bio.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_bio.zip", "excale09_2008_alum_bio.zip")
unzip("excale09_2008_alum_bio.zip", "Excale09_2008_Alum_Bio.TXT")

#2. Lectura de la base de datos y asignación a la variable bio
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "SNA_01", "SNA_02", "SNA_03", "SNA_04", "SNA_05", "SNA_06", "SNA_07", "SNA_08", "SNA_09", "SNA_10", "SNA_11", "SNA_12", "SNA_13", "SNA_14", "SNA_15", "SNA_16", "SNA_17", "SNA_18", "SNA_19", "SNA_20", "SNA_21", "SNA_22", "SNA_23", "SNA_24", "SNA_25", "SNB_01", "SNB_02", "SNB_03", "SNB_04", "SNB_05", "SNB_06", "SNB_07", "SNB_08", "SNB_09", "SNB_10", "SNB_11", "SNB_12", "SNB_13", "SNB_14", "SNB_15", "SNB_16", "SNB_17", "SNB_18", "SNB_19", "SNB_20", "SNB_21", "SNB_22", "SNB_23", "SNB_24", "SNB_25", "SNC_01", "SNC_02", "SNC_03", "SNC_04", "SNC_05", "SNC_06", "SNC_07", "SNC_08", "SNC_09", "SNC_10", "SNC_11", "SNC_12", "SNC_13", "SNC_14", "SNC_15", "SNC_16", "SNC_17", "SNC_18", "SNC_19", "SNC_20", "SNC_21", "SNC_22", "SNC_23", "SNC_24", "SNC_25", "SND_01", "SND_02", "SND_03", "SND_04", "SND_05", "SND_06", "SND_07", "SND_08", "SND_09", "SND_10", "SND_11", "SND_12", "SND_13", "SND_14", "SND_15", "SND_16", "SND_17", "SND_18", "SND_19", "SND_20", "SND_21", "SND_22", "SND_23", "SND_24", "SND_25", "PV1BIO", "PV2BIO", "PV3BIO", "PV4BIO", "PV5BIO", "BIONVL1", "BIONVL2", "BIONVL3", "BIONVL4", "BIONVL5", "BIONVLB1", "BIONVLB2", "BIONVLB3", "BIONVLB4", "BIONVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
bio <- read.fwf(unz(temp, "Excale09_2008_Alum_Bio.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
bio <- read.fwf("Excale09_2008_Alum_Bio.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

bio <- read_fwf(unz(temp, "Excale09_2008_Alum_Bio.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
bio <- read_fwf("Excale09_2008_Alum_Bio.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
bio01 <- subset(bio, select = c(NACIONAL:MOD))
bio02 <- subset(bio, select = c(MAGEB05))
bio03 <- subset(bio, select = c(ESTRATO:ID_INSTR))
bio04 <- subset(bio, select = c(SEXO))
bio05 <- subset(bio, select = c(EDAD))
bio06 <- subset(bio, select = c(EDADC:EDADN))
bio07 <- subset(bio, select = c(EDAD_AC:MES_NAC))
bio08 <- subset(bio, select = c(W_ALU))
bio09 <- subset(bio, select = c(DOCENTE))
bio10 <- subset(bio, select = c(SNA_01:SND_25))
bio11 <- subset(bio, select = c(PV1BIO:W_FSTR80))

bio02[bio02 == "NA"] <- NA
bio04[bio04 > 7] <- NA
bio05[bio05 > 97] <- NA
bio06[bio06 == 9] <- NA
bio07[bio07 > 97] <- NA
bio09[bio09 == 99999] <- NA
bio10[bio10 > 4] <- NA

bio <- cbind(bio01, bio02, bio03, bio04, bio05, bio06, bio07, bio08, bio09, bio10, bio11)
rm(bio01, bio02, bio03, bio04, bio05, bio06, bio07, bio08, bio09, bio10, bio11, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(bio, "excale09-2008-ex-bio.csv")
#Lectura a variable bio
bio <- read.csv("excale09-2008-ex-bio.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(bio, "excale09-2008-ex-bio.csv")
#Lectura a variable bio
bio <- read_csv("excale09-2008-ex-bio.csv")
