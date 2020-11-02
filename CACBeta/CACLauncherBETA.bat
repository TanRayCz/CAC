@echo off
if not exist CACCore mkdir CACCore
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/CACBeta/CACCoreBeta.bat > CACCore\CACCoreBeta.bat 2> nul
call CACCore\CACCoreBeta.bat
