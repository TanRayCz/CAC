@echo off
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set EXE=SteamService.exe
if not exist "CACCore" md "CACCore"
if not exist CACCore\memory2.txt echo set Status=DISABLED > CACCore\memory2.txt
for /f "usebackq delims=" %%A in (CACCore\memory2.txt) do %%A
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY
:LOAD
if exist "C:\Program Files (x86)\Steam\steam.exe" goto DEFAULT
if exist "CACCore\memory.txt" goto CUSTOM
color 6
echo.
echo SEARCHING FOR STEAM DIRECTORY, PLEASE WAIT
(
   for %%a in ( a b c d e f g h i j k l m n o p q r s t u v w x y z ) do (
      if exist "%%a:\" dir "%%a:\Steam.exe" /b /s /a-d 2> nul
   )
)>CACCore\memory.txt
cls
set /p SteamPath=<CACCore\memory.txt
if not exist "%SteamPath%" goto FINDFAIL
color 2
echo.
echo STEAM FOUND AT
type CACCore\memory.txt
timeout /t 4
goto CUSTOM

:DEFAULT
cls
color 6
echo.
echo STEAM IS NOT RUNNING, ATTEMPTING TO RUN STEAM
start "" "C:\Program Files (x86)\Steam\steam.exe" -silent
timeout /t 8
cls
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY2
goto FAIL

:CUSTOM
cls
color 6
echo.
echo STEAM IS NOT RUNNING, ATTEMPTING TO RUN STEAM
set /p SteamPath=<CACCore\memory.txt
start "" "%SteamPath%" -silent
timeout /t 8
cls
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY2
goto FAIL

:FAIL
color 4
cls
echo.
echo FAILED TO LAUNCH STEAM, TRYING AGAIN... LAUNCH STEAM MANUALLY IF ISSUE PERSISTS.
timeout /t 5
goto LOAD

:FINDFAIL
IF EXIST "CACCore\memory.txt" DEL /Q "CACCore\memory.txt"
cls
echo.
echo FAILED TO FIND STEAM
echo.
echo  1 Enter Steam.exe path
echo  2 Exit
echo.
choice /C 12 
IF ERRORLEVEL 2 GOTO FINDEXIT
IF ERRORLEVEL 1 GOTO MANUAL
:MANUAL
cls
echo. & echo Please enter path of your steam.exe. (Example: "C:\Steam.exe") & echo.
set /p UserInput=Steam Directory: (Please use "" brackets): 
(echo=%UserInput%) > "CACCore\memory.txt"
:FINDEXIT
exit

:READY2
cls
color 2
echo.
echo STEAM LAUNCHED SUCCESSFULLY
goto START

:READY
cls
color 2
echo.
echo STEAM IS RUNNING
goto START

:START
set A1=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -connect=cacservers.ddns.net
set o1=;Mods\@ARM
set o2=;Mods\@JSRS_SOUNDMOD
set o3=;Mods\@ShackTacUI
set o4=;Mods\@ZeusEnhanced
cls
color 2
title Arma 3 CAC Launcher
echo.
echo Arma 3 CAC Launcher - discord.gg/4QZcD7b
echo.
echo VERSION: 1.5.0
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo  1 Exile Altis
echo  2 Exile Tanoa
echo  3 Coop
echo  4 King of The Hill
echo  5 Ravage Malden
echo  6 Exile Chernarus Isles
echo  7 Exile Escape
echo  8 Exile TanoaZ
echo.
echo  9 ENABLE/DISABLE Optional mods
echo.
choice /C 123456789 /M "Choose CAC Server"
IF ERRORLEVEL 9 GOTO StatusChanger
IF ERRORLEVEL 8 GOTO ExileTanoaZ
IF ERRORLEVEL 7 GOTO ExileEscape
IF ERRORLEVEL 6 GOTO Chernarus
IF ERRORLEVEL 5 GOTO RavageMalden
IF ERRORLEVEL 4 GOTO KingofTheHill
IF ERRORLEVEL 3 GOTO Coop
IF ERRORLEVEL 2 GOTO ExileTanoa
IF ERRORLEVEL 1 GOTO ExileAltis

:ExileAltis
set ExileAltis=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileAltisEXTENDED
%A1% -port=2302 "%ExileAltis%"
GOTO End
:ExileAltisEXTENDED
cls
color 6
echo  Exile Altis
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto ExileAltisEXTENDED_3
IF ERRORLEVEL 2 goto ExileAltisEXTENDED_2
IF ERRORLEVEL 1 goto ExileAltisEXTENDED_1

:ExileAltisEXTENDED_1
%A1% -port=2302 "%ExileAltis%%o1%"
GOTO End
:ExileAltisEXTENDED_2
%A1% -port=2302 "%ExileAltis%%o2%"
GOTO End
:ExileAltisEXTENDED_3
%A1% -port=2302 "%ExileAltis%%o1%%o2%"
GOTO End

:ExileTanoa
set ExileTanoa=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaEXTENDED
%A1% -port=2602 "%ExileTanoa%"
GOTO End
:ExileTanoaEXTENDED
cls
color 6
echo Exile Tanoa
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto ExileTanoaEXTENDED_3
IF ERRORLEVEL 2 goto ExileTanoaEXTENDED_2
IF ERRORLEVEL 1 goto ExileTanoaEXTENDED_1

:ExileTanoaEXTENDED_1
%A1% -port=2602 "%ExileTanoa%%o1%"
GOTO End
:ExileTanoaEXTENDED_2
%A1% -port=2602 "%ExileTanoa%%o2%"
GOTO End
:ExileTanoaEXTENDED_3
%A1% -port=2602 "%ExileTanoa%%o1%%o2%"
GOTO End

:Coop
set Coop=-mod=Mods\@Ace3;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@MfHealAbort;Mods\@Vindicta;Mods\@CHViewDistance;Mods\@VET_Unflipping%o3%
if %Status%==ENABLED goto CoopEXTENDED
%A1% -port=2702 "%Coop%"
GOTO End

:CoopEXTENDED
cls
color 6
echo Coop
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - ShackTac User Interface
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - JSRS_SOUNDMOD + ShackTac User Interface
echo  6 - Advanced Render Manager + JSRS_SOUNDMOD + ShackTac User Interface
echo  7 - Zeus Enhanced
echo  8 - ShackTac User Interface + Zeus Enhanced
echo  9 - JSRS_SOUNDMOD + Zeus Enhanced
echo  0 - JSRS_SOUNDMOD + ShackTac User Interface + Zeus Enhanced
choice /C 1234567890 /M "Choose your mods"
IF ERRORLEVEL 0 goto CoopEXTENDED_10
IF ERRORLEVEL 9 goto CoopEXTENDED_9
IF ERRORLEVEL 8 goto CoopEXTENDED_8
IF ERRORLEVEL 7 goto CoopEXTENDED_7
IF ERRORLEVEL 6 goto CoopEXTENDED_6
IF ERRORLEVEL 5 goto CoopEXTENDED_5
IF ERRORLEVEL 4 goto CoopEXTENDED_4
IF ERRORLEVEL 3 goto CoopEXTENDED_3
IF ERRORLEVEL 2 goto CoopEXTENDED_2
IF ERRORLEVEL 1 goto CoopEXTENDED_1

:CoopEXTENDED_1
%A1% -port=2702 "%Coop%%o1%"
GOTO End

:CoopEXTENDED_2
%A1% -port=2702 "%Coop%%o2%"
echo %A1% -port=2702 "%Coop%%o2%"
pause
GOTO End

:CoopEXTENDED_3
%A1% -port=2702 "%Coop%%o3%"
GOTO End

:CoopEXTENDED_4
%A1% -port=2702 "%Coop%%o1%%o2%"
GOTO End

:CoopEXTENDED_5
%A1% -port=2702 "%Coop%%o2%%o3%"
GOTO End

:CoopEXTENDED_6
%A1% -port=2702 "%Coop%%o1%%o2%%o3%"
GOTO End

:CoopEXTENDED_7
%A1% -port=2702 "%Coop%%o4%"
GOTO End

:CoopEXTENDED_8
%A1% -port=2702 "%Coop%%o3%%o4%"
GOTO End

:CoopEXTENDED_9
%A1% -port=2702 "%Coop%%o2%%o4%"
GOTO End

:CoopEXTENDED_10
%A1% -port=2702 "%Coop%%o2%%o3%%o4%"
GOTO End

:ExileTanoaZ
set ExileTanoaZ=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@ZombiesAndDemons;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaZEXTENDED
%A1% -port=3402 "%ExileTanoaZ%"
GOTO End

:ExileTanoaZEXTENDED
cls
color 6
echo Exile TanoaZ
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto ExileTanoaZEXTENDED_3
IF ERRORLEVEL 2 goto ExileTanoaZEXTENDED_2
IF ERRORLEVEL 1 goto ExileTanoaZEXTENDED_1

ExileTanoaZEXTENDED_1
%A1% -port=3402 "%ExileTanoaZ%%o1%"
GOTO End
ExileTanoaZEXTENDED_2
%A1% -port=3402 "%ExileTanoaZ%%o2%"
GOTO End
ExileTanoaZEXTENDED_3
%A1% -port=3402 "%ExileTanoaZ%%o1%%o2%"
GOTO End

:RavageMalden
set RavageMalden=-mod=Mods\@CBA_A3;Mods\@Vandeanson'sApocalypse;Mods\@Ravage;Mods\@ACE_No_medical;Mods\@VET_Unflipping;Mods\@EnhancedMovement
if %Status%==ENABLED goto RavageMaldenEXTENDED
%A1% -port=2342 "%RavageMalden%"
GOTO End

:RavageMaldenEXTENDED
cls
color 6
echo Ravage Malden
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - ShackTac User Interface
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + ShackTac User Interface
echo  6 - ShackTac User Interface + JSRS_SOUNDMOD
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + ShackTac User Interface
choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 7 goto RavageMaldenEXTENDED_7
IF ERRORLEVEL 6 goto RavageMaldenEXTENDED_6
IF ERRORLEVEL 5 goto RavageMaldenEXTENDED_5
IF ERRORLEVEL 4 goto RavageMaldenEXTENDED_4
IF ERRORLEVEL 3 goto RavageMaldenEXTENDED_3
IF ERRORLEVEL 2 goto RavageMaldenEXTENDED_2
IF ERRORLEVEL 1 goto RavageMaldenEXTENDED_1

:RavageMaldenEXTENDED_1
%A1% -port=2342 "%RavageMalden%"%o1%
GOTO End

:RavageMaldenEXTENDED_2
%A1% -port=2342 "%RavageMalden%%o2%"
GOTO End

:RavageMaldenEXTENDED_3
%A1% -port=2342 "%RavageMalden%%o3%"
GOTO End

:RavageMaldenEXTENDED_4
%A1% -port=2342 "%RavageMalden%%o1%%o2%"
GOTO End

:RavageMaldenEXTENDED_5
%A1% -port=2342 "%RavageMalden%%o3%%o1%"
GOTO End

:RavageMaldenEXTENDED_6
%A1% -port=2342 "%RavageMalden%%o3%%o2%"
GOTO End

:RavageMaldenEXTENDED_7
%A1% -port=2342 "%RavageMalden%%o3%%o2%%o1%"
GOTO End

:Chernarus
set Chernarus=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@CUPTerrainsCore;Mods\@CUPTerrainsMaps;Mods\@ChernarusIsles;Mods\@DSHouses;Mods\@InteriorsforCUP;Mods\@SM_Sheds;Mods\@CUPUnits;Mods\@CUPVehicles;Mods\@CUPWeapons;Mods\@Extended_Base_Mod;Mods\@DualArms;Mods\@AdvancedUrbanRappelling;Mods\@MfHealAbort;Mods\@EnhancedMovement
if %Status%==ENABLED goto ChernarusEXTENDED
%A1% -port=3302 "%Chernarus%"
GOTO End

:ChernarusEXTENDED
cls
color 6
echo Exile Chernarus Isles
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto ChernarusEXTENDED_3
IF ERRORLEVEL 2 goto ChernarusEXTENDED_2
IF ERRORLEVEL 1 goto ChernarusEXTENDED_1

:ChernarusEXTENDED_1
%A1% -port=3302 "%Chernarus%%o1%"
GOTO End
:ChernarusEXTENDED_2
%A1% -port=3302 "%Chernarus%%o2%"
GOTO End
:ChernarusEXTENDED_3
%A1% -port=3302 "%Chernarus%%o1%%o2%"
GOTO End

:ExileEscape
set ExileEscape=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement%o1%
if %Status%==ENABLED goto ExileEscapeEXTENDED
%A1% -port=2372 "%ExileEscape%"
GOTO End

:ExileEscapeEXTENDED
cls
color 6
echo Exile Escape
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto ExileEscapeEXTENDED_3
IF ERRORLEVEL 2 goto ExileEscapeEXTENDED_2
IF ERRORLEVEL 1 goto ExileEscapeEXTENDED_1

:ExileEscapeEXTENDED_1
%A1% -port=2372 "%ExileEscape%%o1%"
GOTO End
:ExileEscapeEXTENDED_2
%A1% -port=2372 "%ExileEscape%%o2%"
GOTO End
:ExileEscapeEXTENDED_3
%A1% -port=2372 "%ExileEscape%%o1%%o2%"
GOTO End

:KingofTheHill
set KOTH=-mod=Mods\@EnhancedMovement;Mods\@MfHealAbort
if %Status%==ENABLED goto KOTHEXTENDED
%A1% -port=2322 "%KOTH%" 
GOTO End
:KOTHEXTENDED
cls
color 6
echo King of The Hill
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Advanced Render Manager + JSRS_SOUNDMOD
choice /C 123 /M "Choose your mods"
IF ERRORLEVEL 3 goto KOTHEXTENDED_3
IF ERRORLEVEL 2 goto KOTHEXTENDED_2
IF ERRORLEVEL 1 goto KOTHEXTENDED_1

:KOTHEXTENDED_1
%A1% -port=2322 "%KOTH%%o1%"
GOTO End
:KOTHEXTENDED_2
%A1% -port=2322 "%KOTH%%o2%"
GOTO End
:KOTHEXTENDED_3
%A1% -port=2322 "%KOTH%%o1%%o2%"
GOTO End

:StatusChanger
color 6
cls
echo  1 ENABLE
echo  2 DISABLE
echo.
choice /C 12
IF ERRORLEVEL 2 GOTO MODDISABLE
IF ERRORLEVEL 1 GOTO MODENABLE

:MODENABLE
if exist CACCore\memory2.txt del CACCore\memory2.txt
>>CACCore\memory2.txt Echo set Status=ENABLED
set Status=ENABLED
cls
goto START

:MODDISABLE
if exist CACCore\memory2.txt del CACCore\memory2.txt
>>CACCore\memory2.txt Echo set Status=DISABLED
set Status=DISABLED
cls
goto START

:End
