# INEE-Excale-datos
En este repositorio se encuentran archivos para leer las bases de datos de los Examenes de la Calidad y el Logreo Educativo (**EXCALE**), diseñados y aplicados por el Instituto Nacional para la Evaluación de la Educación (**INEE**) de Mexico usando **R**.

Los archivos **.R** han sido nombrados para identificar su contenido a partir de la siguiente estructura: 

**[grado escolar evaluado]-[año de aplicación]-[instrumento de evaluación].r**

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
- **ex-esp**: Español (primaria y secundaria)
- **ex-mat**: Matemáticas (primaria y secundaria)
- **ex-c_n**: Ciencias Naturales (primaria y secundaria)
- **ex-fce**: Formación Cívica y Ética (primaria y secundaria)
- **ex-lyc**: Lenguaje y Comunicación (preescolar)
- **ex-p_m**: Pensamiento Matemático (preescolar)

### Cuestionario de contexto
De manera concurrente a la aplicación de los EXCALE se aplican cuestionarios de contexto, los cuales indagan factores asociados con el logro educativo. Estos van dirigidos a:
- **cuest_alu**: Alumnos
- **cuest_doc**: Docentes
- **cuest_dir**: Directores
- **cuest_pad**: Padres (sólo preescolar)
