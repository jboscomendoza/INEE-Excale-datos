#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXALE de Ciencias Naturales del EXCALE 06, aplicación 2013.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_CN.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_CN.zip", "Excale06_2013_Alum_CN.zip")
unzip("Excale06_2013_Alum_CN.zip", files = "Excale06_2013_Alum_CN.TXT")

#2. Lectura de la base de datos y asignación a la variable c_n
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 6, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PNA_01", "PNA_02", "PNA_03", "PNA_04", "PNA_05", "PNA_06", "PNA_07", "PNA_08", "PNA_09", "PNA_10", "PNA_11", "PNA_12", "PNA_13", "PNA_14", "PNA_15", "PNA_16", "PNB_01", "PNB_02", "PNB_03", "PNB_04", "PNB_05", "PNB_06", "PNB_07", "PNB_08", "PNB_09", "PNB_10", "PNB_11", "PNB_12", "PNB_13", "PNB_14", "PNB_15", "PNB_16", "PNB_17", "PNC_01", "PNC_02", "PNC_03", "PNC_04", "PNC_05", "PNC_06", "PNC_07", "PNC_08", "PNC_09", "PNC_10", "PNC_11", "PNC_12", "PNC_13", "PNC_14", "PNC_15", "PNC_16", "PV1CN", "PV2CN", "PV3CN", "PV4CN", "PV5CN", "CNNVL1", "CNNVL2", "CNNVL3", "CNNVL4", "CNNVL5", "CNNVBL1", "CNNVBL2", "CNNVBL3", "CNNVBL4", "CNNVBL5", "CNNVML1", "CNNVML2", "CNNVML3", "CNNVML4", "CNNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
c_n <- read.fwf(unz(temp, "Excale06_2013_Alum_CN.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar
c_n <- read.fwf("Excale06_2013_Alum_CN.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al c_nacio de trabajo
install.packages("readr")
library(readr)
c_n <- read_fwf(unz(temp, "Excale06_2013_Alum_CN.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar
c_n <- read_fwf("Excale06_2013_Alum_CN.TXT", widths = anchos, col.names = nombres)

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
c_n01 <- subset(c_n, select = c(NACIONAL:ESTRATO))
c_n02 <- subset(c_n, select = c(ENTEST))
c_n03 <- subset(c_n, select = c(ALUMNO:ID_INSTR))
c_n04 <- subset(c_n, select = c(SEXO))
c_n05 <- subset(c_n, select = c(EDAD_AC:EDAD))
c_n06 <- subset(c_n, select = c(EDAD_ACC:EDAD_EES))
c_n07 <- subset(c_n, select = c(W_ALU))
c_n08 <- subset(c_n, select = c(DOCENTE))
c_n09 <- subset(c_n, select = c(PNA_01:PNC_16))
c_n10 <- subset(c_n, select = c(PV1CN:W_FSTR100))

c_n02[c_n02 == "999"] <- NA
c_n04[c_n04 > 7] <- NA
c_n05[c_n05 > 97] <- NA
c_n06[c_n06 > 7] <- NA
c_n08[c_n08 == 99999] <- NA
c_n09[c_n09 > 4] <- NA

c_n <- cbind(c_n01, c_n02, c_n03, c_n04, c_n05, c_n06, c_n07, c_n08, c_n09, c_n10)
rm(c_n01, c_n02, c_n03, c_n04, c_n05, c_n06, c_n07, c_n08, c_n09, c_n10, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una posterior lectura más sencillo de la base de datos, aunque incrementa considerablemente su tamaño de archivo.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(c_n, "excale06_2013_c_n.csv")
#Lectura a variable c_n
c_n <- read.csv("excale06_2013_c_n.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(c_n, "excale06_2013_c_n.csv")
#Lectura a variable c_n
c_n <- read_csv("excale06_2013_c_n.csv")
