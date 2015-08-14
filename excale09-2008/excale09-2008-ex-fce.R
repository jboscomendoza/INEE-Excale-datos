#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Formación Cívica y Ética del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_fce.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_alum_fce.zip", "excale09_2008_alum_fce.zip")
unzip("excale09_2008_alum_fce.zip", "Excale09_2008_Alum_FCE.TXT")

#2. Lectura de la base de datos y asignación a la variable fce
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "SCA_01", "SCA_02", "SCA_03", "SCA_04", "SCA_05", "SCA_06", "SCA_07", "SCA_08", "SCA_09", "SCA_10", "SCA_11", "SCA_12", "SCA_13", "SCA_14", "SCA_15", "SCA_16", "SCA_17", "SCA_18", "SCA_19", "SCA_20", "SCA_21", "SCA_22", "SCA_23", "SCB_01", "SCB_02", "SCB_03", "SCB_04", "SCB_05", "SCB_06", "SCB_07", "SCB_08", "SCB_09", "SCB_10", "SCB_11", "SCB_12", "SCB_13", "SCB_14", "SCB_15", "SCB_16", "SCB_17", "SCB_18", "SCB_19", "SCB_20", "SCB_21", "SCB_22", "SCB_23", "SCC_01", "SCC_02", "SCC_03", "SCC_04", "SCC_05", "SCC_06", "SCC_07", "SCC_08", "SCC_09", "SCC_10", "SCC_11", "SCC_12", "SCC_13", "SCC_14", "SCC_15", "SCC_16", "SCC_17", "SCC_18", "SCC_19", "SCC_20", "SCC_21", "SCC_22", "SCC_23", "SCD_01", "SCD_02", "SCD_03", "SCD_04", "SCD_05", "SCD_06", "SCD_07", "SCD_08", "SCD_09", "SCD_10", "SCD_11", "SCD_12", "SCD_13", "SCD_14", "SCD_15", "SCD_16", "SCD_17", "SCD_18", "SCD_19", "SCD_20", "SCD_21", "SCD_22", "SCD_23", "SCE_01", "SCE_02", "SCE_03", "SCE_04", "SCE_05", "SCE_06", "SCE_07", "SCE_08", "SCE_09", "SCE_10", "SCE_11", "SCE_12", "SCE_13", "SCE_14", "SCE_15", "SCE_16", "SCE_17", "SCE_18", "SCE_19", "SCE_20", "SCE_21", "SCE_22", "SCE_23", "PV1CIV", "PV2CIV", "PV3CIV", "PV4CIV", "PV5CIV", "CIVNVL1", "CIVNVL2", "CIVNVL3", "CIVNVL4", "CIVNVL5", "CIVNVLB1", "CIVNVLB2", "CIVNVLB3", "CIVNVLB4", "CIVNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
fce <- read.fwf(unz(temp, "Excale09_2008_Alum_FCE.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
fce <- read.fwf("Excale09_2008_Alum_FCE.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

fce <- read_fwf(unz(temp, "Excale09_2008_Alum_FCE.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
fce <- read_fwf("Excale09_2008_Alum_FCE.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
fce01 <- subset(fce, select = c(NACIONAL:MOD))
fce02 <- subset(fce, select = c(MAGEB05))
fce03 <- subset(fce, select = c(ESTRATO:ID_INSTR))
fce04 <- subset(fce, select = c(SEXO))
fce05 <- subset(fce, select = c(EDAD))
fce06 <- subset(fce, select = c(EDADC:EDADN))
fce07 <- subset(fce, select = c(EDAD_AC:MES_NAC))
fce08 <- subset(fce, select = c(W_ALU))
fce09 <- subset(fce, select = c(DOCENTE))
fce10 <- subset(fce, select = c(SCA_01:SCE_23))
fce11 <- subset(fce, select = c(PV1CIV:W_FSTR80))

fce02[fce02 == "NA"] <- NA
fce04[fce04 > 7] <- NA
fce05[fce05 > 97] <- NA
fce06[fce06 == 9] <- NA
fce07[fce07 > 97] <- NA
fce09[fce09 == 99999] <- NA
fce10[fce10 > 4] <- NA

fce <- cbind(fce01, fce02, fce03, fce04, fce05, fce06, fce07, fce08, fce09, fce10, fce11)
rm(fce01, fce02, fce03, fce04, fce05, fce06, fce07, fce08, fce09, fce10, fce11, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(fce, "excale09-2008-ex-fce.csv")
#Lectura a variable fce
fce <- read.csv("excale09-2008-ex-fce.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(fce, "excale09-2008-ex-fce.csv")
#Lectura a variable fce
fce <- read_csv("excale09-2008-ex-fce.csv")
