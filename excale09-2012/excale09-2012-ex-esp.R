#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Español del EXCALE 09 (Tercero de Secundaria), aplicación 2012.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2012/Excale09_2012_Alum_Esp.zip", "Excale09_2012_Alum_Esp.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("Excale09_2012_Alum_Esp.zip", files = "Excale09_2012_Alum_Esp.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 6, 6, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "SEA_01", "SEA_02", "SEA_03", "SEA_04", "SEA_05", "SEA_06", "SEA_07", "SEA_08", "SEA_09", "SEA_10", "SEA_11", "SEA_12", "SEA_13", "SEA_14", "SEA_15", "SEA_16", "SEB_01", "SEB_02", "SEB_03", "SEB_04", "SEB_05", "SEB_06", "SEB_07", "SEB_08", "SEB_09", "SEB_10", "SEB_11", "SEB_12", "SEB_13", "SEB_14", "SEB_15", "SEB_16", "SEC_01", "SEC_02", "SEC_03", "SEC_04", "SEC_05", "SEC_06", "SEC_07", "SEC_08", "SEC_09", "SEC_10", "SEC_11", "SEC_12", "SEC_13", "SEC_14", "SEC_15", "SEC_16", "SED_01", "SED_02", "SED_03", "SED_04", "SED_05", "SED_06", "SED_07", "SED_08", "SED_09", "SED_10", "SED_11", "SED_12", "SED_13", "SED_14", "SED_15", "SED_16", "SEE_01", "SEE_02", "SEE_03", "SEE_04", "SEE_05", "SEE_06", "SEE_07", "SEE_08", "SEE_09", "SEE_10", "SEE_11", "SEE_12", "SEE_13", "SEE_14", "SEE_15", "SEE_16", "SEF_01", "SEF_02", "SEF_03", "SEF_04", "SEF_05", "SEF_06", "SEF_07", "SEF_08", "SEF_09", "SEF_10", "SEF_11", "SEF_12", "SEF_13", "SEF_14", "SEF_15", "SEF_16", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVBL1", "ESPNVBL2", "ESPNVBL3", "ESPNVBL4", "ESPNVBL5", "ESPNVML1", "ESPNVML2", "ESPNVML3", "ESPNVML4", "ESPNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable esp
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
esp <- read_fwf("Excale09_2012_Alum_Esp.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
esp[ , 8][esp[ , 8] == "999999"] <- NA
esp[ , c(11, 15:18)][esp[ , c(11, 15:18)] > 7] <- NA
esp[ , c(12:14)][esp[ , c(12:14)] > 97] <- NA
esp[ , c(20:115)][esp[ , c(20:115)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(esp, "excale09_2012_esp.csv")

#8. Lectura de la base de datos como csv y asignación a la variable esp
esp <- read_csv("excale09_2012_esp.csv")

#9. Eliminación de las variables ancho y nombres
rm(anchos, nombres)
