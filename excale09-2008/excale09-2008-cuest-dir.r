#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Directores del EXCALE 09 (Tercero de Secundaria), aplicación 2008.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_dir_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2008/excale09_2008_dir_cuest.zip", "excale09_2008_doc_cuest.zip")
unzip("excale09_2008_doc_cuest.zip", "Excale09_2008_Dir_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable dre
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 7, 6, 12, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "MAGEB05", "ESTRATO", "ENTEST", "ID_INSTR", "W_DIR", "DS001", "DS002", "DS003", "DS004", "DS005", "DS006", "DS007", "DS008", "DS009", "DS010", "DS011", "DS012", "DS013", "DS014", "DS015", "DS016", "DS017", "DS018", "DS019", "DS020", "DS021", "DS022", "DS023", "DS024", "DS025", "DS026", "DS027", "DS028", "DS029", "DS030", "DS031", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
dre <- read.fwf(unz(temp, "Excale09_2008_Dir_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read.fwf("Excale09_2008_Dir_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

dre <- read_fwf(unz(temp, "Excale09_2008_Dir_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
dre <- read_fwf("Excale09_2008_Dir_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
dre01 <- subset(dre, select = c(NACIONAL:W_DIR))
dre02 <- subset(dre, select = c(DS001:DS031))
dre03 <- subset(dre, select = c(WVARSTRR:W_FSTR80))

dre02[dre02 > 7] <- NA

dre <- cbind(dre01, dre02, dre03)
rm(dre01, dre02, dre03, anchos, nombres)

#3. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(dre, "excale09-2008-cuest-dre.csv")
#Lectura a variable dre
dre <- read.csv("excale09-2008-cuest-dre.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(dre, "excale09-2008-cuest-dre.csv")
#Lectura a variable dre
dre <- read_csv("excale09-2008-cuest-dre.csv")
