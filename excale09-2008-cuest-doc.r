#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Docentes del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_doc_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_doc_cuest.zip", "excale09_2008_doc_cuest.zip")
unzip("excale09_2008_doc_cuest.zip", "Excale09_2008_Doc_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable doc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 6, 12, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ENTEST", "ID_INSTR", "DOCENTE", "PS001", "PS002", "PS003", "PS004", "PS005", "PS006", "PS007", "PS008", "PS009", "PS010", "PS011", "PS012", "PS013", "PS014", "PS015", "PS016", "PS017", "PS018", "PS019", "PS020", "PS021", "PS022", "PS023", "PS024", "PS025", "PS026", "PS027", "PS028", "PS029", "PS030", "PS031", "PS032", "PS033", "PS034", "PS035", "PS036", "PS037", "PS038", "PS039", "PS040", "PS041", "PS042", "PS043", "PS044", "PS045", "PS046", "PS047", "PS048", "PS049", "PS050", "PS051", "PS052", "PS053", "PS054", "PS055", "PS056", "PS057", "PS058", "PS059", "PS060", "PS061", "PS062", "PS063", "PS064", "PS065", "PS066", "PS067", "PS068", "PS069", "PS070", "PS071", "PS072", "PS073", "PS074", "PS075", "PS076", "PS077", "PS078", "PS079", "PS080", "PS081", "PS082", "PS083", "PS084", "PS085", "PS086", "PS087", "PS088", "PS089", "PS090", "PS091", "PS092", "PS093")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
doc <- read.fwf(unz(temp, "Excale09_2008_Doc_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read.fwf("Excale09_2008_Doc_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

doc <- read_fwf(unz(temp, "Excale09_2008_Doc_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read_fwf("Excale09_2008_Doc_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
doc01 <- subset(doc, select = c(NACIONAL:DOCENTE))
doc02 <- subset(doc, select = c(PS001:PS093))

doc02[doc02 > 7] <- NA

doc <- cbind(doc01, doc02)
rm(doc01, doc02, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale09-2008-cuest-doc.csv")
#Lectura a variable doc
doc <- read.csv("excale09-2008-cuest-doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(doc, "excale09-2008-cuest-doc.csv")
#Lectura a variable doc
doc <- read_csv("excale09-2008-cuest-doc.csv")
