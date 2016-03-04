# INEE-Excale-datos
En este repositorio se encuentran archivos para leer las bases de datos de los Examenes de la Calidad y el Logro Educativo (**EXCALE**), diseñados y aplicados por el Instituto Nacional para la Evaluación de la Educación (**INEE**) de Mexico usando **R**.

Los archivos **.R** han sido nombrados para identificar su contenido a partir de la siguiente estructura: 

**[clave de EXCALE aplicado] _ [clave de año de aplicación] _ [clave de instrumento de evaluación].R**

Los elementos de esta estructura y la nomenclatura usada se describen a continuación

## EXCALE aplicado
Los EXCALE se identifican de acuerdo al grado escolar de los alumnos que evalúan:

|Clave |EXCALE   |Grado                  |
|:---- |:---     |:---                   |
|*ex00*|EXCALE 00|Tercero de preescolar  |
|*ex03*|EXCALE 03|Tercero de primaria    |
|*ex06*|EXCALE 06|Sexto de primaria      |
|*ex09*|EXCALE 09|Tercero de secundaria  |
|*ex12*|EXCALE 12|Tercero de bachillerato|

## Año de aplicación
Los años en que se realizaron aplicaciones de EXCALE son:

|Clave|Año |EXCALE aplicado     |
|:----|:---|:---                |
|*05*|2005|EXCALE 06 y EXCALE 09|
|*06*|2006|EXCALE 03            |
|*07*|2007|EXCALE 00 y EXCALE 06|
|*08*|2008|EXCALE 09            |
|*09*|2009|EXCALE 06            |
|*10*|2010|EXCALE 03 y EXCALE 12|
|*11*|2011|EXCALE 00            |
|*12*|2012|EXCALE 09            |
|*13*|2013|EXCALE 06            |
|*14*|2014|EXCALE 03            |

## Instrumento de evaluación

Las aplicaciones de EXCALE constan de dos instrumentos de evaluación, cada archivo **.R** corresponde únicamente a uno en particular, que puede ser EXCALE de asignatura o cuestionario de contexto.
### EXCALE de asignatura
Existe una prueba EXCALE por asignatura. No se aplica un EXCALE para cada una de las asignaturas que componen el plan de estudios, las asignaturas evaluadas dependen del grado escolar y diseño particular de cada prueba.

Las asignaturas evaluadas, por grado y año de aplicación, son:

|Clave|Asignatura            |Grado       |Años                              |
|:----|:---                  |:---        |:---                              |
|esp|Español                 |Primaria    |2005, 2006, 2007, 2009, 2010, 2013|
|   |                        |Secundaria  |2005, 2008, 2012                  | 
|lyc|Lenguaje y Comunicación |Preescolar  |2007, 2011                        |
|ees|Expresión Escrita       |Primaria    |2005, 2006                        |
|   |                        |Secundaria  |2005, 2008                        |
|   |                        |Bachillerato|2010                              |
|mat|Matemáticas             |Primaria    |2005, 2006, 2007, 2009, 2010, 2013|
|   |                        |Secundaria  |2005, 2008, 2012                  |
|pma|Pensamiento Matemático  |Preescolar  |2007, 2011                        |
|eym|Español y Matemáticas   |Primaria    |2005, 2007                        |
|   |                        |Secundaria  |2005                              |
|cna|Ciencias Naturales      |Primaria    |2009, 2010, 2013                  |
|   |                        |Secundaria  |2012                              |
|bio|Biología                |Secundaria  |2008                              |
|fce|Formación Cívica y Ética|Primaria    |2010, 2013                        |
|   |                        |Secundaria  |2008, 2012                        |
|eci|Educación Cívica        |Primaria    |2006, 2009                        |
|fci|Formación Ciudadana     |Bachillerato|2010                              |
|his|Historia                |Primaria    |2006                              |
|geo|Geografía               |Primaria    |2006                              |

### Cuestionario de contexto
De manera concurrente a la aplicación de los EXCALE se aplican cuestionarios de contexto, los cuales exploran factores asociados con el logro educativo. Estos van dirigidos a a Alumnos, Padres, Docentes y Directores.

Los cuestionarios aplicados, por grado y año de aplicación, son:

|Clave|Cuestionario  |Grado       |Años                              |
|:----|:---          |:---        |:---                              |
|alu| Alumnos        |Primaria    |2006, 2009, 2010, 2013            |
|   |         			 |Secundaria	|2008, 2012                        |
|  	|					       |Bachillerato|2010                              |
|ayp|Alumnos y Padres|Preescolar	|2007                              |
|doc|Docentes 			 |Preescolar	|2007                              |
|		|					       |Primaria 		|2005, 2006, 2007, 2009, 2010, 2013|
|   |         			 |Secundaria 	|2005, 2008                        |
|dir|Directores  		 |Preescolar 	|2007                              |
|   |         			 |Primaria 		|2005, 2006, 2007, 2009, 2010, 2013|
|		|				         |Secundaria 	|2005, 2008                        |
|pad|Padres				   |Preescolar 	|2011                              |
