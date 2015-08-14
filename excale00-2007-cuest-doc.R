#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Docentes del EXCALE 00 (Tercero de Preescolar), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_doc_cuest2.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_Pree3/excale00_2007_doc_cuest2.zip", "excale00_2007_doc_cuest2.zip")
unzip("excale00_2007_doc_cuest2.zip", files = "Excale00_2007_Doc_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable doc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 19, 1, 4, 6, 15, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ID_INSTR", "W_DOC", "DOCENTE", "PE001", "PE002", "PE003", "PE004", "PE005", "PE006", "PE007", "PE008", "PE009", "PE010", "PE011", "PE012", "PE013", "PE014", "PE015", "PE016", "PE017", "PE018", "PE019", "PE020", "PE021", "PE022", "PE023", "PE024", "PE025", "PE026", "PE027", "PE028", "PE029", "PE030", "PE031", "PE032", "PE033", "PE034", "PE035", "PE036", "PE037", "PE038", "PE039", "PE040", "PE041", "PE042", "PE043", "PE044", "PE045", "PE046", "PE047", "PE048", "PE049", "PE050", "PE051", "PE052", "PE053", "PE054", "PE055", "PE056", "PE057", "PE058", "PE059", "PE060")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
doc <- read.fwf(unz(temp, "Excale00_2007_Doc_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read.fwf("Excale00_2007_Doc_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

doc <- read_fwf(unz(temp, "Excale00_2007_Doc_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read_fwf("Excale00_2007_Doc_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
doc01 <- subset(doc, select = c(NACIONAL:DOCENTE))
doc02 <- subset(doc, select = c(PE001:PE060))

doc02[doc02 > 7] <- NA

doc <- cbind(doc01, doc02)
rm(doc01, doc02, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale00_2007_doc.csv")
#Lectura a variable doc
doc <- read.csv("excale00_2007_doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(doc, "excale00_2007_doc.csv")
#Lectura a variable doc
doc <- read_csv("excale00_2007_doc.csv")
