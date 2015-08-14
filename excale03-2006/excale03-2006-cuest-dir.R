#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondiente al Cuestionario de Contexto para Directores del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_dir_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_dir_cuest.zip", "excale03_2006_dir_cuest.zip")
unzip("excale03_2006_dir_cuest.zip", files = "Excale03_2006_Dir_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable dre
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 12, 1, 2, 16, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ID_INSTR", "SEXO", "EDAD", "W_DIR", "DP001", "DP002", "DP003", "DP004", "DP005", "DP006", "DP007", "DP008", "DP009", "DP010", "DP011", "DP012", "DP013", "DP014", "DP015", "DP016", "DP017", "DP018", "DP019", "DP020", "DP021", "DP022", "DP023", "DP024", "DP025", "DP026", "DP027", "DP028", "DP029", "DP030", "DP031", "DP032", "DP033", "DP034", "DP035", "DP036", "DP037", "DP038", "DP039", "DP040", "DP041", "DP042", "DP043", "DP044", "DP045", "DP046", "DP047", "DP048", "DP049", "DP050", "DP051", "DP052", "DP053", "DP054", "DP055", "DP056", "DP057", "DP058", "DP059", "DP060", "DP061", "DP062", "DP063", "DP064", "DP065", "DP066", "DP067", "DP068", "DP069", "DP070", "DP071", "DP072", "DP073", "DP074", "DP075", "DP076", "DP077", "DP078", "DP079", "DP080", "DP081", "DP082", "DP083", "DP084", "DP085", "DP086", "DP087", "DP088", "DP089", "DP090", "DP091", "DP092", "DP093", "DP094", "DP095", "DP096", "DP097", "DP098", "DP099", "DP100", "DP101", "DP102", "DP103", "DP104", "DP105", "DP106", "DP107", "DP108", "DP109", "DP110", "DP111", "DP112", "DP113", "DP114", "DP115", "DP116", "DP117", "DP118", "DP119", "DP120", "DP121", "DP122", "DP123", "DP124", "DP125", "DP126", "DP127", "DP128", "DP129", "DP130", "DP131", "DP132", "DP133", "DP134", "DP135", "DP136", "DP137", "DP138", "DP139", "DP140", "DP141", "DP142", "DP143", "DP144", "DP145", "DP146", "DP147", "DP148", "DP149", "DP150", "DP151", "DP152", "DP153")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
dre <- read.fwf(unz(temp, "Excale03_2006_Dir_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read.fwf("Excale03_2006_Dir_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

dre <- read_fwf(unz(temp, "Excale03_2006_Dir_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read_fwf("Excale03_2006_Dir_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
dre01 <- subset(dre, select = c(NACIONAL:ENTEST))
dre02 <- subset(dre, select = c(ENTESTDOM))
dre03 <- subset(dre, select = c(ID_INSTR))
dre04 <- subset(dre, select = c(SEXO))
dre05 <- subset(dre, select = c(EDAD))
dre06 <- subset(dre, select = c(W_DIR))
dre07 <- subset(dre, select = c(DP001:DP026))
dre08 <- subset(dre, select = c(DP027:DP030))
dre09 <- subset(dre, select = c(DP031:DP048))
dre10 <- subset(dre, select = c(DP049))
dre11 <- subset(dre, select = c(DP050:DP077))
dre12 <- subset(dre, select = c(DP078:DP079))
dre13 <- subset(dre, select = c(DP080:DP115))
dre14 <- subset(dre, select = c(DP116:DP121))
dre15 <- subset(dre, select = c(DP122:DP126))
dre16 <- subset(dre, select = c(DP127))
dre17 <- subset(dre, select = c(DP128))
dre18 <- subset(dre, select = c(DP129))
dre19 <- subset(dre, select = c(DP130:DP153))

dre02[dre02 == "999999"] <- NA
dre04[dre04 > 7] <- NA
dre05[dre05 > 97] <- NA
dre07[dre07 > 7] <- NA
dre08[dre08 > 97] <- NA
dre09[dre09 > 7] <- NA
dre10[dre10 > 997] <- NA
dre11[dre11 > 7] <- NA
dre12[dre12 > 97] <- NA
dre13[dre13 > 7] <- NA
dre14[dre14 > 97] <- NA
dre15[dre15 > 7] <- NA
dre16[dre16 > 97] <- NA
dre17[dre17 > 7] <- NA
dre18[dre18 > 97] <- NA
dre19[dre19 > 7] <- NA

dre <- cbind(dre01, dre02, dre03, dre04, dre05, dre06, dre07, dre08, dre09, dre10, dre11, dre12, dre13, dre14, dre15, dre16, dre17, dre18, dre19)
rm(dre01, dre02, dre03, dre04, dre05, dre06, dre07, dre08, dre09, dre10, dre11, dre12, dre13, dre14, dre15, dre16, dre17, dre18, dre19, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(dre, "excale03_2006_doc.csv")
#Lectura a variable dre
dre <- read.csv("excale03_2006_doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(dre, "excale03_2006_doc.csv")
#Lectura a variable dre
dre <- read_csv("excale03_2006_doc.csv")
