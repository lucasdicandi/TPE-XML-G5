#ALUMNOS:

nombre - leggajo


# Proyecto NASCAR Data

## Descripción
Este proyecto tiene como objetivo extraer y generar reportes de datos de NASCAR para la temporada de un año específico. 
Utiliza XSLT para la transformación de datos XML y scripts bash para la automatización de tareas.

## Estructura del Proyecto
El proyecto contiene los siguientes componentes clave:

- `nascar_data.xsd`: Esquema XML que define la estructura de los datos NASCAR.
- `tpe.sh`: Script bash para ejecutar el pipeline de extracción y procesamiento de datos.
- `clean.sh`: Script bash para limpiar los datos extraídos.
- `extract_nascar_data.xq`: Script XQuery para extraer datos específicos de los archivos XML de NASCAR.
- `generate_fo.xsl`: Hoja de estilo XSLT para transformar los datos XML en un formato legible y generar un reporte en formato FO (Formatting Objects).

## Uso
### Ejecución del Pipeline de Datos
Para ejecutar el pipeline completo de extracción y procesamiento de datos, utiliza el script `tpe.sh`:
```bash
./tpe.sh <ano> <serie>
