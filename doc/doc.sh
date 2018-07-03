#!/bin/bash

SCENARIOS='devel-jk,tds_standalone'
ROLES='virtualenv-conda,virtualenv,supervisord,httpd,httpd-bin,jk-gateway,tomcat,tds,tds-jk'

# Generate intermediate documentation for roles and scenarios
eval pandoc -f markdown -t latex -o r.tex --base-header-level=2 ../roles/{$ROLES}/README.md
eval pandoc -f markdown -t latex -o s.tex --base-header-level=2 ../scenarios/zequi/{$SCENARIOS}/README.md

pandoc -f latex -t latex -o d.tex doc.tex

PANDOC_VARS="-V documentclass=article -V numbersections -V graphics"
PANDOC_OPTS="--template template.latex"
pandoc $PANDOC_OPTS $PANDOC_VARS -f latex -t latex -o tmp.tex -s {d,r,s}.tex
pandoc $PANDOC_OPTS $PANDOC_VARS -s --toc -f latex -o doc.pdf {d,titles/roles-reference,r,titles/scenarios-reference,s}.tex

rm {d,r,s}.tex
