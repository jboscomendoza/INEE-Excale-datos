#Este documento contiene código para descargar, leer, guardar y manipular en R la base de datos correspondientes al EXCALE de Formación Cívica y Ética del EXCALE 09 (Tercero de Secundaria), aplicación 2012.

#1. Instalación de paquetes necesarios
#Comprobación de que los paquetes requeridos están instalados; si están instalados, los incluye al espacio de trabajo; si no están instalados, los descarga e instala.
if(!require("readr")) install.packages("readr")

#2. Descarga del archivo .zip que contiene la base de datos
download.file("http://www.inee.edu.mx/images/stories/documentos_pdf/Bases_Datos/EXCALE09_2012/Excale09_2012_Alum_FCE.zip", "Excale09_2012_Alum_FCE.zip")

#3. Extracción de la base de datos a la carpeta de trabajo
unzip("Excale09_2012_Alum_FCE.zip", files = "Excale09_2012_Alum_FCE.TXT")

#4. Asignación de información de anchos de columnas y nombres de columnas a las variables "anchos" y "nombres"
anchos <- c(1, 4, 2, 19, 1, 4, 6, 6, 5, 15, 1, 2, 2, 11, 1, 1, 1, 1, 11, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 8, 8, 8, 8, 8, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11)
nombres <- c("NACIONAL", "ESCUELA", "ID_ENT", "NOM_ENT", "ID_MOD", "MOD", "ESTRATO", "ENTEST", "ALUMNO", "ID_INSTR", "SEXO", "EDAD_AC", "MES_NAC", "EDAD", "EDAD_ACC", "EDAD_N", "EDAD_ANT", "EDAD_EES", "W_ALU", "SCA_01", "SCA_02", "SCA_03", "SCA_04", "SCA_05", "SCA_06", "SCA_07", "SCA_08", "SCA_09", "SCA_10", "SCA_11", "SCA_12", "SCA_13", "SCA_14", "SCA_15", "SCA_16", "SCA_17", "SCB_01", "SCB_02", "SCB_03", "SCB_04", "SCB_05", "SCB_06", "SCB_07", "SCB_08", "SCB_09", "SCB_10", "SCB_11", "SCB_12", "SCB_13", "SCB_14", "SCB_15", "SCB_16", "SCB_17", "SCC_01", "SCC_02", "SCC_03", "SCC_04", "SCC_05", "SCC_06", "SCC_07", "SCC_08", "SCC_09", "SCC_10", "SCC_11", "SCC_12", "SCC_13", "SCC_14", "SCC_15", "SCC_16", "SCC_17", "SCC_18", "SCD_01", "SCD_02", "SCD_03", "SCD_04", "SCD_05", "SCD_06", "SCD_07", "SCD_08", "SCD_09", "SCD_10", "SCD_11", "SCD_12", "SCD_13", "SCD_14", "SCD_15", "SCD_16", "SCD_17", "SCE_01", "SCE_02", "SCE_03", "SCE_04", "SCE_05", "SCE_06", "SCE_07", "SCE_08", "SCE_09", "SCE_10", "SCE_11", "SCE_12", "SCE_13", "SCE_14", "SCE_15", "SCE_16", "SCE_17", "SCF_01", "SCF_02", "SCF_03", "SCF_04", "SCF_05", "SCF_06", "SCF_07", "SCF_08", "SCF_09", "SCF_10", "SCF_11", "SCF_12", "SCF_13", "SCF_14", "SCF_15", "SCF_16", "SCF_17", "SCF_18", "SCG_01", "SCG_02", "SCG_03", "SCG_04", "SCG_05", "SCG_06", "PV1FCE", "PV2FCE", "PV3FCE", "PV4FCE", "PV5FCE", "FCENVL1", "FCENVL2", "FCENVL3", "FCENVL4", "FCENVL5", "FCENVBL1", "FCENVBL2", "FCENVBL3", "FCENVBL4", "FCENVBL5", "FCENVML1", "FCENVML2", "FCENVML3", "FCENVML4", "FCENVML5", "WVARSTRR", "W_FSTR1", "W_FSTR2", "W_FSTR3", "W_FSTR4", "W_FSTR5", "W_FSTR6", "W_FSTR7", "W_FSTR8", "W_FSTR9", "W_FSTR10", "W_FSTR11", "W_FSTR12", "W_FSTR13", "W_FSTR14", "W_FSTR15", "W_FSTR16", "W_FSTR17", "W_FSTR18", "W_FSTR19", "W_FSTR20", "W_FSTR21", "W_FSTR22", "W_FSTR23", "W_FSTR24", "W_FSTR25", "W_FSTR26", "W_FSTR27", "W_FSTR28", "W_FSTR29", "W_FSTR30", "W_FSTR31", "W_FSTR32", "W_FSTR33", "W_FSTR34", "W_FSTR35", "W_FSTR36", "W_FSTR37", "W_FSTR38", "W_FSTR39", "W_FSTR40", "W_FSTR41", "W_FSTR42", "W_FSTR43", "W_FSTR44", "W_FSTR45", "W_FSTR46", "W_FSTR47", "W_FSTR48", "W_FSTR49", "W_FSTR50", "W_FSTR51", "W_FSTR52", "W_FSTR53", "W_FSTR54", "W_FSTR55", "W_FSTR56", "W_FSTR57", "W_FSTR58", "W_FSTR59", "W_FSTR60", "W_FSTR61", "W_FSTR62", "W_FSTR63", "W_FSTR64", "W_FSTR65", "W_FSTR66", "W_FSTR67", "W_FSTR68", "W_FSTR69", "W_FSTR70", "W_FSTR71", "W_FSTR72", "W_FSTR73", "W_FSTR74", "W_FSTR75", "W_FSTR76", "W_FSTR77", "W_FSTR78", "W_FSTR79", "W_FSTR80", "W_FSTR81", "W_FSTR82", "W_FSTR83", "W_FSTR84", "W_FSTR85", "W_FSTR86", "W_FSTR87", "W_FSTR88", "W_FSTR89", "W_FSTR90", "W_FSTR91", "W_FSTR92", "W_FSTR93", "W_FSTR94", "W_FSTR95", "W_FSTR96", "W_FSTR97", "W_FSTR98", "W_FSTR99", "W_FSTR100")

#5. Lectura de la base de datos y asignación a la variable fce
#En este paso se emplea el paquete "readr" para leer la base de datos con la funcion read_fwf, la cual es más rápida que la función read.fwf del paquete "base", diferencia notable particularmente en equipos de cómputo poco poderosos. ("readr" es instalado en el paso 1.)
fce <- read_fwf("Excale09_2012_Alum_FCE.TXT", fwf_widths(anchos, nombres))

#6. Recodificación de valores numéricos que indican datos perdidos a NA
fce[ , 8][fce[ , 8] == "999999"] <- NA
fce[ , c(11, 15:18)][fce[ , c(11, 15:18)] > 7] <- NA
fce[ , c(12:14)][fce[ , c(12:14)] > 97] <- NA
fce[ , c(20:129)][fce[ , c(20:129)] > 4] <- NA

#7. Escritura de la base de datos a un archivo csv, que permite una lectura más sencilla de la misma con la función read_csv de "readr" o read.csv de "base"
write_csv(fce, "excale09_2012_fce.csv")

#8. Lectura de la base de datos como csv y asignación a la variable fce
fce <- read_csv("excale09_2012_fce.csv")

#9. Eliminación de las variables ancho y nombres
rm(anchos, nombres)
