#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Ciencias Naturales del EXCALE 03 (Tercero de Primaria), aplicación 2010.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE03_2010/excale03_2010_alum_cn.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE03_2010/excale03_2010_alum_cn.zip", "excale03_2010_alum_cn.zip")
unzip("excale03_2010_alum_cn.zip", "Excale03_2010_Alum_CN.TXT")

#2. Lectura de la base de datos y asignación a la variable c_n
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 7, 6, 6, 16, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PNA_01", "PNA_02", "PNA_03", "PNA_04", "PNA_05", "PNA_06", "PNA_07", "PNA_08", "PNA_10", "PNA_11", "PNA_12", "PNA_13", "PNA_15", "PNB_01", "PNB_02", "PNB_03", "PNB_04", "PNB_05", "PNB_06", "PNB_07", "PNB_08", "PNB_09", "PNB_10", "PNB_11", "PNB_12", "PNB_13", "PNB_14", "PNB_15", "PNC_01", "PNC_03", "PNC_04", "PNC_05", "PNC_06", "PNC_08", "PNC_09", "PNC_10", "PNC_11", "PNC_12", "PNC_13", "PNC_14", "PND_01", "PND_02", "PND_03", "PND_04", "PND_05", "PND_06", "PND_07", "PND_08", "PND_09", "PND_10", "PND_11", "PND_13", "PND_14", "PND_15", "PV1CNA", "PV2CNA", "PV3CNA", "PV4CNA", "PV5CNA", "CNANVL1", "CNANVL2", "CNANVL3", "CNANVL4", "CNANVL5", "CNANVBL1", "CNANVBL2", "CNANVBL3", "CNANVBL4", "CNANVBL5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
c_n <- read.fwf(unz(temp, "Excale03_2010_Alum_CN.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
c_n <- read.fwf("Excale03_2010_Alum_CN.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

c_n <- read_fwf(unz(temp, "Excale03_2010_Alum_CN.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
c_n <- read_fwf("Excale03_2010_Alum_CN.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
c_n01 <- subset(c_n, select = c(NACIONAL:ID_INSTR))
c_n02 <- subset(c_n, select = c(SEXO))
c_n03 <- subset(c_n, select = c(EDAD))
c_n04 <- subset(c_n, select = c(EDADC:EDADN))
c_n05 <- subset(c_n, select = c(EDAD_AC:MES_NAC))
c_n06 <- subset(c_n, select = c(W_ALU))
c_n07 <- subset(c_n, select = c(DOCENTE))
c_n08 <- subset(c_n, select = c(PNA_01:PND_15))
c_n09 <- subset(c_n, select = c(PV1CNA:W_FSTR80))

c_n02[c_n02 > 7] <- NA
c_n03[c_n03 > 97] <- NA
c_n04[c_n04 > 7] <- NA
c_n05[c_n05 > 97] <- NA
c_n07[c_n07 == 99999] <- NA
c_n08[c_n08 > 4] <- NA

c_n <- cbind(c_n01, c_n02, c_n03, c_n04, c_n05, c_n06, c_n07, c_n08, c_n09)
rm(c_n01, c_n02, c_n03, c_n04, c_n05, c_n06, c_n07, c_n08, c_n09, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(c_n, "excale03-2010-ex-c_n.csv")
#Lectura a variable c_n
c_n <- read.csv("excale03-2010-ex-c_n.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(c_n, "excale03-2010-ex-c_n.csv")
#Lectura a variable c_n
c_n <- read_csv("excale03-2010-ex-c_n.csv")
