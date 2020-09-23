@echo off
IF EXIST "CACCore.bat" DEL /Q "CACCore.bat"
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/CACCore.bat > CACCore.bat
call CACCore.bat
