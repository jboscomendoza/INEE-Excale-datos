#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Lenguaje y Comunicación del EXCALE 00, aplicación 2011.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE00_2011/excale00_2011_alum_lc.zip", "excale00_2011_alum_lc.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("excale00_2011_alum_lc.zip", "Excale00_2011_Alum_LC.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 6, 5, 15, 1, 10, 11, 1, 1, 2, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 11, 11, 11, 11, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ALUMNO", "ID_INSTR", "SEXO", "FECHA_NAC", "EDAD", "EDADC", "EDADN", "EDAD_AC", "W_ALU", "ELA_01", "ELA_02", "ELA_03", "ELA_04", "ELA_05", "ELA_06", "ELA_07", "ELA_08", "ELA_09", "ELB_01", "ELB_02", "ELB_03", "ELB_04", "ELB_05", "ELB_06", "ELB_07", "ELB_08", "ELB_09", "ELC_01", "ELC_02", "ELC_03", "ELC_04", "ELC_05", "ELC_06", "ELC_07", "ELC_08", "ELC_09", "ELD_01", "ELD_02", "ELD_03", "ELD_04", "ELD_05", "ELD_06", "ELD_07", "ELD_08", "ELD_09", "ELD_10", "PV1ESP", "PV2ESP", "PV3ESP", "PV4ESP", "PV5ESP", "ESPNVL1", "ESPNVL2", "ESPNVL3", "ESPNVL4", "ESPNVL5", "ESPNVLB1", "ESPNVLB2", "ESPNVLB3", "ESPNVLB4", "ESPNVLB5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80")

#5. Lectura de la base de datos y asignación a la variable lyc
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
lyc <- read_fwf("Excale00_2011_Alum_LC.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
lyc[ , c(10, 13, 14)][lyc[ , c(10, 13, 14)] >= 7] <- NA
lyc[ , c(12, 15)][lyc[ , c(12, 15)] >= 97] <- NA
lyc[ , c(17:53)][lyc[ , c(17:53)] >= 5] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(lyc, "excale00_2011_ex-lyc.csv")

#8. Lectura de la base de datos como csv y asignación a la variable lyc
lyc <- read_csv("excale00_2011_ex-lyc.csv")

#9. Eliminación de las variables anchos y nombres
rm(anchos, nombres)
