#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Matemáticas del EXCALE 06, aplicación 2013.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Mat.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Mat.zip", "Excale06_2013_Alum_Mat.zip")
unzip("Excale06_2013_Alum_Mat.zip", files = "Excale06_2013_Alum_MAT.TXT")

#2. Lectura de la base de datos y asignación a la variable mat
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 5, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PMA_01", "PMA_02", "PMA_03", "PMA_04", "PMA_05", "PMA_06", "PMA_07", "PMA_08", "PMA_09", "PMA_10", "PMA_11", "PMA_12", "PMB_01", "PMB_02", "PMB_03", "PMB_04", "PMB_05", "PMB_06", "PMB_07", "PMB_08", "PMB_09", "PMB_10", "PMB_11", "PMB_12", "PMC_01", "PMC_02", "PMC_03", "PMC_04", "PMC_05", "PMC_06", "PMC_07", "PMC_08", "PMC_09", "PMC_10", "PMC_11", "PMC_12", "PMD_01", "PMD_02", "PMD_03", "PMD_04", "PMD_05", "PMD_06", "PMD_07", "PMD_08", "PMD_09", "PMD_10", "PMD_11", "PMD_12", "PME_01", "PME_02", "PME_03", "PME_04", "PME_05", "PME_06", "PME_07", "PME_08", "PME_09", "PME_10", "PME_11", "PME_12", "PME_13", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "MATNVBL1", "MATNVBL2", "MATNVBL3", "MATNVBL4", "MATNVBL5", "MATNVML1", "MATNVML2", "MATNVML3", "MATNVML4", "MATNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
#El agumento skip = 1 se incluye porque la primera línea con datos presenta errores que la hacen ilegible.
mat <- read.fwf(unz(temp, "Excale06_2013_Alum_MAT.TXT"), widths = anchos, col.names = nombres, skip = 1)
#Si se ha descargado la base de datos al directorio de trabajo usar
mat <- read.fwf("Excale06_2013_MAT_Esp.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al matacio de trabajo
install.packages("readr")
library(readr)

#El agumento skip = 1 se incluye porque la primera línea con datos presenta errores que la hacen ilegible.
mat <- read_fwf(unz(temp, "Excale06_2013_Alum_MAT.TXT"), fwf_widths(anchos, nombres), skip = 1)
#Si se ha descargado la base de datos al directorio de trabajo usar
esp <- read_fwf("Excale06_2013_Alum_MAT.TXT", widths = anchos, col.names = nombres)

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
mat01 <- subset(mat, select = c(NACIONAL:ESTRATO))
mat02 <- subset(mat, select = c(ENTEST))
mat03 <- subset(mat, select = c(ALUMNO:ID_INSTR))
mat04 <- subset(mat, select = c(SEXO))
mat05 <- subset(mat, select = c(EDAD_AC:EDAD))
mat06 <- subset(mat, select = c(EDAD_ACC:EDAD_EES))
mat07 <- subset(mat, select = c(W_ALU))
mat08 <- subset(mat, select = c(DOCENTE))
mat09 <- subset(mat, select = c(PMA_01:PME_13))
mat10 <- subset(mat, select = c(PV1MAT:W_FSTR100))

mat02[mat02 == "999"] <- NA
mat04[mat04 > 7] <- NA
mat05[mat05 > 97] <- NA
mat06[mat06 > 7] <- NA
mat08[mat08 == 99999] <- NA
mat09[mat09 > 4] <- NA

mat <- cbind(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10)
rm(mat01, mat02, mat03, mat04, mat05, mat06, mat07, mat08, mat09, mat10, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(mat, "excale06_2013_mat.csv")
#Lectura a variable mat
mat <- read.csv("excale06_2013_mat.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(mat, "excale06_2013_mat.csv")
#Lectura a variable mat
mat <- read_csv("excale06_2013_mat.csv")
