#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Historia del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_hist.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_hist.zip", "excale03_2006_alum_hist.zip")
unzip("excale03_2006_alum_hist.zip", files = "Excale03_2006_Alum_Hist.TXT")

#2. Lectura de la base de datos y asignación a la variable his
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 6, 16, 1, 5, 1, 16, 3, 1, 2, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PHA_01", "PHA_02", "PHA_03", "PHA_04", "PHA_05", "PHA_06", "PHA_07", "PHA_08", "PHB_01", "PHB_02", "PHB_03", "PHB_04", "PHB_05", "PHB_06", "PHB_07", "PHB_08", "PHC_01", "PHC_02", "PHC_03", "PHC_04", "PHC_05", "PHC_06", "PHC_07", "PHD_01", "PHD_02", "PHD_03", "PHD_04", "PHD_05", "PHD_06", "PHD_07", "PHE_01", "PHE_02", "PHE_03", "PHE_04", "PHE_05", "PHE_06", "PHE_07", "PHF_01", "PHF_02", "PHF_03", "PHF_04", "PHF_05", "PHF_06", "PHF_08", "PHG_01", "PHG_02", "PHG_03", "PHG_04", "PHG_05", "PHG_06", "PHG_07", "PHG_08", "PV1HIS", "PV2HIS", "PV3HIS", "PV4HIS", "PV5HIS", "HISNVL1", "HISNVL2", "HISNVL3", "HISNVL4", "HISNVL5", "HISNVLB1", "HISNVLB2", "HISNVLB3", "HISNVLB4", "HISNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
his <- read.fwf(unz(temp, "Excale03_2006_Alum_Hist.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
his <- read.fwf("Excale03_2006_Alum_Hist.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

his <- read_fwf(unz(temp, "Excale03_2006_Alum_Hist.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
his <- read_fwf("Excale03_2006_Alum_Hist.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
his01 <- subset(his, select = c(NACIONAL:ENTEST))
his02 <- subset(his, select = c(ENTESTDOM))
his03 <- subset(his, select = c(ALUMNO:ID_INSTR))
his04 <- subset(his, select = c(SEXO))
his05 <- subset(his, select = c(EDAD))
his06 <- subset(his, select = c(EDADC))
his07 <- subset(his, select = c(EDAD1SEP))
his08 <- subset(his, select = c(EDAD1SEPC:EDADN))
his09 <- subset(his, select = c(EDAD_AC:MES_NAC))
his10 <- subset(his, select = c(W_ALU))
his11 <- subset(his, select = c(DOCENTE))
his12 <- subset(his, select = c(PHA_01:PHG_08))
his13 <- subset(his, select = c(PV1HIS:W_FSTR80))

his02[his02 == "999999"] <- NA
his04[his04 > 7] <- NA
his05[his05 == 99] <- NA
his06[his06 == 9] <- NA
his07[his07 == 99] <- NA
his08[his08 == 9] <- NA
his09[his09 > 97] <- NA
his11[his11 == 99999] <- NA
his12[his12 > 4] <- NA

his <- cbind(his01, his02, his03, his04, his05, his06, his07, his08, his09, his10, his11, his12, his13)
rm(his01, his02, his03, his04, his05, his06, his07, his08, his09, his10, his11, his12, his13, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(his, "excale03_2006_his.csv")
#Lectura a variable his
his <- read.csv("excale03_2006_his.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(his, "excale03_2006_his.csv")
#Lectura a variable his
his <- read_csv("excale03_2006_his.csv")
