#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Formación Cívica y Ética del EXCALE 06, aplicación 2013.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_FCE.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_FCE.zip", "Excale06_2013_Alum_FCE.zip")
unzip("Excale06_2013_Alum_FCE.zip", files = "Excale06_2013_Alum_FCE.TXT")

#2. Lectura de la base de datos y asignación a la variable fce
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 5, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCA_07", "PCA_08", "PCA_09", "PCA_10", "PCA_11", "PCA_12", "PCA_13", "PCA_14", "PCA_15", "PCA_16", "PCA_17", "PCA_18", "PCB_01", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCB_08", "PCB_09", "PCB_10", "PCB_11", "PCB_12", "PCB_13", "PCB_14", "PCB_15", "PCB_16", "PCB_17", "PCC_01", "PCC_02", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCC_08", "PCC_09", "PCC_10", "PCC_11", "PCC_12", "PCC_13", "PCC_14", "PCC_15", "PCC_16", "PCC_17", "PCC_18", "PCD_01", "PCD_02", "PCD_03", "PCD_04", "PCD_05", "PCD_06", "PCD_07", "PCD_08", "PCD_09", "PCD_10", "PCD_11", "PCD_12", "PCD_13", "PCD_14", "PCD_15", "PCD_16", "PCD_17", "PCD_18", "PCE_01", "PCE_02", "PCE_03", "PCE_04", "PCE_05", "PCE_06", "PCE_07", "PCE_08", "PCE_09", "PCE_10", "PCE_11", "PCE_12", "PCE_13", "PCE_14", "PCE_15", "PCE_16", "PCE_17", "PCF_01", "PCF_02", "PCF_03", "PCF_04", "PCF_05", "PCF_06", "PCF_07", "PCF_08", "PCF_09", "PCF_10", "PCF_11", "PCF_12", "PCF_13", "PCF_14", "PCF_15", "PCF_16", "PCF_17", "PCF_18", "PV1FCE", "PV2FCE", "PV3FCE", "PV4FCE", "PV5FCE", "FCENVL1", "FCENVL2", "FCENVL3", "FCENVL4", "FCENVL5", "FCENVBL1", "FCENVBL2", "FCENVBL3", "FCENVBL4", "FCENVBL5", "FCENVML1", "FCENVML2", "FCENVML3", "FCENVML4", "FCENVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
fce <- read.fwf(unz(temp, "Excale06_2013_Alum_FCE.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar
fce <- read.fwf("Excale06_2013_Alum_FCE.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)
fce <- read_fwf(unz(temp, "Excale06_2013_Alum_FCE.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar
fce <- read_fwf("Excale06_2013_Alum_FCE.TXT", widths = anchos, col.names = nombres)

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
fce01 <- subset(fce, select = c(NACIONAL:ESTRATO))
fce02 <- subset(fce, select = c(ENTEST))
fce03 <- subset(fce, select = c(ALUMNO:ID_INSTR))
fce04 <- subset(fce, select = c(SEXO))
fce05 <- subset(fce, select = c(EDAD_AC:EDAD))
fce06 <- subset(fce, select = c(EDAD_ACC:EDAD_EES))
fce07 <- subset(fce, select = c(W_ALU))
fce08 <- subset(fce, select = c(DOCENTE))
fce09 <- subset(fce, select = c(PCA_01:PCF_18))
fce10 <- subset(fce, select = c(PV1FCE:W_FSTR100))

fce02[fce02 == "999"] <- NA
fce04[fce04 > 7] <- NA
fce05[fce05 > 97] <- NA
fce06[fce06 > 7] <- NA
fce08[fce08 == 99999] <- NA
fce09[fce09 > 4] <- NA

fce <- cbind(fce01, fce02, fce03, fce04, fce05, fce06, fce07, fce08, fce09, fce10)
rm(fce01, fce02, fce03, fce04, fce05, fce06, fce07, fce08, fce09, fce10, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(fce, "excale06_2013_fce.csv")
#Lectura a variable fce
fce <- read.csv("excale06_2013_fce.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(fce, "excale06_2013_fce.csv")
#Lectura a variable fce
fce <- read_csv("excale06_2013_fce.csv")
