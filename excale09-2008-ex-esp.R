#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español (Comprensión lectora y Reflexión sobre la lengua) del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_esp.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_esp.zip", "excale09_2008_alum_esp.zip")
unzip("excale09_2008_alum_esp.zip", "Excale09_2008_Alum_Esp.TXT")

#2. Lectura de la base de datos y asignación a la variable esp
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "SEA_01", "SEA_02", "SEA_03", "SEA_04", "SEA_05", "SEA_06", "SEA_07", "SEA_08", "SEA_09", "SEA_10", "SEA_11", "SEA_12", "SEA_13", "SEA_14", "SEA_15", "SEA_16", "SEA_17", "SEA_18", "SEB_01", "SEB_02", "SEB_03", "SEB_04", "SEB_05", "SEB_06", "SEB_07", "SEB_08", "SEB_09", "SEB_10", "SEB_11", "SEB_12", "SEB_13", "SEB_14", "SEB_15", "SEB_16", "SEB_17", "SEB_18", "SEC_01", "SEC_02", "SEC_03", "SEC_04", "SEC_05", "SEC_06", "SEC_07", "SEC_08", "SEC_09", "SEC_10", "SEC_11", "SEC_12", "SEC_13", "SEC_14", "SEC_15", "SEC_16", "SEC_17", "SEC_18", "SEC_19", "SED_01", "SED_02", "SED_03", "SED_04", "SED_05", "SED_06", "SED_07", "SED_08", "SED_09", "SED_10", "SED_11", "SED_12", "SED_13", "SED_14", "SED_15", "SED_16", "SED_17", "SED_18", "SEE_01", "SEE_02", "SEE_03", "SEE_04", "SEE_05", "SEE_06", "SEE_07", "SEE_08", "SEE_09", "SEE_10", "SEE_11", "SEE_12", "SEE_13", "SEE_14", "SEE_15", "SEE_16", "SEE_17", "SEE_18", "SEF_01", "SEF_02", "SEF_03", "SEF_04", "SEF_05", "SEF_06", "SEF_07", "SEF_08", "SEF_09", "SEF_10", "SEF_11", "SEF_12", "SEF_13", "SEF_14", "SEF_15", "SEF_16", "SEF_17", "SEF_18", "SEG_01", "SEG_02", "SEG_03", "SEG_04", "SEG_05", "SEG_06", "SEG_07", "SEG_08", "SEG_09", "SEG_10", "SEG_11", "SEG_12", "SEG_13", "SEG_14", "SEG_15", "SEG_16", "SEG_17", "SEG_18", "SEH_01", "SEH_02", "SEH_03", "SEH_04", "SEH_05", "SEH_06", "SEH_07", "SEH_08", "SEH_09", "SEH_10", "SEH_11", "SEH_12", "SEH_13", "SEH_14", "SEH_15", "SEH_16", "SEH_17", "SEH_18", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVLB1", "ESPNVLB2", "ESPNVLB3", "ESPNVLB4", "ESPNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
esp <- read.fwf(unz(temp, "Excale09_2008_Alum_Esp.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp <- read.fwf("Excale09_2008_Alum_Esp.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

esp <- read_fwf(unz(temp, "Excale09_2008_Alum_Esp.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp <- read_fwf("Excale09_2008_Alum_Esp.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
esp01 <- subset(esp, select = c(NACIONAL:MOD))
esp02 <- subset(esp, select = c(MAGEB05))
esp03 <- subset(esp, select = c(ESTRATO:ID_INSTR))
esp04 <- subset(esp, select = c(SEXO))
esp05 <- subset(esp, select = c(EDAD))
esp06 <- subset(esp, select = c(EDADC:EDADN))
esp07 <- subset(esp, select = c(EDAD_AC:MES_NAC))
esp08 <- subset(esp, select = c(W_ALU))
esp09 <- subset(esp, select = c(DOCENTE))
esp10 <- subset(esp, select = c(SEA_01:SEH_18))
esp11 <- subset(esp, select = c(PV1ESP:W_FSTR80))

esp02[esp02 == "NA"] <- NA
esp04[esp04 > 7] <- NA
esp05[esp05 > 97] <- NA
esp06[esp06 == 9] <- NA
esp07[esp07 > 97] <- NA
esp09[esp09 == 99999] <- NA
esp10[esp10 > 4] <- NA


esp <- cbind(esp01, esp02, esp03, esp04, esp05, esp06, esp07, esp08, esp09, esp10, esp11)
rm(esp01, esp02, esp03, esp04, esp05, esp06, esp07, esp08, esp09, esp10, esp11, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(esp, "excale09-2008-ex-esp.csv")
#Lectura a variable esp
esp <- read.csv("excale09-2008-ex-esp.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(esp, "excale09-2008-ex-esp.csv")
#Lectura a variable esp
esp <- read_csv("excale09-2008-ex-esp.csv")
