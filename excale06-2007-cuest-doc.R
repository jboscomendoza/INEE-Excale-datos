#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes a el Cuestionario de Contexto para Docentes del EXCALE 06 (Sexto de primaria), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_cuest_docentes.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_cuest_docentes.zip", "excale06_2007_cuest_docentes.zip")
unzip("excale06_2007_cuest_docentes.zip", files = "Excale06_2007_Docentes.txt")

#2. Lectura de la base de datos y asignación a la variable doc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 20, 1, 4, 6, 12, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ID_INSTR", "W_DOC", "DOCENTE", "PP001", "PP002", "PP003", "PP004", "PP005", "PP006", "PP007", "PP008", "PP009", "PP010", "PP011", "PP012", "PP013", "PP014", "PP015", "PP016", "PP017", "PP018", "PP019", "PP020", "PP021", "PP022", "PP023", "PP024", "PP025", "PP026", "PP027", "PP028", "PP029", "PP030", "PP031", "PP032", "PP033", "PP034", "PP035", "PP036", "PP037", "PP038", "PP039", "PP040", "PP041", "PP042", "PP043", "PP044", "PP045", "PP046", "PP047", "PP048", "PP049", "PP050", "PP051", "PP052", "PP053", "PP054", "PP055", "PP056", "PP057", "PP058", "EP_01", "EP_02", "EP_03", "EP_04", "EP_05", "EP_06", "EP_07", "EP_08", "EP_09", "EP_10", "EP_11", "EP_12", "EP_13", "MP_01", "MP_02", "MP_03", "MP_04", "MP_05", "MP_06", "MP_07", "MP_08", "MP_09", "MP_10", "MP_11", "MP_12")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
doc <- read.fwf(unz(temp, "Excale06_2007_Docentes.txt"), widths = anchos, col.names = c(nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read.fwf("Excale06_2013_MAT_Esp.TXT", widths = anchos, col.names = c(nombres))

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

doc <- read_fwf(unz(temp, "Excale06_2007_Docentes.txt"), fwf_widths(anchos, c(nombres)))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read_fwf("Excale06_2007_Docentes.txt", widths = anchos, col.names = c(nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
doc01 <- subset(doc, select = c(NACIONAL:DOCENTE))
doc02 <- subset(doc, select = c(PP001:MP_12))

doc02[doc02 > 7] <- NA

doc <- cbind(doc01, doc02)
rm(doc01, doc02, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale06_2007_doc.csv")
#Lectura a variable doc
doc <- read.csv("excale06_2007_doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(doc, "excale06_2007_doc.csv")
#Lectura a variable doc
doc <- read_csv("excale06_2007_doc.csv")
