@echo off
title Subir cambios - Aurelia Hair Studio
echo ====================================
echo  Subiendo cambios a GitHub...
echo ====================================
echo.

cd /d "%~dp0"

git add .
git commit -m "Actualizare site %date% %time%"

if exist token.txt (
    set /p TOKEN=<token.txt
    git push https://Niram1234:%TOKEN%@github.com/Niram1234/-AureliaHairStudio.git main
) else (
    echo.
    echo No se encuentra token.txt
    echo Pega tu token de GitHub aqui (ghp_...):
    set /p TOKEN=
    echo %TOKEN% > token.txt
    echo Token guardado en token.txt
    git push https://Niram1234:%TOKEN%@github.com/Niram1234/-AureliaHairStudio.git main
)

echo.
echo ====================================
if %errorlevel% equ 0 (
    echo  CAMBIOS SUBIDOS CON EXITO!
    echo  Cloudflare desplegara la web en ~2 min
) else (
    echo  ERROR: Algo fallo, revisa el mensaje arriba
)
echo ====================================
pause
