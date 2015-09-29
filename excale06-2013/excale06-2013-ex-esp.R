#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español del EXCALE 06 (Sexto de Primaria), aplicación 2013.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
ifelse("readr" %in% installed.packages(), require("readr"), install.packages("readr"))

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE06_2013/Excale06_2013_Alum_Esp.zip", "Excale06_2013_Alum_Esp.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("Excale06_2013_Alum_Esp.zip", files = "Excale06_2013_Alum_Esp.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 7, 5, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "DOCENTE", "PEA_01", "PEA_02", "PEA_03", "PEA_04", "PEA_05", "PEA_06", "PEA_07", "PEA_08", "PEA_09", "PEA_10", "PEA_11", "PEA_12", "PEA_13", "PEA_14", "PEA_15", "PEA_16", "PEB_01", "PEB_02", "PEB_03", "PEB_04", "PEB_05", "PEB_06", "PEB_07", "PEB_08", "PEB_09", "PEB_10", "PEB_11", "PEB_12", "PEB_13", "PEB_14", "PEB_15", "PEB_16", "PEC_01", "PEC_02", "PEC_03", "PEC_04", "PEC_05", "PEC_06", "PEC_07", "PEC_08", "PEC_09", "PEC_10", "PEC_11", "PEC_12", "PEC_13", "PEC_14", "PEC_15", "PEC_16", "PED_01", "PED_02", "PED_03", "PED_04", "PED_05", "PED_06", "PED_07", "PED_08", "PED_09", "PED_10", "PED_11", "PED_12", "PED_13", "PED_14", "PED_15", "PEE_01", "PEE_02", "PEE_03", "PEE_04", "PEE_05", "PEE_06", "PEE_07", "PEE_08", "PEE_09", "PEE_10", "PEE_11", "PEE_12", "PEE_13", "PEE_14", "PEE_15", "PEF_01", "PEF_02", "PEF_03", "PEF_04", "PEF_05", "PEF_06", "PEF_07", "PEF_08", "PEF_09", "PEF_10", "PEF_11", "PEF_12", "PEF_13", "PEF_14", "PEF_15", "PEF_16", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVBL1", "ESPNVBL2", "ESPNVBL3", "ESPNVBL4", "ESPNVBL5", "ESPNVML1", "ESPNVML2", "ESPNVML3", "ESPNVML4", "ESPNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable esp
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
esp <- read_fwf("Excale06_2013_Alum_Esp.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
esp[ , 8][esp[ , 8] == "999"] <- NA
esp[ , c(11, 15:18)][esp[ , c(11, 15:18)] > 7] <- NA
esp[ , c(12:14)][esp[ , c(12:14)] > 97] <- NA
esp[ , 20][esp[ , 20] == 99999] <- NA
esp[ , c(21:114)][esp[ , c(21:114)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(esp, "excale06_2013_esp.csv")

#8. Lectura de la base de datos como csv y asignación a la variable c_n
esp <- read_csv("excale06_2013_esp.csv")

#9. Eliminación de las variables ancho y nombres
rm(ancho, nombres)
