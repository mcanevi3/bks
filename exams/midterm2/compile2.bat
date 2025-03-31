@echo off
pdflatex --shell-escape main2
pdflatex --shell-escape main2
del *.gnuplot
del *.table
del *.aux
del *.log
