# INEE-Excale-datos
En este repositorio se encuentran archivos para leer las bases de datos de los Examenes de la Calidad y el Logreo Educativo (**EXCALE**), diseñados y aplicados por el Instituto Nacional para la Evaluación de la Educación (**INEE**) de Mexico usando **R**.

Los archivos **.R** han sido nombrados para identificar su contenido a partir de la siguiente estructura: 

**[grado escolar evaluado]-[año de aplicación]-[instrumento de evaluación].R**

Los elementos de esta estructura y la nomenclatura usada se describen a continuación

## Grado escolar evaluado
Los EXCALE se identifican de acuerdo al grado escolar de los alumnos que evalúan:
- **excale00**: Tercero de preescolar
- **excale03**: Tercero de primaria
- **excale06**: Sexto de primaria
- **excale09**: Tercero de secundaria
- **excale12**: Tercero de bachillerato

## Año de aplicación
Los años en que se realizaron aplicaciones de EXCALE son los siguientes:
- **2005** EXCALE06 y EXCALE09 aplicados
- **2006** EXCALE03 aplicado
- **2007** EXCALE00 y EXCALE06
- **2008** EXCALE09 aplicado
- **2009** EXCALE06 aplicado
- **2010** EXCALE03 y EXCALE12 aplicados
- **2011** EXCALE00 aplicado
- **2012** EXCALE09 aplicado
- **2013** EXCALE06 aplicado

## Instrumento de evaluación

Las aplicaciones de EXCALE constan de dos instrumentos de evaluación, cada archivo **.R** corresponde únicamente a uno en particular, que puede ser EXCALE de asignatura o cuestionario de contexto.
### EXCALE de asignatura
Existe una prueba EXCALE por asignatura. No se aplica un EXCALE para cada una de las asignaturas que componen el plan de estudios, las asignaturas evaluadas dependen del grado escolar y diseño particular de cada prueba.

Las asignaturas evaluadas son las siguientes:
- **ex-esp**: Español
  - Primaria: 2005, 2006, 2007, 2009, 2010, 2013
  - Secundaria: 2005, 2008, 2012
- **ex-mat**: Matemáticas (primaria y secundaria)
  - Primaria: 2005, 2006, 2007, 2009, 2010, 2013
  - Secundaria: 2005, 2008, 2012
- **ex-eym**: Español y Matemáticas
  - Secundaria: 2005
  - Primaria: 2005, 2007
- **ex-c_n**: Ciencias Naturales
  - Primaria: 2009, 2010, 2013
  - Secundaria: 2012
- **ex-bio**: Biología
  - Secundaria: 2008
- **ex-fce**: Formación Cívica y Ética
  - Primaria: 2010, 2013
  - Secundaria: 2008, 2012
- **ex-civ**: Educación Cívica
  - Primaria: 2006, 2009
- **ex-his**: Historia
  - Primaria: 2006
- **ex-geo**: Geografía
  - Primaria: 2006
- **ex-lyc**: Lectura y Comunicación
  - Preescolar: 2007, 2011
- **ex-p_m**: Pensamiento Matemático
  - Preescolar: 2007, 2011 
- **ex-e_e**: Expresión Escrita
  - Primaria: 2005, 2006
  - Secundaria: 2005, 2008
  - Bachillerato: 2010
- **ex-f_c**: Formación Ciudadana 
  - Bachillerato: 2010


### Cuestionario de contexto
De manera concurrente a la aplicación de los EXCALE se aplican cuestionarios de contexto, los cuales indagan factores asociados con el logro educativo. Estos van dirigidos a:
- **cuest_alu**: Alumnos (primaria, secundaria, bachillerato)
  - Primaria: 2006
- **cuest_ayp**: Alumnos y Padres
  - Preescolar: 2007
- **cuest_doc**: Docentes (primaria, secundaria)
  - Preescolar: 2007
  - Primaria: 2005, 2006
  - Secundaria: 2005 
- **cuest_dir**: Directores (primaria, secundaria)
  - Preescolar: 2007
  - Primaria: 2005, 2006,
  - Secundaria: 2005  
- **cuest_pad**: Padres (preescolar)
