#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Formación Cívica y Ética del EXCALE 06 (Sexto de Primaria), aplicación 2013.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
ifelse("readr" %in% installed.packages(), require("readr"), install.packages("readr"))

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_FCE.zip", "Excale06_2013_Alum_FCE.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("Excale06_2013_Alum_FCE.zip", files = "Excale06_2013_Alum_FCE.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 7, 5, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PCA_01", "PCA_02", "PCA_03", "PCA_04", "PCA_05", "PCA_06", "PCA_07", "PCA_08", "PCA_09", "PCA_10", "PCA_11", "PCA_12", "PCA_13", "PCA_14", "PCA_15", "PCA_16", "PCA_17", "PCA_18", "PCB_01", "PCB_02", "PCB_03", "PCB_04", "PCB_05", "PCB_06", "PCB_07", "PCB_08", "PCB_09", "PCB_10", "PCB_11", "PCB_12", "PCB_13", "PCB_14", "PCB_15", "PCB_16", "PCB_17", "PCC_01", "PCC_02", "PCC_03", "PCC_04", "PCC_05", "PCC_06", "PCC_07", "PCC_08", "PCC_09", "PCC_10", "PCC_11", "PCC_12", "PCC_13", "PCC_14", "PCC_15", "PCC_16", "PCC_17", "PCC_18", "PCD_01", "PCD_02", "PCD_03", "PCD_04", "PCD_05", "PCD_06", "PCD_07", "PCD_08", "PCD_09", "PCD_10", "PCD_11", "PCD_12", "PCD_13", "PCD_14", "PCD_15", "PCD_16", "PCD_17", "PCD_18", "PCE_01", "PCE_02", "PCE_03", "PCE_04", "PCE_05", "PCE_06", "PCE_07", "PCE_08", "PCE_09", "PCE_10", "PCE_11", "PCE_12", "PCE_13", "PCE_14", "PCE_15", "PCE_16", "PCE_17", "PCF_01", "PCF_02", "PCF_03", "PCF_04", "PCF_05", "PCF_06", "PCF_07", "PCF_08", "PCF_09", "PCF_10", "PCF_11", "PCF_12", "PCF_13", "PCF_14", "PCF_15", "PCF_16", "PCF_17", "PCF_18", "PV1FCE", "PV2FCE", "PV3FCE", "PV4FCE", "PV5FCE", "FCENVL1", "FCENVL2", "FCENVL3", "FCENVL4", "FCENVL5", "FCENVBL1", "FCENVBL2", "FCENVBL3", "FCENVBL4", "FCENVBL5", "FCENVML1", "FCENVML2", "FCENVML3", "FCENVML4", "FCENVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable fce
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
fce <- read_fwf("Excale06_2013_Alum_FCE.TXT", fwf_widths(anchos, nombres))

#2.4 Recodificación de valores numéricos que indican datos perdidos a NA (opcional)
fce[ , 8][fce[ , 8] == "999"] <- NA
fce[ , c(11, 15:18)][fce[ , c(11, 15:18)] > 7] <- NA
fce[ , c(12:14)][fce[ , c(12:14)] > 97] <- NA
fce[ , 20][fce[ , 20] == 99999] <- NA
fce[ , c(21:126)][fce[ , c(21:126)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(fce, "excale06_2013_fce.csv")

#8. Lectura de la base de datos como csv y asignación a la variable fce
fce <- read_csv("excale06_2013_fce.csv")

#9. Eliminación de las variables anchos y nombres
rm(anchos, nombres)
