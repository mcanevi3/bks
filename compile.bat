@echo off
pdflatex --shell-escape 1
pdflatex --shell-escape 1
del *.gnuplot
del *.table
del *.aux
del *.log
