@echo off
REM Media de números
REM Autor: Miguel Pérez-Montes Lozan
REM Fecha: 18/11/2024

set /a suma=%1 + %2 + %3

set /a media= suma/3
echo La media de %1, %2 y %3 es %media%