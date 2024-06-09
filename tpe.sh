#!/bin/bash

# Verificar que se proporcionaron dos argumentos
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <ano> <serie>"
    echo "Ejemplo: $0 2019 sc"
    exit 1
fi

ANO=$1
SERIE=$2
API_KEY="HQ9kLzepvD11uKOfuEe8mbVuDTFwOu01FuG4I558"
FOP_JAR="./fop/lib/fop.jar"

# Validar el ano
if ! [[ "$ANO" =~ ^[0-9]{4}$ ]] || [ "$ANO" -lt 2013 ] || [ "$ANO" -gt 2024 ]; then
    echo "El ano debe ser un número entre 2013 y 2024."
    exit 1
fi

# Validar la serie
if ! [[ "$SERIE" =~ ^(sc|xf|cw|go|mc)$ ]]; then
    echo "La serie debe ser una de las siguientes: sc, xf, cw, go, mc."
    exit 1
fi

# Descargar los archivos XML
curl "https://api.sportradar.com/nascar-ot3/$SERIE/$ANO/standings/drivers.xml?api_key=$API_KEY" -o drivers_standings.xml
curl "https://api.sportradar.com/nascar-ot3/$SERIE/$ANO/drivers/list.xml?api_key=$API_KEY" -o drivers_list.xml

# Ejecutar las consultas y transformaciones XQuery y XSLT
java net.sf.saxon.Query extract_nascar_data.xq -o:nascar_data.xml
java net.sf.saxon.Transform -s:nascar_data.xml -xsl:generate_fo.xsl -o:nascar_page.fo

# Generar el reporte PDF usando Apache FOP
./fop/fop.cmd -fo nascar_page.fo -pdf nascar_report.pdf

echo "Reporte NASCAR generado exitosamente: nascar_report.pdf"