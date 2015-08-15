#!/bin/bash
if [ -z "$1" ]; then
                echo "ERROR:no argument(asciidoc)"
                echo "USE: live_reload.sh asciidoc"
                exit;
else
        echo start watch $1 and generate documents...
        browser-sync start --files="$1.html" --browser chrome --server &
        gulp watch --file $1
fi

