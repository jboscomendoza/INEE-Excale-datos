#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Educación Cívica del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_eciv.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_eciv.zip", "excale03_2006_alum_eciv.zip")
unzip("excale03_2006_alum_eciv.zip", files = "Excale03_2006_Alum_ECiv.TXT")

#2. Lectura de la base de datos y asignación a la variable civ
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 6, 16, 1, 5, 1, 16, 3, 1, 2, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PVA_01", "PVA_02", "PVA_03", "PVA_04", "PVA_05", "PVA_06", "PVA_07", "PVB_01", "PVB_02", "PVB_03", "PVB_04", "PVB_05", "PVB_06", "PVB_07", "PVB_08", "PVC_01", "PVC_02", "PVC_03", "PVC_04", "PVC_05", "PVC_06", "PVC_07", "PVC_08", "PVD_01", "PVD_02", "PVD_03", "PVD_04", "PVD_05", "PVD_06", "PVD_07", "PVD_08", "PVE_01", "PVE_02", "PVE_03", "PVE_04", "PVE_05", "PVE_06", "PVE_07", "PVE_08", "PVF_01", "PVF_02", "PVF_03", "PVF_04", "PVF_05", "PVF_06", "PVF_07", "PV1CIV", "PV2CIV", "PV3CIV", "PV4CIV", "PV5CIV", "CIVNVL1", "CIVNVL2", "CIVNVL3", "CIVNVL4", "CIVNVL5", "CIVNVLB1", "CIVNVLB2", "CIVNVLB3", "CIVNVLB4", "CIVNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
civ <- read.fwf(unz(temp, "Excale03_2006_Alum_ECiv.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
civ <- read.fwf("Excale03_2006_Alum_ECiv.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

civ <- read_fwf(unz(temp, "Excale03_2006_Alum_ECiv.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
civ <- read_fwf("Excale03_2006_Alum_ECiv.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
civ01 <- subset(civ, select = c(NACIONAL:ENTEST))
civ02 <- subset(civ, select = c(ENTESTDOM))
civ03 <- subset(civ, select = c(ALUMNO:ID_INSTR))
civ04 <- subset(civ, select = c(SEXO))
civ05 <- subset(civ, select = c(EDAD))
civ06 <- subset(civ, select = c(EDADC))
civ07 <- subset(civ, select = c(EDAD1SEP))
civ08 <- subset(civ, select = c(EDAD1SEPC:EDADN))
civ09 <- subset(civ, select = c(EDAD_AC:MES_NAC))
civ10 <- subset(civ, select = c(W_ALU))
civ11 <- subset(civ, select = c(DOCENTE))
civ12 <- subset(civ, select = c(PVA_01:PVF_07))
civ13 <- subset(civ, select = c(PV1CIV:W_FSTR80))

civ02[civ02 == "999999"] <- NA
civ04[civ04 > 7] <- NA
civ05[civ05 == 99] <- NA
civ06[civ06 == 9] <- NA
civ07[civ07 == 99] <- NA
civ08[civ08 == 9] <- NA
civ09[civ09 > 97] <- NA
civ11[civ11 == 99999] <- NA
civ12[civ12 > 4] <- NA

civ <- cbind(civ01, civ02, civ03, civ04, civ05, civ06, civ07, civ08, civ09, civ10, civ11, civ12, civ13)
rm(civ01, civ02, civ03, civ04, civ05, civ06, civ07, civ08, civ09, civ10, civ11, civ12, civ13, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(civ, "excale03_2006_civ.csv")
#Lectura a variable civ
civ <- read.csv("excale03_2006_civ.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(civ, "excale03_2006_civ.csv")
#Lectura a variable civ
civ <- read_csv("excale03_2006_civ.csv")
