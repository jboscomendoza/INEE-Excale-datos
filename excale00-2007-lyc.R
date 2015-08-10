#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Lenguaje y Comunicación del EXCALE 00 (Tercero de Preescolar), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_alum_lc.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_alum_lc.zip", "excale00_2007_alum_lc.zip")
unzip("excale00_2007_alum_lc.zip", files = "Excale00_2007_Alum_LC.TXT")

#2. Lectura de la base de datos y asignación a la variable lyc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 19, 1, 4, 6, 5, 15, 1, 11, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 11, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "ELA_01", "ELA_02", "ELA_03", "ELA_04", "ELA_05", "ELA_06", "ELA_07", "ELA_08", "ELA_09", "ELB_01", "ELB_02", "ELB_03", "ELB_04", "ELB_05", "ELB_06", "ELB_07", "ELB_08", "ELB_09", "ELC_01", "ELC_02", "ELC_03", "ELC_04", "ELC_05", "ELC_06", "ELC_07", "ELC_08", "ELC_09", "ELD_01", "ELD_02", "ELD_03", "ELD_04", "ELD_05", "ELD_06", "ELD_07", "ELD_08", "ELD_09", "ELD_10", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVLB1", "ESPNVLB2", "ESPNVLB3", "ESPNVLB4", "ESPNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
lyc <- read.fwf(unz(temp, "Excale00_2007_Alum_LC.TXT"), widths = anchos, col.names = c(nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
lyc <- read.fwf("Excale00_2007_Alum_LC.TXT", widths = anchos, col.names = c(nombres))

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

lyc <- read_fwf(unz(temp, "Excale00_2007_Alum_LC.TXT"), fwf_widths(anchos, c(nombres)))
#Si se ha descargado la base de datos al directorio de trabajo usar:
lyc <- read_fwf("Excale00_2007_Alum_LC.TXT", widths = anchos, col.names = c(nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
lyc01 <- subset(lyc, select = c(NACIONAL:ID_INSTR))
lyc02 <- subset(lyc, select = c(SEXO))
lyc03 <- subset(lyc, select = c(EDAD))
lyc04 <- subset(lyc, select = c(EDADC))
lyc05 <- subset(lyc, select = c(EDAD1SEP))
lyc06 <- subset(lyc, select = c(EDAD1SEPC:EDADN))
lyc07 <- subset(lyc, select = c(EDAD_AC:MES_NAC))
lyc08 <- subset(lyc, select = c(W_ALU))
lyc09 <- subset(lyc, select = c(DOCENTE))
lyc10 <- subset(lyc, select = c(ELA_01:ELD_10))
lyc11 <- subset(lyc, select = c(WVARSTRR:W_FSTR80))

lyc02[lyc02 > 7] <- NA
lyc03[lyc03 == 99] <- NA
lyc04[lyc04 == 9] <- NA
lyc05[lyc05 == 99] <- NA
lyc06[lyc06 == 9] <- NA
lyc07[lyc07 > 97] <- NA
lyc09[lyc09 == 99999] <- NA
lyc10[lyc10 > 4] <- NA


lyc <- cbind(lyc01, lyc02, lyc03, lyc04, lyc05, lyc06, lyc07, lyc08, lyc09, lyc10, lyc11)
rm(lyc01, lyc02, lyc03, lyc04, lyc05, lyc06, lyc07, lyc08, lyc09, lyc10, lyc11, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(lyc, "excale00_2007_lyc.csv")
#Lectura a variable lyc
lyc <- read.csv("excale00_2007_lyc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(lyc, "excale00_2007_lyc.csv")
#Lectura a variable lyc
lyc <- read_csv("excale00_2007_lyc.csv")
