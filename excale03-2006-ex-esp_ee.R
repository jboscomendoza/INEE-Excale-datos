#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español (Expresión escrita) del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_esc.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_esc.zip", "excale03_2006_alum_esc.zip")
unzip("excale03_2006_alum_esc.zip", files = "Excale03_2006_Alum_Esc.TXT")

#2. Lectura de la base de datos y asignación a la variable esp_ee
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 6, 16, 1, 5, 1, 16, 3, 1, 2, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 16, 16, 16, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PRE1_01", "PRE3_03", "PRE3_04", "PRE3_05", "PRE3_06", "PRE3_07", "PRE3_08", "PRE3_09", "PRE3_10", "PRE3_11", "PRE3_12", "PRE4_13", "PRE4_14", "PRE4_15", "PRE4_16", "PRE4_17", "PRE4_18", "PRE4_19", "PRE4_20", "PRE4_21", "PRE5_22", "PRE5_23", "PRE5_24", "PRE5_25", "PRE5_26", "PRE5_27", "PRE5_28", "PRE5_29", "PRE5_30", "PRE5_31", "PRE_ORTO", "PRS6_01", "PRS6_02", "PRS6_03", "PRS6_04", "PRS7_05", "PV1RA", "PV2RA", "PV3RA", "PV4RA", "PV5RA", "RANVL1", "RANVL2", "RANVL3", "RANVL4", "RANVL5", "RANVLB1", "RANVLB2", "RANVLB3", "RANVLB4", "RANVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
esp_ee <- read.fwf(unz(temp, "Excale03_2006_Alum_Esc.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp_ee <- read.fwf("Excale03_2006_Alum_Esc.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

esp_ee <- read_fwf(unz(temp, "Excale03_2006_Alum_Esc.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
esp_ee <- read_fwf("Excale03_2006_Alum_Esc.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
esp_ee01 <- subset(esp_ee, select = c(NACIONAL:ENTEST))
esp_ee02 <- subset(esp_ee, select = c(ENTESTDOM))
esp_ee03 <- subset(esp_ee, select = c(ALUMNO:ID_INSTR))
esp_ee04 <- subset(esp_ee, select = c(SEXO))
esp_ee05 <- subset(esp_ee, select = c(EDAD))
esp_ee06 <- subset(esp_ee, select = c(EDADC))
esp_ee07 <- subset(esp_ee, select = c(EDAD1SEP))
esp_ee08 <- subset(esp_ee, select = c(EDAD1SEPC:EDADN))
esp_ee09 <- subset(esp_ee, select = c(EDAD_AC:MES_NAC))
esp_ee10 <- subset(esp_ee, select = c(W_ALU))
esp_ee11 <- subset(esp_ee, select = c(DOCENTE))
esp_ee12 <- subset(esp_ee, select = c(PRE1_01:PRE5_31))
esp_ee13 <- subset(esp_ee, select = c(PRE_ORTO))
esp_ee14 <- subset(esp_ee, select = c(PRS6_01:PRS7_05))
esp_ee15 <- subset(esp_ee, select = c(PV1RA:W_FSTR80))

esp_ee02[esp_ee02 == "999999"] <- NA
esp_ee04[esp_ee04 > 7] <- NA
esp_ee05[esp_ee05 == 99] <- NA
esp_ee06[esp_ee06 == 9] <- NA
esp_ee07[esp_ee07 == 99] <- NA
esp_ee08[esp_ee08 == 9] <- NA
esp_ee09[esp_ee09 > 97] <- NA
esp_ee11[esp_ee11 == 99999] <- NA
esp_ee12[esp_ee12 > 5] <- NA
esp_ee13[esp_ee13 == 999] <- NA
esp_ee14[esp_ee14 > 5] <- NA

esp_ee <- cbind(esp_ee01, esp_ee02, esp_ee03, esp_ee04, esp_ee05, esp_ee06, esp_ee07, esp_ee08, esp_ee09, esp_ee10, esp_ee11, esp_ee12, esp_ee13, esp_ee14, esp_ee15)
rm(esp_ee01, esp_ee02, esp_ee03, esp_ee04, esp_ee05, esp_ee06, esp_ee07, esp_ee08, esp_ee09, esp_ee10, esp_ee11, esp_ee12, esp_ee13, esp_ee14, esp_ee15, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(esp_ee, "excale03_2006_esp_ee.csv")
#Lectura a variable esp_ee
esp_ee <- read.csv("excale03_2006_esp_ee.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(esp_ee, "excale03_2006_esp_ee.csv")
#Lectura a variable esp_ee
esp_ee <- read_csv("excale03_2006_esp_ee.csv")
