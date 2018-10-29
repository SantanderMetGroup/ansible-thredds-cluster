#!/bin/bash

SCENARIOS='devel,tds_standalone,spock'
ROLES='virtualenv-conda,virtualenv,supervisord,httpd,httpd-bin,jk-gateway,jk-gateway-tds,tomcat,tds,tds-modjk'

# Generate intermediate documentation for roles and scenarios
eval pandoc -f markdown -t latex -o r.tex --base-header-level=2 ../roles/{$ROLES}/README.md
eval pandoc -f markdown -t latex -o s.tex --base-header-level=2 ../scenarios/{$SCENARIOS}/README.md

PANDOC_VARS="-V documentclass=article 
             -V numbersections 
	     -V graphics"

PANDOC_OPTS="--template template.latex"

pandoc $PANDOC_OPTS $PANDOC_VARS -s -f latex -t latex -o tmp.tex {doc,titles/roles-reference,r,titles/scenarios-reference,s}.tex
pandoc $PANDOC_OPTS $PANDOC_VARS -s --toc -f latex -o doc.pdf {doc,titles/roles-reference,r,titles/scenarios-reference,s}.tex

