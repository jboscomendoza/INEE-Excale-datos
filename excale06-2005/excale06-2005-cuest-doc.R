#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondiente al Cuestionario de Contexto para Docentes del EXCALE 06 (Sexto de Primaria), aplicación 2005.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2005_P6/excale06_2005_docentes.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2005_P6/excale06_2005_docentes.zip", "excale06_2005_docentes.zip")
unzip("excale06_2005_docentes.zip", files = "Excale06_2005_Docentes.sav")

#2. Lectura de la base de datos y asignación a la variable doc

#2.1 Lectura
#Procedimiento 1. Usando la librería foreign, incluida en la instalación estándar de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.spss() de foreign es lenta, comparada con otros métodos, en particular en equipos de cómputo poco poderosos.

doc <- read.spss(unzip(temp, "Excale06_2005_Docentes.sav"), use.value.labels = FALSE, to.data.frame = TRUE)
#Si se ha descargado la base de datos al directorio de trabajo, usar:
doc <- read.spss("Excale06_2005_Docentes.sav", use.value.labels = FALSE, to.data.frame = TRUE)

#Procedimiento 2. Usando la librería rio
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería rio, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion import de rio es relativamente rápida, comparada con la función read.spss de foreign, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("rio")
library(rio)

doc <- import(unzip(temp, "Excale06_2005_Docentes.sav"))
#Si se ha descargado la base de datos al directorio de trabajo, usar:
doc <- import("Excale06_2005_Docentes.sav")

#2.2 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale06_2005_doc.csv")
#Lectura a variable doc
doc <- read.csv("excale06_2005_doc.csv")

#Procedimiento 2: Con la librería rio
#Escritura
export(doc, "excale06_2005_doc.csv")
#Lectura a variable doc
doc <- import("excale06_2005_doc.csv")
