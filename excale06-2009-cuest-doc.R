#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al Cuestionario de Contexto para Docentes del EXCALE 06 (Sexto de Primaria), aplicación 2009.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_doc_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2009/excale06_2009_doc_cuest.zip", "excale06_2009_doc_cuest.zip")
unzip("excale06_2009_doc_cuest.zip", "Excale06_2009_Doc_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable doc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos y nombres
anchos <- c(1, 4, 2, 19, 1, 4, 2, 1, 7, 6, 12, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "GM", "MARG_URB", "ESTRATO", "ENTEST", "ID_INSTR", "W_DOC", "DOCENTE", "PP001", "PP002", "PP003", "PP004", "PP005", "PP006", "PP007", "PP008", "PP009", "PP010", "PP011", "PP012", "PP013", "PP014", "PP015", "PP016", "PP017", "PP018", "PP019", "PP020", "PP021", "PP022", "PP023", "PP024", "PP025", "PP026", "PP027", "PP028", "PP029", "PP030", "PP031", "PP032", "PP033", "PP034", "PP035", "PP036", "PP037", "PP038", "PP039", "PP040", "PP041", "PP042", "PP043", "PP044", "PP045", "PP046", "PP047", "PP048", "PP049", "PP050", "PP051", "PP052", "PP053", "PP054", "PP055", "PP056", "PP057", "PP058", "PP059", "PP060", "PP061", "PP062", "PP063", "PP064", "PP065", "PP066", "PP067", "PP068", "PP069", "PP070", "PP071", "PP072", "PP073", "PP074", "PP075", "PP076", "PP077", "PP078", "PP079", "PP080", "PP081", "PP082", "PP083", "PP089", "PP090", "PP091", "PP092", "PP093", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
doc <- read.fwf(unz(temp, "Excale06_2009_Doc_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read.fwf("Excale06_2009_Doc_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al espacio de trabajo
install.packages("readr")
library(readr)

doc <- read_fwf(unz(temp, "Excale06_2009_Doc_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read_fwf("Excale06_2009_Doc_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
doc01 <- subset(doc, select = c(NACIONAL:MOD))
doc02 <- subset(doc, select = c(GM))
doc03 <- subset(doc, select = c(MARG_URB))
doc04 <- subset(doc, select = c(ESTRATO:DOCENTE))
doc05 <- subset(doc, select = c(PP001:PP038))
doc06 <- subset(doc, select = c(PP039))
doc07 <- subset(doc, select = c(PP040:PP093))
doc08 <- subset(doc, select = c(WVARSTRR:W_FSTR80))

doc02[doc02 == 9] <- NA
doc03[doc03 == 7] <- NA
doc05[doc05 > 7] <- NA
doc06[doc06 > 97] <- NA
doc07[doc07 > 7] <- NA

doc <- cbind(doc01, doc02, doc03, doc04, doc05, doc06, doc07, doc08)
rm(doc01, doc02, doc03, doc04, doc05, doc06, doc07, doc08, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale06-2009-ex-doc.csv")
#Lectura a variable doc
doc <- read.csv("excale06-2009-ex-doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(doc, "excale06-2009-ex-doc.csv")
#Lectura a variable doc
doc <- read_csv("excale06-2009-ex-doc.csv")
