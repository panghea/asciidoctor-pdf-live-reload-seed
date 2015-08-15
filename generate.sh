#!/bin/bash
echo generating html... $1
asciidoctor -b html5 -d book -a "data-uri!" -a source-highlighter=coderay -a toc2 -r asciidoctor-diagram  "$1.adoc"

echo Green generating pdf by asciidoctor-pdf with thema ...
asciidoctor -o "$1.pdf" -a "pdf-fontsdir=fonts" -r asciidoctor-pdf-cjk -a "pdf-stylesdir=pdf-style" -a "pdf-style=basic-theme.yml" -b pdf  -a toc  -r asciidoctor-pdf -d book -a "data-uri!" -a "source-highlighter=rouge" -r asciidoctor-diagram  "$1.adoc"


# browser-sync start --files="how_to_install_asciidoc.html" --browser chrome --server
# gulp watch --file how_to_install_asciidoc

