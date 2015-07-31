#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Matemáticas del EXCALE 06 (Sexto de Primaria), aplicación 2009.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_alum_mat.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_alum_mat.zip", "excale06_2009_alum_mat.zip")
unzip("excale06_2009_alum_mat.zip", "Excale06_2009_Alum_MAT.TXT")

#2. Lectura de la base de datos y asignación a la variable mat
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 1, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "GM", "MARG_URB", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PMA_01", "PMA_02", "PMA_03", "PMA_04", "PMA_05", "PMA_06", "PMA_07", "PMA_08", "PMA_09", "PMA_10", "PMA_11", "PMA_12", "PMA_13", "PMA_14", "PMA_15", "PMA_16", "PMB_01", "PMB_02", "PMB_03", "PMB_04", "PMB_05", "PMB_06", "PMB_07", "PMB_08", "PMB_09", "PMB_10", "PMB_11", "PMB_12", "PMB_13", "PMB_14", "PMB_15", "PMB_16", "PMC_01", "PMC_02", "PMC_03", "PMC_04", "PMC_05", "PMC_06", "PMC_07", "PMC_08", "PMC_09", "PMC_10", "PMC_11", "PMC_12", "PMC_13", "PMC_14", "PMC_15", "PMC_16", "PMC_17", "PMD_01", "PMD_02", "PMD_03", "PMD_04", "PMD_05", "PMD_06", "PMD_07", "PMD_08", "PMD_09", "PMD_10", "PMD_11", "PMD_12", "PMD_13", "PMD_14", "PMD_15", "PMD_16", "PME_01", "PME_02", "PME_03", "PME_04", "PME_05", "PME_06", "PME_07", "PME_08", "PME_09", "PME_10", "PME_11", "PME_12", "PME_13", "PME_14", "PME_15", "PME_16", "PMF_01", "PMF_02", "PMF_03", "PMF_04", "PMF_05", "PMF_06", "PMF_07", "PMF_08", "PMF_09", "PMF_10", "PMF_11", "PMF_12", "PMF_13", "PMF_14", "PMF_15", "PMF_16", "PMF_17", "PMG_01", "PMG_02", "PMG_03", "PMG_04", "PMG_05", "PMG_06", "PMG_07", "PMG_08", "PMG_09", "PMG_10", "PMG_11", "PMG_12", "PMG_13", "PMG_14", "PMG_15", "PMG_16", "PMG_17", "PMH_01", "PMH_02", "PMH_03", "PMH_04", "PMH_05", "PMH_06", "PMH_07", "PMH_08", "PMH_09", "PMH_10", "PMH_11", "PMH_12", "PMH_13", "PMH_14", "PMH_15", "PMH_16", "PMH_17", "PMI_01", "PMI_02", "PMI_03", "PMI_04", "PMI_05", "PMI_06", "PMI_07", "PMI_08", "PMI_09", "PMI_10", "PMI_11", "PMI_12", "PMI_13", "PMI_14", "PMI_15", "PMI_16", "PMJ_01", "PMJ_02", "PMJ_03", "PMJ_04", "PMJ_05", "PMJ_06", "PMJ_07", "PMJ_08", "PMJ_09", "PMJ_10", "PMJ_11", "PMJ_12", "PMJ_13", "PMJ_14", "PMJ_15", "PMJ_16", "PMJ_17", "PMK_01", "PMK_02", "PMK_03", "PMK_04", "PMK_05", "PMK_06", "PMK_07", "PMK_08", "PMK_09", "PMK_10", "PMK_12", "PMK_13", "PMK_14", "PMK_15", "PMK_16", "PMK_17", "PML_01", "PML_02", "PML_03", "PML_04", "PML_05", "PML_06", "PML_07", "PML_08", "PML_09", "PML_10", "PML_11", "PML_12", "PML_13", "PML_14", "PML_15", "PML_16", "PML_17", "PMM_01", "PMM_02", "PMM_03", "PMM_04", "PMM_05", "PMM_06", "PMM_07", "PMM_08", "PMM_09", "PMM_10", "PMM_11", "PMM_12", "PMM_13", "PMM_14", "PMM_15", "PMM_16", "PMM_17", "PMN_01", "PMN_02", "PMN_03", "PMN_04", "PMN_05", "PMN_06", "PMN_07", "PMN_08", "PMN_09", "PMN_10", "PMN_11", "PMN_12", "PMN_13", "PMN_14", "PMN_15", "PMN_16", "PMN_17", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "MATNVBL1", "MATNVBL2", "MATNVBL3", "MATNVBL4", "MATNVBL5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
mat <- read.fwf(unz(temp, "Excale06_2009_Alum_MAT.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
mat <- read.fwf("Excale06_2009_Alum_MAT.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

#Si se ha descargado la base de datos al directorio de trabajo usar:
mat <- read_fwf("Excale06_2009_Alum_MAT.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
mat01 <- subset(mat, select = c(NACIONAL:MOD))
mat02 <- subset(mat, select = c(GM))
mat03 <- subset(mat, select = c(MARG_URB))
mat04 <- subset(mat, select = c(ESTRATO:ID_INSTR))
mat05 <- subset(mat, select = c(SEXO))
mat06 <- subset(mat, select = c(EDAD))
mat07 <- subset(mat, select = c(EDADC:EDADN))
mat08 <- subset(mat, select = c(EDAD_AC:MES_NAC))
mat09 <- subset(mat, select = c(W_ALU))
mat10 <- subset(mat, select = c(DOCENTE))
mat11 <- subset(mat, select = c(PMA_01:PMN_17))
mat12 <- subset(mat, select = c(PV1MAT:W_FSTR80))

mat02[mat02 == 9] <- NA
mat03[mat03 == 7] <- NA
mat05[mat05 > 7] <- NA
mat06[mat06 == 99] <- NA
mat07[mat07 == 9] <- NA
mat08[mat08 > 97] <- NA
mat10[mat10 == 99999] <- NA
mat11[mat11 > 4] <- NA

mat <- cbind(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10, mat11, mat12)
rm(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10, mat11, mat12, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(mat, "excale06-2009-ex-mat.csv")
#Lectura a variable mat
mat <- read.csv("excale06-2009-ex-mat.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(mat, "excale06-2009-ex-mat.csv")
#Lectura a variable mat
mat <- read_csv("excale06-2009-ex-mat.csv")
