#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Ciencias Naturales del EXCALE 09 (Tercero de Secundaria), aplicación 2012.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2012/Excale09_2012_Alum_CN.zip", "Excale09_2012_Alum_CN.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("Excale09_2012_Alum_CN.zip", files = "Excale09_2012_Alum_CN.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 6, 6, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "SNA_01", "SNA_02", "SNA_03", "SNA_04", "SNA_05", "SNA_06", "SNA_07", "SNA_08", "SNA_09", "SNA_10", "SNA_11", "SNA_12", "SNB_01", "SNB_02", "SNB_03", "SNB_04", "SNB_05", "SNB_06", "SNB_07", "SNB_08", "SNB_09", "SNB_10", "SNB_11", "SNB_12", "SNC_01", "SNC_02", "SNC_03", "SNC_04", "SNC_05", "SNC_06", "SNC_07", "SNC_08", "SNC_09", "SNC_10", "SNC_11", "SNC_12", "SND_01", "SND_02", "SND_03", "SND_04", "SND_05", "SND_06", "SND_07", "SND_08", "SND_09", "SND_10", "SND_11", "SND_12", "SNE_01", "SNE_02", "SNE_03", "SNE_04", "SNE_05", "SNE_06", "SNE_07", "SNE_08", "SNE_09", "SNE_10", "SNE_11", "SNE_12", "SNF_01", "SNF_02", "SNF_03", "SNF_04", "SNF_05", "SNF_06", "SNF_07", "SNF_08", "SNF_09", "SNF_10", "SNF_11", "SNF_12", "PV1CN", "PV2CN", "PV3CN", "PV4CN", "PV5CN", "CNNVL1", "CNNVL2", "CNNVL3", "CNNVL4", "CNNVL5", "CNNVBL1", "CNNVBL2", "CNNVBL3", "CNNVBL4", "CNNVBL5", "CNNVML1", "CNNVML2", "CNNVML3", "CNNVML4", "CNNVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable c_n
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
c_n <- read_fwf("Excale09_2012_Alum_CN.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
c_n[ , 8][c_n[ , 8] == "999999"] <- NA
c_n[ , c(11, 15:18)][c_n[ , c(11, 15:18)] > 7] <- NA
c_n[ , c(12:14)][c_n[ , c(12:14)] > 97] <- NA
c_n[ , c(20:91)][c_n[ , c(20:91)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(c_n, "excale09_2012_c_n.csv")

#8. Lectura de la base de datos como csv y asignación a la variable c_n
c_n <- read_csv("excale09_2012_c_n.csv")

#9. Eliminación de las variables ancho y nombres
rm(anchos, nombres)
