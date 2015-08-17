#!/bin/bash
file=$1
echo generating html... "${file%.*}"
asciidoctor -b html5 -d book -a "data-uri!" -a source-highlighter=coderay -a toc2 -r asciidoctor-diagram  $file

echo Green generating pdf by asciidoctor-pdf with thema ...
asciidoctor -o "${file%.*}.pdf" -a "pdf-fontsdir=fonts" -r asciidoctor-pdf-cjk -a "pdf-stylesdir=pdf-style" -a "pdf-style=basic-theme.yml" -b pdf  -a toc  -r asciidoctor-pdf -d book -a "data-uri!" -a "source-highlighter=rouge" -r asciidoctor-diagram  $file


# browser-sync start --files="how_to_install_asciidoc.html" --browser chrome --server
# gulp watch --file how_to_install_asciidoc

