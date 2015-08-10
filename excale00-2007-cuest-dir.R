#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Directores del EXCALE 00 (Tercero de Preescolar), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_dir_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_dir_cuest.zip", "excale00_2007_dir_cuest.zip")
unzip("excale00_2007_dir_cuest.zip", files = "Excale00_2007_Dir_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable dre
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 19, 1, 4, 6, 15, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ID_INSTR", "W_DIR", "DE001", "DE002", "DE003", "DE004", "DE005", "DE006", "DE007", "DE008", "DE009", "DE010", "DE011", "DE012", "DE013", "DE014", "DE015", "DE016", "DE017", "DE018", "DE019", "DE020", "DE021", "DE022", "DE023", "DE024", "DE025", "DE026_01", "DE026_02", "DE027_01", "DE027_02", "DE028", "DE029", "DE030", "DE031", "DE032", "DE033", "DE034", "DE035", "DE036", "DE037", "DE038", "DE039", "DE040", "DE041", "DE042")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
dre <- read.fwf(unz(temp, "Excale00_2007_Dir_Cuest.TXT"), widths = anchos, col.names = c(nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read.fwf("Excale00_2007_Dir_Cuest.TXT", widths = anchos, col.names = c(nombres))

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

dre <- read_fwf(unz(temp, "Excale00_2007_Dir_Cuest.TXT"), fwf_widths(anchos, c(nombres)))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read_fwf("Excale00_2007_Dir_Cuest.TXT", widths = anchos, col.names = c(nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
dre01 <- subset(dre, select = c(NACIONAL:W_DIR))
dre02 <- subset(dre, select = c(DE001:DE025))
dre03 <- subset(dre, select = c(DE026_01:DE027_02))
dre04 <- subset(dre, select = c(DE028:DE042))

dre02[dre02 > 7] <- NA
dre03[dre03 > 97] <- NA
dre04[dre04 > 7] <- NA

dre <- cbind(dre01, dre02, dre03, dre04)
rm(dre01, dre02, dre03, dre04, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(dre, "excale00_2007_dre.csv")
#Lectura a variable dre
dre <- read.csv("excale00_2007_dre.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(dre, "excale00_2007_dre.csv")
#Lectura a variable dre
dre <- read_csv("excale00_2007_dre.csv")
