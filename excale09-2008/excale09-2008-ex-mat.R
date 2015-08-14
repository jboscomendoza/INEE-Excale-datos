#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Matemáticas del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_mat.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_mat.zip", "excale09_2008_alum_mat.zip")
unzip("excale09_2008_alum_mat.zip", "Excale09_2008_Alum_Mat.TXT")

#2. Lectura de la base de datos y asignación a la variable mat
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "SMA_01", "SMA_02", "SMA_03", "SMA_04", "SMA_05", "SMA_06", "SMA_07", "SMA_08", "SMA_09", "SMA_10", "SMA_11", "SMA_12", "SMA_13", "SMA_14", "SMA_15", "SMA_16", "SMA_17", "SMA_18", "SMA_19", "SMA_20", "SMA_21", "SMA_22", "SMA_23", "SMA_24", "SMB_01", "SMB_02", "SMB_03", "SMB_04", "SMB_05", "SMB_06", "SMB_07", "SMB_08", "SMB_09", "SMB_10", "SMB_11", "SMB_12", "SMB_13", "SMB_14", "SMB_15", "SMB_16", "SMB_17", "SMB_18", "SMB_19", "SMB_20", "SMB_21", "SMB_22", "SMB_23", "SMB_24", "SMC_01", "SMC_02", "SMC_03", "SMC_04", "SMC_05", "SMC_06", "SMC_07", "SMC_08", "SMC_09", "SMC_10", "SMC_11", "SMC_12", "SMC_13", "SMC_14", "SMC_15", "SMC_16", "SMC_17", "SMC_18", "SMC_19", "SMC_20", "SMC_21", "SMC_22", "SMC_23", "SMC_24", "SMD_01", "SMD_02", "SMD_03", "SMD_04", "SMD_05", "SMD_06", "SMD_07", "SMD_08", "SMD_09", "SMD_10", "SMD_11", "SMD_12", "SMD_13", "SMD_14", "SMD_15", "SMD_16", "SMD_17", "SMD_18", "SMD_19", "SMD_20", "SMD_21", "SMD_22", "SMD_23", "SMD_24", "SME_01", "SME_02", "SME_03", "SME_04", "SME_05", "SME_06", "SME_07", "SME_08", "SME_09", "SME_10", "SME_11", "SME_12", "SME_13", "SME_14", "SME_15", "SME_16", "SME_17", "SME_18", "SME_19", "SME_20", "SME_21", "SME_22", "SME_23", "SME_24", "SMF_01", "SMF_02", "SMF_03", "SMF_04", "SMF_05", "SMF_06", "SMF_07", "SMF_08", "SMF_09", "SMF_10", "SMF_11", "SMF_12", "SMF_13", "SMF_14", "SMF_15", "SMF_16", "SMF_17", "SMF_18", "SMF_19", "SMF_20", "SMF_21", "SMF_22", "SMF_23", "SMF_24", "SMG_01", "SMG_02", "SMG_03", "SMG_04", "SMG_05", "SMG_06", "SMG_07", "SMG_08", "SMG_09", "SMG_10", "SMG_11", "SMG_12", "SMG_13", "SMG_14", "SMG_15", "SMG_16", "SMG_17", "SMG_18", "SMG_19", "SMG_20", "SMG_21", "SMG_22", "SMG_23", "SMG_24", "SMH_01", "SMH_02", "SMH_03", "SMH_04", "SMH_05", "SMH_06", "SMH_07", "SMH_08", "SMH_09", "SMH_10", "SMH_11", "SMH_12", "SMH_13", "SMH_14", "SMH_15", "SMH_16", "SMH_17", "SMH_18", "SMH_19", "SMH_20", "SMH_21", "SMH_22", "SMH_23", "SMH_24", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "MATNVLB1", "MATNVLB2", "MATNVLB3", "MATNVLB4", "MATNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
mat <- read.fwf(unz(temp, "Excale09_2008_Alum_Mat.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
mat <- read.fwf("Excale09_2008_Alum_Mat.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

mat <- read_fwf(unz(temp, "Excale09_2008_Alum_Mat.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
mat <- read_fwf("Excale09_2008_Alum_Mat.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
mat01 <- subset(mat, select = c(NACIONAL:MOD))
mat02 <- subset(mat, select = c(MAGEB05))
mat03 <- subset(mat, select = c(ESTRATO:ID_INSTR))
mat04 <- subset(mat, select = c(SEXO))
mat05 <- subset(mat, select = c(EDAD))
mat06 <- subset(mat, select = c(EDADC:EDADN))
mat07 <- subset(mat, select = c(EDAD_AC:MES_NAC))
mat08 <- subset(mat, select = c(W_ALU))
mat09 <- subset(mat, select = c(DOCENTE))
mat10 <- subset(mat, select = c(SMA_01:SMH_24))
mat11 <- subset(mat, select = c(PV1MAT:W_FSTR80))

mat02[mat02 == "NA"] <- NA
mat04[mat04 > 7] <- NA
mat05[mat05 > 97] <- NA
mat06[mat06 == 9] <- NA
mat07[mat07 > 97] <- NA
mat09[mat09 == 99999] <- NA
mat10[mat10 > 4] <- NA

mat <- cbind(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10, mat11)
rm(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10, mat11, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(mat, "excale09-2008-ex-mat.csv")
#Lectura a variable mat
mat <- read.csv("excale09-2008-ex-mat.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(mat, "excale09-2008-ex-mat.csv")
#Lectura a variable mat
mat <- read_csv("excale09-2008-ex-mat.csv")
