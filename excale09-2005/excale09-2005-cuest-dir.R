#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondiente a el Cuestionario de Contexto para Directores del EXCALE 09 (Tercero de Secundaria), aplicación 2005.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2005_S3/excale09_2005_directores.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2005_S3/excale09_2005_directores.zip", "excale09_2005_alum_expresion_escrita.zip")
unzip("excale09_2005_alum_expresion_escrita.zip", files = "Excale09_2005_Directores.sav")

#2. Lectura de la base de datos y asignación a la variable dre

#2.1 Lectura
#Procedimiento 1. Usando la librería foreign, incluida en la instalación estándar de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.spss() de foreign es lenta, comparada con otros métodos, en particular en equipos de cómputo poco poderosos.

dre <- read.spss(unzip(temp, "Excale09_2005_Directores.sav"), use.value.labels = FALSE, to.data.frame = TRUE)
#Si se ha descargado la base de datos al directorio de trabajo, usar:
dre <- read.spss("Excale09_2005_Directores.sav", use.value.labels = FALSE, to.data.frame = TRUE)

#Procedimiento 2. Usando la librería rio
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería rio, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion import de rio es relativamente rápida, comparada con la función read.spss de foreign, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("rio")
library(rio)

dre <- import(unzip(temp, "Excale09_2005_Directores.sav"))
#Si se ha descargado la base de datos al directorio de trabajo, usar:
dre <- import("Excale09_2005_Directores.sav")

#2.2 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(dre, "excale06_2005_dre.csv")
#Lectura a variable dre
dre <- read.csv("excale06_2005_dre.csv")

#Procedimiento 2: Con la librería rio
#Escritura
export(dre, "excale06_2005_dre.csv")
#Lectura a variable dre
dre <- import("excale06_2005_dre.csv")
