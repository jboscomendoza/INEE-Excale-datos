#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondiente al Cuestionario de Contexto para Docentes del EXCALE 03 (Tercero de Primaria), aplicación 2006.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_doc_cuest.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2006_P3/excale03_2006_doc_cuest.zip", "excale03_2006_doc_cuest.zip")
unzip("excale03_2006_doc_cuest.zip", files = "Excale03_2006_Doc_Cuest.TXT")

#2. Lectura de la base de datos y asignación a la variable doc
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 6, 6, 12, 1, 2, 16, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ENTESTDOM", "ID_INSTR", "SEXO", "EDAD", "W_DOC", "DOCENTE", "PP001", "PP002", "PP003", "PP004", "PP005", "PP006", "PP007", "PP008", "PP009", "PP010", "PP011", "PP012", "PP013", "PP014", "PP015", "PP016", "PP017", "PP018", "PP019", "PP020", "PP021", "PP022", "PP023", "PP024", "PP025", "PP026", "PP027", "PP028", "PP029", "PP030", "PP031", "PP032", "PP033", "PP034", "PP035", "PP036", "PP037", "PP038", "PP039", "PP040", "PP041", "PP042", "PP043", "PP044", "PP045", "PP046", "PP047", "PP048", "PP049", "PP050", "PP051", "PP052", "PP053", "PP054", "PP055", "PP056", "PP057", "PP058", "PP059", "PP060", "PP061", "PP062", "PP063", "PP064", "PP065", "PP066", "PP067", "PP068", "PP069", "PP070", "PP071", "PP072", "PP073", "PP074", "PP075", "PP076", "PP077", "PP078", "PP079", "PP080", "PP081", "PP082", "PP083", "PP084", "PP085", "PP086", "PP087", "PP088", "PP089", "PP090", "PP091", "PP092", "PP093", "PP094", "PP095", "PP096", "PP097", "PP098", "PP099", "PP100", "EP_00", "EP_01", "EP_02", "EP_03", "EP_04", "EP_05", "EP_06", "EP_07", "EP_08", "EP_09", "EP_10", "EP_11", "EP_12", "EP_13", "EP_14", "EP_15", "EP_16", "EP_17", "EP_18", "EP_19", "EP_20", "EP_21", "EP_22", "EP_23", "EP_24", "EP_25", "EP_26", "EP_27", "EP_28", "EP_29", "EP_30", "EP_31", "EP_32", "EP_33", "EP_34", "EP_35", "EP_36", "EP_37", "EP_38", "EP_39", "EP_40", "EP_41", "EP_42", "EP_43", "EP_44", "EP_45", "EP_46", "EP_47", "EP_48", "EP_49", "EP_50", "EP_51", "EP_52", "EP_53", "EP_54", "EP_55", "EP_56", "EP_57", "EP_58", "EP_59", "EP_60", "EP_61", "EP_62", "EP_63", "EP_64", "EP_65", "EP_66", "EP_67", "EP_68", "EP_69", "EP_70", "EP_71", "EP_72", "EP_73", "EP_74", "EP_75", "EP_76", "EP_77", "EP_78", "EP_79", "EP_80", "EP_81", "EP_82", "EP_83", "EP_84", "EP_85", "EP_86", "EP_87", "EP_88", "EP_89", "EP_90", "EP_91", "EP_92", "EP_93", "EP_94", "EP_95", "MP_01", "MP_02", "MP_03", "MP_04", "MP_05", "MP_06", "MP_07", "MP_08", "MP_09", "MP_10", "MP_11", "MP_12", "MP_13", "MP_14", "MP_15", "MP_16", "MP_17", "MP_18", "MP_19", "MP_20", "MP_21", "MP_22", "MP_23", "MP_24", "MP_25", "MP_26", "MP_27", "MP_28", "MP_29", "MP_30", "MP_31", "MP_32", "MP_33", "MP_34", "MP_35", "MP_36", "MP_37", "MP_38", "MP_39", "MP_40", "MP_41", "MP_42", "MP_43", "MP_44", "MP_45", "MP_46", "MP_47", "MP_48", "MP_49")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
doc <- read.fwf(unz(temp, "Excale03_2006_Doc_Cuest.TXT"), widths = anchos, col.names = nombres)
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read.fwf("Excale03_2006_Doc_Cuest.TXT", widths = anchos, col.names = nombres)

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

doc <- read_fwf(unz(temp, "Excale03_2006_Doc_Cuest.TXT"), fwf_widths(anchos, nombres))
#Si se ha descargado la base de datos al directorio de trabajo usar:
doc <- read_fwf("Excale03_2006_Doc_Cuest.TXT", fwf_widths(anchos, nombres))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
doc01 <- subset(doc, select = c(NACIONAL:ENTEST))
doc02 <- subset(doc, select = c(ENTESTDOM))
doc03 <- subset(doc, select = c(ID_INSTR))
doc04 <- subset(doc, select = c(SEXO))
doc05 <- subset(doc, select = c(EDAD))
doc06 <- subset(doc, select = c(W_DOC))
doc07 <- subset(doc, select = c(DOCENTE))
doc08 <- subset(doc, select = c(PP001:PP025))
doc09 <- subset(doc, select = c(PP026:PP028))
doc10 <- subset(doc, select = c(PP029:PP042))
doc11 <- subset(doc, select = c(PP043))
doc12 <- subset(doc, select = c(PP044:PP063))
doc13 <- subset(doc, select = c(PP064))
doc14 <- subset(doc, select = c(PP065:MP_49))

doc02[doc02 == "999999"] <- NA
doc04[doc04 > 7] <- NA
doc05[doc05 > 97] <- NA
doc07[doc07 == 99999] <- NA
doc08[doc08 > 7] <- NA
doc09[doc09 > 97] <- NA
doc10[doc10 > 7] <- NA
doc11[doc11 > 97] <- NA
doc12[doc12 > 7] <- NA
doc13[doc13 > 97] <- NA
doc14[doc14 > 7] <- NA

doc <- cbind(doc01, doc02, doc03, doc04, doc05, doc06, doc07, doc08, doc09, doc10, doc11, doc12, doc13, doc14)
rm(doc01, doc02, doc03, doc04, doc05, doc06, doc07, doc08, doc09, doc10, doc11, doc12, doc13, doc14, anchos, nombres)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(doc, "excale03_2006_doc.csv")
#Lectura a variable doc
doc <- read.csv("excale03_2006_doc.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(doc, "excale03_2006_doc.csv")
#Lectura a variable doc
doc <- read_csv("excale03_2006_doc.csv")
