#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español del EXCALE 03 (Tercero de Primaria), aplicación 2010.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE03_2010/excale03_2010_alum_esp.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE03_2010/excale03_2010_alum_esp.zip", "excale03_2010_alum_esp.zip")
unzip("excale03_2010_alum_esp.zip", "Excale03_2010_Alum_ESP.TXT")

#2. Lectura de la base de datos y asignación a la variable esp
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PEA_01", "PEA_02", "PEA_03", "PEA_04", "PEA_05", "PEA_06", "PEA_07", "PEA_08", "PEA_09", "PEA_10", "PEA_11", "PEA_12", "PEA_13", "PEA_14", "PEB_01", "PEB_02", "PEB_03", "PEB_04", "PEB_05", "PEB_06", "PEB_07", "PEB_09", "PEB_10", "PEB_11", "PEB_12", "PEB_13", "PEC_01", "PEC_02", "PEC_03", "PEC_04", "PEC_05", "PEC_06", "PEC_07", "PEC_08", "PEC_09", "PEC_10", "PEC_11", "PEC_12", "PEC_13", "PED_01", "PED_02", "PED_03", "PED_04", "PED_05", "PED_06", "PED_07", "PED_08", "PED_09", "PED_10", "PED_11", "PED_12", "PED_13", "PED_14", "PEE_01", "PEE_02", "PEE_03", "PEE_04", "PEE_05", "PEE_06", "PEE_07", "PEE_08", "PEE_09", "PEE_10", "PEE_11", "PEE_12", "PEE_13", "PEE_14", "PEE_15", "PEF_01", "PEF_02", "PEF_03", "PEF_04", "PEF_05", "PEF_06", "PEF_07", "PEF_08", "PEF_09", "PEF_10", "PEF_11", "PEF_12", "PEF_13", "PEF_14", "PEG_01", "PEG_02", "PEG_03", "PEG_05", "PEG_06", "PEG_07", "PEG_08", "PEG_09", "PEG_10", "PEG_11", "PEG_12", "PEG_13", "PEG_14", "PEG_15", "PEH_01", "PEH_02", "PEH_03", "PEH_04", "PEH_05", "PEH_06", "PEH_07", "PEH_08", "PEH_09", "PEH_10", "PEH_11", "PEH_12", "PEH_13", "PEH_14", "PEH_15", "PEI_01", "PEI_02", "PEI_03", "PEI_04", "PEI_05", "PEI_06", "PEI_07", "PEI_08", "PEI_09", "PEI_10", "PEI_11", "PEI_12", "PEI_13", "PEJ_01", "PEJ_02", "PEJ_03", "PEJ_04", "PEJ_05", "PEJ_06", "PEJ_07", "PEJ_08", "PEJ_09", "PEJ_10", "PEJ_11", "PEJ_12", "PEJ_13", "PEK_01", "PEK_02", "PEK_04", "PEK_05", "PEK_06", "PEK_07", "PEK_08", "PEK_09", "PEK_12", "PEK_13", "PEL_01", "PEL_02", "PEL_03", "PEL_05", "PEL_06", "PEL_07", "PEL_09", "PEL_10", "PEL_12", "PEL_13", "PEM_01", "PEM_02", "PEM_03", "PEM_04", "PEM_06", "PEM_07", "PEM_08", "PEM_09", "PEM_10", "PEM_11", "PEM_12", "PEM_13", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVBL1", "ESPNVBL2", "ESPNVBL3", "ESPNVBL4", "ESPNVBL5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
esp <- read.fwf(unz(temp, "Excale03_2010_Alum_ESP.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp <- read.fwf("Excale03_2010_Alum_ESP.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

esp <- read_fwf(unz(temp, "Excale03_2010_Alum_ESP.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp <- read_fwf("Excale03_2010_Alum_ESP.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
esp01 <- subset(esp, select = c(NACIONAL:ID_INSTR))
esp02 <- subset(esp, select = c(SEXO))
esp03 <- subset(esp, select = c(EDAD))
esp04 <- subset(esp, select = c(EDADC:EDADN))
esp05 <- subset(esp, select = c(EDAD_AC:MES_NAC))
esp06 <- subset(esp, select = c(W_ALU))
esp07 <- subset(esp, select = c(DOCENTE))
esp08 <- subset(esp, select = c(PEA_01:PEM_13))
esp09 <- subset(esp, select = c(PV1ESP:W_FSTR80))

esp02[esp02 > 7] <- NA
esp03[esp03 > 97] <- NA
esp04[esp04 > 7] <- NA
esp05[esp05 > 97] <- NA
esp07[esp07 == 99999] <- NA
esp08[esp08 > 4] <- NA

esp <- cbind(esp01, esp02, esp03, esp04, esp05, esp06, esp07, esp08, esp09)
rm(esp01, esp02, esp03, esp04, esp05, esp06, esp07, esp08, esp09, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(esp, "excale03-2010-ex-esp.csv")
#Lectura a variable esp
esp <- read.csv("excale03-2010-ex-esp.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(esp, "excale03-2010-ex-esp.csv")
#Lectura a variable esp
esp <- read_csv("excale03-2010-ex-esp.csv")
