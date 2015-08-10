#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes a los EXCALEs de Español (Comprensión lectora y Reflexión sobre la lengua) y Matemáticas, así como del Cuestionario de Contexto para Alumnos del EXCALE 06 (Sexto de Primaria), aplicación 2007.

#1. Descarga
#Procedimiento 1: Descarga del archivo zip a una ubicación temporal, y asignación de la base de datos a la variable temp.
temp <- tempfile()
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_alumnos.zip", temp)

#Procedimiento 2: Descarga del archivo zip y extracción de la base de datos al directorio de trabajo.
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE2007_P6/excale06_2007_alumnos.zip", "excale06_2007_alumnos.zip")
unzip("excale06_2007_alumnos.zip", files = "Excale06_2007_Alumnos.TXT")

#2. Lectura de la base de datos y asignación a la variable alu
#2.1 Asignación de información de ancho de columna y nombres de columnas a variables anchos, nombres_1 y nombres_2
anchos <- c(1, 4, 2, 20, 1, 4, 5, 6, 15, 1, 11, 1, 11, 1, 1, 2, 2, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres_1 <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD", "EDADC", "EDAD1SEP", "EDAD1SEPC", "EDADN", "EDAD_AC", "MES_NAC", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCA_07", "PCB_01", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCC_01", "PCC_02", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCD_01", "PCD_02", "PCD_03", "PCD_04", "PCD_05", "PCD_06", "PCD_07", "PCD_08", "PCE_01", "PCE_02", "PCE_03", "PCE_04", "PCE_05", "PCE_06", "PCE_07", "PCE_08", "PCF_01", "PCF_02", "PCF_03", "PCF_04", "PCF_05", "PCF_06", "PCF_07", "PCG_01", "PCG_02", "PCG_03", "PCG_04", "PCG_05", "PCG_06", "PCG_07", "PLA_01", "PLA_02", "PLA_03", "PLA_04", "PLA_05", "PLB_01", "PLB_02", "PLB_03", "PLB_04", "PLB_05", "PLB_06", "PLB_07", "PLC_01", "PLC_02", "PLC_03", "PLC_04", "PLC_05", "PLD_01", "PLD_02", "PLD_03", "PLD_04", "PLE_01", "PLE_02", "PLE_03", "PLE_04", "PLF_01", "PLF_02", "PLF_03", "PLF_04", "PLF_05", "PLG_01", "PLG_02", "PLG_03", "PLG_04", "PLG_05", "PLH_01", "PLH_02", "PLH_03", "PLH_04", "PLH_05", "PLH_06", "PLH_07", "PLI_01", "PLI_02", "PLI_03", "PLI_04", "PLI_05", "PLJ_01", "PLJ_02", "PLJ_03", "PLJ_04", "PLK_01", "PLK_02", "PLK_03", "PLK_04", "PLK_05", "PLL_01", "PLL_02", "PLL_03", "PLL_04", "PLM_01", "PLM_02", "PLM_03", "PLM_04", "PLN_01", "PLN_02", "PLN_03", "PLN_04", "PMA_01", "PMA_02", "PMA_03", "PMA_04", "PMA_05", "PMA_06", "PMA_07", "PMA_08", "PMA_09", "PMB_01", "PMB_02", "PMB_03", "PMB_04", "PMB_05", "PMB_06", "PMB_07", "PMB_08", "PMB_09", "PMB_10", "PMC_01", "PMC_02", "PMC_03", "PMC_04", "PMC_05", "PMC_06", "PMC_07", "PMC_08", "PMC_09", "PMD_01", "PMD_02", "PMD_03", "PMD_04", "PMD_05", "PMD_06", "PMD_07", "PMD_08", "PMD_09", "PMD_10", "PME_01", "PME_02", "PME_03", "PME_04", "PME_05", "PME_06", "PME_07", "PME_08", "PME_09", "PME_10", "PMF_01", "PMF_02", "PMF_03", "PMF_04", "PMF_05", "PMF_06", "PMF_07", "PMF_08", "PMF_09", "PMF_10", "PMG_01", "PMG_02", "PMG_03", "PMG_04", "PMG_05", "PMG_06", "PMG_07", "PMG_08", "PMG_09", "PMG_10", "PMH_01", "PMH_02", "PMH_03", "PMH_04", "PMH_05", "PMH_06", "PMH_07", "PMH_08", "PMH_09", "PMH_10", "PMI_01", "PMI_02", "PMI_03", "PMI_04", "PMI_05", "PMI_06", "PMI_07", "PMI_08", "PMI_09", "PMI_10", "PMJ_01", "PMJ_02", "PMJ_03", "PMJ_04", "PMJ_05", "PMJ_06", "PMJ_07", "PMJ_08", "PMJ_09", "PMJ_10", "PMK_01", "PMK_02", "PMK_03", "PMK_04", "PMK_05", "PMK_06", "PMK_07", "PMK_08", "PMK_09", "PMK_10", "PML_01", "PML_02", "PML_03", "PML_05", "PML_06", "PML_07", "PML_08", "PML_09", "PML_10", "PMM_01", "PMM_02", "PMM_03", "PMM_04", "PMM_05", "PMM_06", "PMM_07", "PMM_08", "PMM_09", "PMN_01", "PMN_02", "PMN_03", "PMN_04", "PMN_05", "PMN_06", "PMN_07", "PMN_08", "PMN_09", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "PV1RCE", "PV2RCE", "PV3RCE", "PV4RCE", "PV5RCE", "PV1LEC", "PV2LEC", "PV3LEC", "PV4LEC", "PV5LEC", "PV1MAT", "PV2MAT", "PV3MAT", "PV4MAT", "PV5MAT", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "MATNVL1", "MATNVL2", "MATNVL3", "MATNVL4", "MATNVL5", "ESPNBL1", "ESPNBL2", "ESPNBL3", "ESPNBL4", "ESPNBL5", "MATNBL1", "MATNBL2", "MATNBL3", "MATNBL4", "MATNBL5")
nombres_2 <- c("AP001", "AP002", "AP003", "AP004", "AP005", "AP006", "AP007", "AP008", "AP009", "AP010", "AP011", "AP012", "AP013", "AP014", "AP015", "AP016", "AP017", "AP018", "AP019", "AP020", "AP021", "AP022", "AP023", "AP024", "AP025", "AP026", "AP027", "AP028", "AP029", "AP030", "AP031", "AP032", "AP033", "AP034", "AP035", "AP036", "AP037", "AP038", "AP039", "AP040", "AP041", "AP042", "AP043", "AP044", "AP045", "AP046", "AP047", "AP048", "AP049", "AP050", "AP051", "AP052", "AP053", "AP054", "AP055", "AP056", "AP057", "AP058", "AP059", "AP060", "AP061", "AP062", "AP063", "AP064", "AP065", "AP066", "AP067", "AP068", "AP069", "AP070", "AP071", "AP072", "AP073", "AP074", "AP075", "AP076", "AP077", "AP078", "AP079", "AP080", "AP081", "AP082", "AP083", "AP084", "AP085", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#2.2 Lectura
#Procedimiento 1. Usando la librería base de R
#Este procedimiento tiene la ventaja de que no requiere la instalación y uso de librerías adicionales a las incluidas en la instalación estándar de R. La desventaja de este método es que la lectura de la base de datos con read.fwf() es relativamente lenta, en particular en equipos de cómputo poco poderosos.
alu <- read.fwf(unz(temp, "Excale06_2007_Alumnos.TXT"), widths = anchos, col.names = c(nombres_1, nombres_2))
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read.fwf("Excale06_2007_Alumnos.TXT", widths = anchos, col.names = c(nombres_1, nombres_2))

#Procedimiento 2. Usando la librería readr
#Este procedimiento tiene como desventaja que requiere la instalación y uso de la librería readr, adicional a las incluidas en la instalación estándar de R. La ventaja de este método es que la lectura de la base de datos con la funcion read_fwf() de readr es relativamente rápida, incluso en equipos de cómputo poco poderosos.

#Instalación de la libreria readr e inclusión al directorio de trabajo
install.packages("readr")
library(readr)

alu <- read_fwf(unz(temp, "Excale06_2007_Alumnos.TXT"), fwf_widths(anchos, c(nombres_1, nombres_2)))
#Si se ha descargado la base de datos al directorio de trabajo usar:
alu <- read_fwf("Excale06_2007_Alumnos.TXT", widths = anchos, col.names = c(nombres_1, nombres_2))

#2.3 Liberación del archivo temporal asignado a temp
unlink(temp)
rm(temp)

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
alu01 <- subset(alu, select = c(NACIONAL:ID_INSTR))
alu02 <- subset(alu, select = c(SEXO))
alu03 <- subset(alu, select = c(EDAD))
alu04 <- subset(alu, select = c(EDADC))
alu05 <- subset(alu, select = c(EDAD1SEP))
alu06 <- subset(alu, select = c(EDAD1SEPC:EDADN))
alu07 <- subset(alu, select = c(EDAD_AC:MES_NAC))
alu08 <- subset(alu, select = c(W_ALU))
alu09 <- subset(alu, select = c(DOCENTE))
alu10 <- subset(alu, select = c(PCA_01:PMN_09))
alu11 <- subset(alu, select = c(AP001:AP036))
alu12 <- subset(alu, select = c(AP037:AP040))
alu13 <- subset(alu, select = c(AP041:AP085))
alu14 <- subset(alu, select = c(WVARSTRR:W_FSTR80))

alu02[alu02 > 7] <- NA
alu03[alu03 == 99] <- NA
alu04[alu04 == 9] <- NA
alu05[alu05 == 99] <- NA
alu06[alu06 == 9] <- NA
alu07[alu07 > 97] <- NA
alu09[alu09 == 99999] <- NA
alu10[alu10 > 6] <- NA
alu11[alu11 > 7] <- NA
alu12[alu12 > 97] <- NA
alu13[alu13 > 7] <- NA

alu <- cbind(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14)
rm(alu01, alu02, alu03, alu04, alu05, alu06, alu07, alu08, alu09, alu10, alu11, alu12, alu13, alu14, anchos, nombres_1, nombres_2)

#III. Escritura
#Escritura de archivo csv que permite una lectura más sencilla de la base de datos.
#Procedimiento 1: Con librerías base
#Escritura
write.csv(alu, "excale06_2007_alu.csv")
#Lectura a variable alu
alu <- read.csv("excale06_2007_alu.csv")

#Procedimiento 2: Con readr
#Escritura
write_csv(alu, "excale06_2007_alu.csv")
#Lectura a variable alu
alu <- read_csv("excale06_2007_alu.csv")
