#!/bin/sh

tempdir=`mktemp -d --tmpdir=/tmp`



pdflatex $1.tex
pdflatex $1.tex



sed 's/\\input{notes.tex}/\\input{notes.tex}\n\\settoggle{full}{false}\n\\settoggle{presentable}{true}/g' $1.tex > ${tempdir}/$1_skeleton.tex
pdflatex ${tempdir}/$1_skeleton.tex
pdflatex ${tempdir}/$1_skeleton.tex


sed 's/\\input{notes.tex}/\\input{notes.tex}\n\\settoggle{full}{false}\n\\settoggle{presentable}{true}\n\\settoggle{dualscreen}{true}/g' $1.tex >  ${tempdir}/$1_presentation.tex

pdflatex ${tempdir}/$1_presentation.tex
pdflatex ${tempdir}/$1_presentation.tex

rm *.aux
rm *.log
rm *.nav
rm *.toc
rm *.snm
rm *.out
rm *.notes
rm *.synctex*
