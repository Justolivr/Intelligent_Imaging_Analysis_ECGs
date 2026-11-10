@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo Building dissertation with MiKTeX
echo ==========================================

echo [1/4] First LaTeX pass...
pdflatex -interaction=nonstopmode -file-line-error main.tex
if errorlevel 1 goto failed

echo [2/4] Processing bibliography with Biber...
biber main
if errorlevel 1 goto failed

echo [3/4] Second LaTeX pass...
pdflatex -interaction=nonstopmode -file-line-error main.tex
if errorlevel 1 goto failed

echo [4/4] Final LaTeX pass (contents, figures, tables, references)...
pdflatex -interaction=nonstopmode -file-line-error main.tex
if errorlevel 1 goto failed

echo.
echo SUCCESS: main.pdf has been built.
echo If the lists are still blank, check that the chapters contain
echo \chapter, \section, and numbered \caption commands as appropriate.
start "" main.pdf
pause
exit /b 0

:failed
echo.
echo BUILD STOPPED: see the error above and main.log.
echo Fix the first LaTeX error, then run this script again.
pause
exit /b 1
