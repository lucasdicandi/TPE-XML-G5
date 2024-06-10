#!/bin/bash

echo "Eliminando Archivos..."
# Eliminar archivos específicos
rm -f drivers_list.xml
rm -f drivers_standings.xml
rm -f nascar_data.xml
rm -f nascar_page.fo
rm -f nascar_report.pdf
rm -f fop_output.log

echo "Archivos eliminados exitosamente."