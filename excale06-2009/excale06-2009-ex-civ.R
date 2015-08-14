#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Educación Cívica del EXCALE 06 (Sexto de Primaria), aplicación 2009.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_alum_civ.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_alum_civ.zip", "excale06_2009_alum_civ.zip")
unzip("excale06_2009_alum_civ.zip", "Excale06_2009_Alum_Civ.TXT")

#2. Lectura de la base de datos y asignación a la variable civ
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 1, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "GM", "MARG_URB", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCA_07", "PCA_08", "PCA_09", "PCA_10", "PCA_11", "PCA_12", "PCA_13", "PCA_14", "PCA_15", "PCA_16", "PCA_17", "PCA_18", "PCB_01", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCB_08", "PCB_09", "PCB_10", "PCB_11", "PCB_12", "PCB_13", "PCB_14", "PCB_15", "PCB_16", "PCB_17", "PCB_18", "PCB_19", "PCC_01", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCC_08", "PCC_09", "PCC_10", "PCC_11", "PCC_12", "PCC_13", "PCC_14", "PCC_15", "PCC_16", "PCC_17", "PCC_18", "PCC_19", "PV1CIV", "PV2CIV", "PV3CIV", "PV4CIV", "PV5CIV", "CIVNVL1", "CIVNVL2", "CIVNVL3", "CIVNVL4", "CIVNVL5", "CIVNVBL1", "CIVNVBL2", "CIVNVBL3", "CIVNVBL4", "CIVNVBL5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
civ <- read.fwf(unz(temp, "Excale06_2009_Alum_Civ.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
civ <- read.fwf("Excale06_2009_Alum_Civ.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

civ <- read_fwf(unz(temp, "Excale06_2009_Alum_Civ.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
civ <- read_fwf("Excale06_2009_Alum_Civ.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
civ01 <- subset(civ, select = c(NACIONAL:MOD))
civ02 <- subset(civ, select = c(GM))
civ03 <- subset(civ, select = c(MARG_URB))
civ04 <- subset(civ, select = c(ESTRATO:ID_INSTR))
civ05 <- subset(civ, select = c(SEXO))
civ06 <- subset(civ, select = c(EDAD))
civ07 <- subset(civ, select = c(EDADC:EDADN))
civ08 <- subset(civ, select = c(EDAD_AC:MES_NAC))
civ09 <- subset(civ, select = c(W_ALU))
civ10 <- subset(civ, select = c(DOCENTE))
civ11 <- subset(civ, select = c(PCA_01:PCC_19))
civ12 <- subset(civ, select = c(PV1CIV:W_FSTR80))

civ02[civ02 == 9] <- NA
civ03[civ03 == 7] <- NA
civ05[civ05 > 7] <- NA
civ06[civ06 == 99] <- NA
civ07[civ07 == 9] <- NA
civ08[civ08 > 97] <- NA
civ10[civ10 == 99999] <- NA
civ11[civ11 > 4] <- NA

civ <- cbind(civ01, civ02, civ03, civ04, civ05, civ06, civ07, civ08, civ09, civ10, civ11, civ12)
rm(civ01, civ02, civ03, civ04, civ05, civ06, civ07, civ08, civ09, civ10, civ11, civ12, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(civ, "excale06-2009-ex-civ.csv")
#Lectura a variable civ
civ <- read.csv("excale06-2009-ex-civ.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(civ, "excale06-2009-ex-civ.csv")
#Lectura a variable civ
civ <- read_csv("excale06-2009-ex-civ.csv")
