@echo off
set local=1.0
set localtwo=%local%
set link=https://raw.githubusercontent.com/TanRayCz/CAC/master/CACCore2.bat
:check
IF EXIST "CACCore.bat" DEL /Q "CACCore.bat"
goto :download
pause
:download
download %link% CACCore.bat
CALL "CACCore.bat"
