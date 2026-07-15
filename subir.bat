@echo off
title Subir cambios - Aurelia Hair Studio
echo ====================================
echo  Subiendo cambios a GitHub...
echo ====================================
echo.

cd /d "%~dp0"

git add .
git commit -m "Actualizare site %date% %time%"
git push

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
