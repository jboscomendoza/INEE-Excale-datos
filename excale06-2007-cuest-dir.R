#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes a el Cuestionario de Contexto para Directores del EXCALE 06 (Sexto de primaria), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_cuest_directores.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_cuest_directores.zip", "excale06_2007_cuest_directores.zip")
unzip("excale06_2007_cuest_directores.zip", files = "Excale06_2007_Directores.TXT")

#2. Lectura de la base de datos y asignación a la variable dre
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 20, 1, 4, 6, 12, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ID_INSTR", "W_DIR", "DP001", "DP002", "DP003", "DP004", "DP005", "DP006", "DP007", "DP008", "DP009", "DP010", "DP011", "DP012", "DP013", "DP014", "DP015", "DP016", "DP017", "DP018", "DP019", "DP020", "DP021", "DP022", "DP023", "DP024", "DP025", "DP026", "DP027", "DP028", "DP029", "DP030", "DP031", "DP032", "DP033", "DP034", "DP035", "DP036", "DP037", "DP038", "DP039", "DP040", "DP041", "DP042", "DP043", "DP044", "DP045", "DP046", "DP047", "DP048", "DP049", "DP050", "DP051", "DP052")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
dre <- read.fwf(unz(temp, "Excale06_2007_Directores.TXT"), widths = anchos, col.names = c(nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read.fwf("Excale06_2007_Directores.TXT", widths = anchos, col.names = c(nombres))

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

dre <- read_fwf(unz(temp, "Excale06_2007_Directores.TXT"), fwf_widths(anchos, c(nombres)))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read_fwf("Excale06_2007_Directores.TXT", widths = anchos, col.names = c(nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
dre01 <- subset(dre, select = c(NACIONAL:W_DIR))
dre02 <- subset(dre, select = c(DP001:DP052))

dre02[dre02 > 7] <- NA

dre <- cbind(dre01, dre02)
rm(dre01, dre02, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(dre, "excale06_2007_dre.csv")
#Lectura a variable dre
dre <- read.csv("excale06_2007_dre.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(dre, "excale06_2007_dre.csv")
#Lectura a variable dre
dre <- read_csv("excale06_2007_dre.csv")
