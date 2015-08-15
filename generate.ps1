param($file="README")

write-host -for Green generating html...
asciidoctor -b html5 -d book -a "data-uri!" -a "source-highlighter=coderay" -a toc2 -r asciidoctor-diagram  ".\${file}.adoc"

write-host -for Green generating pdf by asciidoctor-pdf with thema ...
asciidoctor -o ".\${file}_pdf_thema.pdf" -a "pdf-fontsdir=fonts" -a "pdf-stylesdir=pdf-style" -a "pdf-style=basic-theme.yml" -b pdf  -a toc  -r asciidoctor-pdf -d book -a "data-uri!" -a "source-highlighter=rouge" -r asciidoctor-diagram  ".\${file}.adoc"


# browser-sync start --files="how_to_install_asciidoc.html" --browser chrome --server
# gulp watch --file how_to_install_asciidoc

