#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español (Comprensión lectora y Reflexión sobre la lengua) del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_clrl.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_clrl.zip", "excale03_2006_alum_clrl.zip")
unzip("excale03_2006_alum_clrl.zip", files = "Excale03_2006_Alum_CLRL.TXT")

#2. Lectura de la base de datos y asignación a la variable esp_cl
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 6, 16, 1, 5, 1, 16, 3, 1, 2, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCC_01", "PCC_02", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCD_01", "PCD_02", "PCD_03", "PCD_04", "PCD_05", "PCD_06", "PCE_01", "PCE_02", "PCE_03", "PCE_04", "PCE_05", "PCE_06", "PCE_07", "PCE_08", "PCF_01", "PCF_02", "PCF_03", "PCF_04", "PCF_05", "PCF_06", "PCF_07", "PCG_01", "PCG_02", "PCG_03", "PCG_04", "PCG_05", "PCG_07", "PCG_08", "PCH_01", "PCH_02", "PCH_03", "PCH_04", "PCH_05", "PCH_06", "PCH_07", "PCH_08", "PLA_01", "PLA_02", "PLA_03", "PLA_04", "PLA_05", "PLA_06", "PLA_07", "PLB_01", "PLB_02", "PLB_03", "PLB_04", "PLB_05", "PLB_06", "PLC_01", "PLC_03", "PLC_04", "PLC_05", "PLC_06", "PLD_01", "PLD_02", "PLD_03", "PLD_04", "PLD_05", "PLD_06", "PLD_07", "PLE_01", "PLE_02", "PLE_03", "PLE_04", "PLE_05", "PLE_06", "PLE_07", "PLF_01", "PLF_02", "PLF_03", "PLF_04", "PLF_05", "PLF_06", "PLF_07", "PLG_01", "PLG_02", "PLG_03", "PLG_04", "PLG_05", "PLG_06", "PLG_07", "PLH_01", "PLH_02", "PLH_03", "PLH_04", "PLH_05", "PLH_06", "PLH_07", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "PV1LEC", "PV2LEC", "PV3LEC", "PV4LEC", "PV5LEC", "PV1RCE", "PV2RCE", "PV3RCE", "PV4RCE", "PV5RCE", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVLB1", "ESPNVLB2", "ESPNVLB3", "ESPNVLB4", "ESPNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
esp_cl <- read.fwf(unz(temp, "Excale03_2006_Alum_CLRL.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp_cl <- read.fwf("Excale03_2006_Alum_CLRL.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

esp_cl <- read_fwf(unz(temp, "Excale03_2006_Alum_CLRL.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp_cl <- read_fwf("Excale03_2006_Alum_CLRL.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
esp_cl01 <- subset(esp_cl, select = c(NACIONAL:ENTEST))
esp_cl02 <- subset(esp_cl, select = c(ENTESTDOM))
esp_cl03 <- subset(esp_cl, select = c(ALUMNO:ID_INSTR))
esp_cl04 <- subset(esp_cl, select = c(SEXO))
esp_cl05 <- subset(esp_cl, select = c(EDAD))
esp_cl06 <- subset(esp_cl, select = c(EDADC))
esp_cl07 <- subset(esp_cl, select = c(EDAD1SEP))
esp_cl08 <- subset(esp_cl, select = c(EDAD1SEPC:EDADN))
esp_cl09 <- subset(esp_cl, select = c(EDAD_AC:MES_NAC))
esp_cl10 <- subset(esp_cl, select = c(W_ALU))
esp_cl11 <- subset(esp_cl, select = c(DOCENTE))
esp_cl12 <- subset(esp_cl, select = c(PCA_01:PLH_07))
esp_cl13 <- subset(esp_cl, select = c(PV1ESP:W_FSTR80))

esp_cl02[esp_cl02 == "999999"] <- NA
esp_cl04[esp_cl04 > 7] <- NA
esp_cl05[esp_cl05 == 99] <- NA
esp_cl06[esp_cl06 == 9] <- NA
esp_cl07[esp_cl07 == 99] <- NA
esp_cl08[esp_cl08 == 9] <- NA
esp_cl09[esp_cl09 > 97] <- NA
esp_cl11[esp_cl11 == 99999] <- NA
esp_cl12[esp_cl12 > 4] <- NA

esp_cl <- cbind(esp_cl01, esp_cl02, esp_cl03, esp_cl04, esp_cl05, esp_cl06, esp_cl07, esp_cl08, esp_cl09, esp_cl10, esp_cl11, esp_cl12, esp_cl13)
rm(esp_cl01, esp_cl02, esp_cl03, esp_cl04, esp_cl05, esp_cl06, esp_cl07, esp_cl08, esp_cl09, esp_cl10, esp_cl11, esp_cl12, esp_cl13, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(esp_cl, "excale03_2006_esp_cl.csv")
#Lectura a variable esp_cl
esp_cl <- read.csv("excale03_2006_esp_cl.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(esp_cl, "excale03_2006_esp_cl.csv")
#Lectura a variable esp_cl
esp_cl <- read_csv("excale03_2006_esp_cl.csv")
