#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Geografia del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_geog.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_alum_geog.zip", "excale03_2006_alum_geog.zip")
unzip("excale03_2006_alum_geog.zip", files = "Excale03_2006_Alum_Geog.TXT")

#2. Lectura de la base de datos y asignación a la variable geo
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 6, 16, 1, 5, 1, 16, 3, 1, 2, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 16, 16, 16, 16, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PGA_01", "PGA_02", "PGA_04", "PGA_05", "PGA_06", "PGA_07", "PGA_08", "PGA_09", "PGB_01", "PGB_02", "PGB_03", "PGB_04", "PGB_05", "PGB_06", "PGB_07", "PGB_08", "PGC_01", "PGC_02", "PGC_03", "PGC_04", "PGC_05", "PGC_06", "PGC_07", "PGC_08", "PGD_01", "PGD_02", "PGD_03", "PGD_04", "PGD_05", "PGD_06", "PGD_07", "PGD_08", "PV1GEO", "PV2GEO", "PV3GEO", "PV4GEO", "PV5GEO", "GEONVL1", "GEONVL2", "GEONVL3", "GEONVL4", "GEONVL5", "GEONVLB1", "GEONVLB2", "GEONVLB3", "GEONVLB4", "GEONVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
geo <- read.fwf(unz(temp, "Excale03_2006_Alum_Geog.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
geo <- read.fwf("Excale03_2006_Alum_Geog.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

geo <- read_fwf(unz(temp, "Excale03_2006_Alum_Geog.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
geo <- read_fwf("Excale03_2006_Alum_Geog.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
geo01 <- subset(geo, select = c(NACIONAL:ENTEST))
geo02 <- subset(geo, select = c(ENTESTDOM))
geo03 <- subset(geo, select = c(ALUMNO:ID_INSTR))
geo04 <- subset(geo, select = c(SEXO))
geo05 <- subset(geo, select = c(EDAD))
geo06 <- subset(geo, select = c(EDADC))
geo07 <- subset(geo, select = c(EDAD1SEP))
geo08 <- subset(geo, select = c(EDAD1SEPC:EDADN))
geo09 <- subset(geo, select = c(EDAD_AC:MES_NAC))
geo10 <- subset(geo, select = c(W_ALU))
geo11 <- subset(geo, select = c(DOCENTE))
geo12 <- subset(geo, select = c(PGA_01:PGD_08))
geo13 <- subset(geo, select = c(PV1GEO:W_FSTR80))

geo02[geo02 == "999999"] <- NA
geo04[geo04 > 7] <- NA
geo05[geo05 == 99] <- NA
geo06[geo06 == 9] <- NA
geo07[geo07 == 99] <- NA
geo08[geo08 == 9] <- NA
geo09[geo09 > 97] <- NA
geo11[geo11 == 99999] <- NA
geo12[geo12 > 4] <- NA

geo <- cbind(geo01, geo02, geo03, geo04, geo05, geo06, geo07, geo08, geo09, geo10, geo11, geo12, geo13)
rm(geo01, geo02, geo03, geo04, geo05, geo06, geo07, geo08, geo09, geo10, geo11, geo12, geo13, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(geo, "excale03_2006_geo.csv")
#Lectura a variable geo
geo <- read.csv("excale03_2006_geo.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(geo, "excale03_2006_geo.csv")
#Lectura a variable geo
geo <- read_csv("excale03_2006_geo.csv")
