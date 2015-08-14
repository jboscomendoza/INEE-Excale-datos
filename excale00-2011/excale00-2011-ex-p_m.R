#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Pensamiento Matemático del EXCALE 00 (Tercero de Preescolar), aplicación 2011.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE00_2011/excale00_2011_alum_pm.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE00_2011/excale00_2011_alum_pm.zip", "excale00_2011_alum_pm.zip")
unzip("excale00_2011_alum_pm.zip", "Excale00_2011_Alum_PM.TXT")

#2. Lectura de la base de datos y asignación a la variable p_m
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 6, 5, 15, 1, 10, 11, 1, 1, 2, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 11, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "FECHA_NAC", "EDAD", "EDADC", "EDADN", "EDAD_AC", "W_ALU", "EMA_01", "EMA_02", "EMA_03", "EMA_04", "EMA_05", "EMA_06", "EMA_07", "EMA_08", "EMA_09", "EMA_10", "EMA_11", "EMA_12", "EMA_13", "EMA_14", "EMB_01", "EMB_02", "EMB_03", "EMB_04", "EMB_05_01", "EMB_05_02", "EMB_05_03", "EMB_05_04", "EMB_05_05", "EMB_06", "EMB_07", "EMB_08_02", "EMB_08_03", "EMB_08_04", "EMB_09", "EMB_10", "EMB_11", "EMB_12", "EMB_13", "EMC_01", "EMC_02", "EMC_03", "EMC_04", "EMC_05", "EMC_06", "EMC_07", "EMC_08", "EMC_09", "EMC_10", "EMC_11", "EMC_12", "EMC_13", "EMC_14", "EMD_01", "EMD_02", "EMD_03", "EMD_04", "EMD_05_01", "EMD_05_02", "EMD_05_03", "EMD_05_04", "EMD_06", "EMD_07", "EMD_08", "EMD_09", "EMD_10", "EMD_11", "EMD_12", "EMD_13", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "MATNVLB1", "MATNVLB2", "MATNVLB3", "MATNVLB4", "MATNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
p_m <- read.fwf(unz(temp, "Excale00_2011_Alum_PM.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
p_m <- read.fwf("Excale00_2011_Alum_PM.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

p_m <- read_fwf(unz(temp, "Excale00_2011_Alum_PM.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
p_m <- read_fwf("Excale00_2011_Alum_PM.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
p_m01 <- subset(p_m, select = c(NACIONAL:ID_INSTR))
p_m02 <- subset(p_m, select = c(SEXO))
p_m03 <- subset(p_m, select = c(FECHA_NAC))
p_m04 <- subset(p_m, select = c(EDAD))
p_m05 <- subset(p_m, select = c(EDADC:EDADN))
p_m06 <- subset(p_m, select = c(EDAD_AC))
p_m07 <- subset(p_m, select = c(W_ALU))
p_m08 <- subset(p_m, select = c(EMA_01:EMD_13))
p_m09 <- subset(p_m, select = c(PV1MAT:W_FSTR80))

p_m02[p_m02 > 7] <- NA
p_m04[p_m04 > 97] <- NA
p_m05[p_m05 > 7] <- NA
p_m06[p_m06 > 97] <- NA
p_m08[p_m08 > 4] <- NA

p_m <- cbind(p_m01, p_m02, p_m03, p_m04, p_m05, p_m06, p_m07, p_m08, p_m09)
rm(p_m01, p_m02, p_m03, p_m04, p_m05, p_m06, p_m07, p_m08, p_m09, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(p_m, "excale00_2011_ex-p_m.csv")
#Lectura a variable p_m
p_m <- read.csv("excale00_2011_ex-p_m.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(p_m, "excale00_2011_ex-p_m.csv")
#Lectura a variable p_m
p_m <- read_csv("excale00_2011_ex-p_m.csv")
