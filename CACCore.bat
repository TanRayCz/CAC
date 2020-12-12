@echo off
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set EXE=steam.exe
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
set o4=;Mods\@Blastcore
cls
color 2
title Arma 3 CAC Launcher
echo.
echo Arma 3 CAC Launcher - discord.gg/4QZcD7b
echo.
echo VERSION: 1.5.5
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo  1 Exile Altis
echo  2 Exile Tanoa
echo  3 Coop PVE
echo  4 King of The Hill TVT
echo  5 Domination PVPVE
echo  6 Antistasi
echo  7 Exile Escape
echo  8 Exile TanoaZ
echo.
echo  9 ENABLE/DISABLE Optional mods
echo.
choice /C 123456789 /M "Choose CAC Server"
IF ERRORLEVEL 9 GOTO StatusChanger
IF ERRORLEVEL 8 GOTO ExileTanoaZ
IF ERRORLEVEL 7 GOTO ExileEscape
IF ERRORLEVEL 6 GOTO Antistasi
IF ERRORLEVEL 5 GOTO Domination
IF ERRORLEVEL 4 GOTO KingofTheHill
IF ERRORLEVEL 3 GOTO Coop
IF ERRORLEVEL 2 GOTO ExileTanoa
IF ERRORLEVEL 1 GOTO ExileAltis

:ExileAltis
set ExileAltis=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileAltisEXTENDED
%A1% -port=2302 "%ExileAltis%"
GOTO End
:ExileAltisEXTENDED
cls
color 6
echo  Exile Altis
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Blastcore
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + Blastcore
echo  6 - JSRS_SOUNDMOD + Blastcore
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + Blastcore

choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 5 goto ExileAltisEXTENDED_7
IF ERRORLEVEL 5 goto ExileAltisEXTENDED_6
IF ERRORLEVEL 5 goto ExileAltisEXTENDED_5
IF ERRORLEVEL 4 goto ExileAltisEXTENDED_4
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
%A1% -port=2302 "%ExileAltis%%o4%"
GOTO End
:ExileAltisEXTENDED_4
%A1% -port=2302 "%ExileAltis%%o1%%o2%"
GOTO End
:ExileAltisEXTENDED_5
%A1% -port=2302 "%ExileAltis%%o1%%o4%"
GOTO End
:ExileAltisEXTENDED_6
%A1% -port=2302 "%ExileAltis%%o2%%o4%"
GOTO End
:ExileAltisEXTENDED_7
%A1% -port=2302 "%ExileAltis%%o1%%o2%%o4%"
GOTO End

:ExileTanoa
set ExileTanoa=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaEXTENDED
%A1% -port=2602 "%ExileTanoa%"
GOTO End
:ExileTanoaEXTENDED
cls
color 6
echo Exile Tanoa
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Blastcore
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + Blastcore
echo  6 - JSRS_SOUNDMOD + Blastcore
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + Blastcore
choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 5 goto ExileTanoaEXTENDED_7
IF ERRORLEVEL 5 goto ExileTanoaEXTENDED_6
IF ERRORLEVEL 5 goto ExileTanoaEXTENDED_5
IF ERRORLEVEL 4 goto ExileTanoaEXTENDED_4
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
%A1% -port=2602 "%ExileTanoa%%o5%"
GOTO End
:ExileTanoaEXTENDED_4
%A1% -port=2602 "%ExileTanoa%%o1%%o2%"
GOTO End
:ExileTanoaEXTENDED_5
%A1% -port=2602 "%ExileTanoa%%o1%%o4%"
GOTO End
:ExileTanoaEXTENDED_6
%A1% -port=2602 "%ExileTanoa%%o2%%o4%"
GOTO End
:ExileTanoaEXTENDED_7
%A1% -port=2602 "%ExileTanoa%%o1%%o2%%o4%"

:Coop
set Coop=-mod=Mods\@ace;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort;Mods\@Vindicta;Mods\@CHViewDistance;Mods\@VET_Unflipping;Mods\@AdvancedRappelling
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
echo  7 - Blastcore
echo  8 - ShackTac User Interface + Blastcore
echo  9 - JSRS_SOUNDMOD + Blastcore
echo  0 - JSRS_SOUNDMOD + ShackTac User Interface + Blastcore
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
set ExileTanoaZ=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@ZombiesAndDemons;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaZEXTENDED
%A1% -port=3402 "%ExileTanoaZ%"
GOTO End

:ExileTanoaZEXTENDED
cls
color 6
echo Exile TanoaZ
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Blastcore
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + Blastcore
echo  6 - JSRS_SOUNDMOD + Blastcore
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + Blastcore
choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 5 goto ExileTanoaZEXTENDED_7
IF ERRORLEVEL 5 goto ExileTanoaZEXTENDED_6
IF ERRORLEVEL 5 goto ExileTanoaZEXTENDED_5
IF ERRORLEVEL 4 goto ExileTanoaZEXTENDED_4
IF ERRORLEVEL 3 goto ExileTanoaZEXTENDED_3
IF ERRORLEVEL 2 goto ExileTanoaZEXTENDED_2
IF ERRORLEVEL 1 goto ExileTanoaZEXTENDED_1

ExileTanoaZEXTENDED_1
%A1% -port=3402 "%ExileTanoaZ%%o1%"
GOTO End
ExileTanoaZEXTENDED_2
%A1% -port=3402 "%ExileTanoaZ%%o2%"
GOTO End
:ExileTanoaZEXTENDED_3
%A1% -port=3402 "%ExileTanoaZ%%o4%"
GOTO End
:ExileTanoaZEXTENDED_4
%A1% -port=3402 "%ExileTanoaZ%%o1%%o2%"
GOTO End
:ExileTanoaZEXTENDED_5
%A1% -port=3402 "%ExileTanoaZ%%o1%%o4%"
GOTO End
:ExileTanoaZEXTENDED_6
%A1% -port=3402 "%ExileTanoaZ%%o2%%o4%"
GOTO End
:ExileTanoaZEXTENDED_7
%A1% -port=3402 "%ExileTanoaZ%%o1%%o2%%o4%"
GOTO End

:Domination
set Domination=-mod=Mods\@ace;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@AdvancedUrbanRappelling;Mods\@MfHealAbort;Mods\@VET_Unflipping
if %Status%==ENABLED goto DominationEXTENDED
%A1% -port=2342 "%Domination%"
GOTO End

:DominationEXTENDED
cls
color 6
echo Domination
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - ShackTac User Interface
echo  4 - Blastcore
echo  5 - Advanced Render Manager + JSRS_SOUNDMOD
echo  6 - Advanced Render Manager + ShackTac User Interface
echo  7 - ShackTac User Interface + JSRS_SOUNDMOD
echo  8 - Advanced Render Manager + JSRS_SOUNDMOD + ShackTac User Interface
echo  9 - JSRS_SOUNDMOD + Blastcore + ShackTac User Interface
echo  0 - Advanced Render Manager + JSRS_SOUNDMOD + ShackTac User Interface + Blastcore
choice /C 1234567890 /M "Choose your mods"
IF ERRORLEVEL 7 goto DominationEXTENDED_0
IF ERRORLEVEL 7 goto DominationEXTENDED_9
IF ERRORLEVEL 7 goto DominationEXTENDED_8
IF ERRORLEVEL 7 goto DominationEXTENDED_7
IF ERRORLEVEL 6 goto DominationEXTENDED_6
IF ERRORLEVEL 5 goto DominationEXTENDED_5
IF ERRORLEVEL 4 goto DominationEXTENDED_4
IF ERRORLEVEL 3 goto DominationEXTENDED_3
IF ERRORLEVEL 2 goto DominationEXTENDED_2
IF ERRORLEVEL 1 goto DominationEXTENDED_1

:DominationEXTENDED_1
%A1% -port=2342 "%Domination%"%o1%
GOTO End

:DominationEXTENDED_2
%A1% -port=2342 "%Domination%%o2%"
GOTO End

:DominationEXTENDED_3
%A1% -port=2342 "%Domination%%o3%"
GOTO End

:DominationEXTENDED_4
%A1% -port=2342 "%Domination%%o4%"
GOTO End

:DominationEXTENDED_5
%A1% -port=2342 "%Domination%%o1%%o2%"
GOTO End

:DominationEXTENDED_6
%A1% -port=2342 "%Domination%%o3%%o1%"
GOTO End

:DominationEXTENDED_7
%A1% -port=2342 "%Domination%%o3%%o2%"
GOTO End

:DominationEXTENDED_8
%A1% -port=2342 "%Domination%%o4%%o3%%o2%%o1%"
GOTO End

:DominationEXTENDED_9
%A1% -port=2342 "%Domination%%o4%%o3%%o2%"
GOTO End

:DominationEXTENDED_0
%A1% -port=2342 "%Domination%%o4%%o3%%o2%%o1%"
GOTO End

:Antistasi
set Antistasi=-mod=Mods\@CBA_A3;Mods\@Anizay;Mods\@KunduzAfgFD;Mods\@TembelanIsland;Mods\@VirolahtiValtatie7;Mods\@CUPTerrainsCore;Mods\@CUPTerrainsMaps;Mods\@DSHouses;Mods\@InteriorsforCUP;Mods\@SM_Sheds;Mods\@RHSAFRF;Mods\@RHSGREF;Mods\@RHSUSAF;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort;Mods\@VET_Unflipping;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling
if %Status%==ENABLED goto AntistasisEXTENDED
%A1% -port=3302 "%Antistasi%"
GOTO End

:AntistasiEXTENDED
cls
color 6
echo Antistasi
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Blastcore
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + Blastcore
echo  6 - JSRS_SOUNDMOD + Blastcore
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + Blastcore
choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 5 goto AntistasiEXTENDED_7
IF ERRORLEVEL 5 goto AntistasiEXTENDED_6
IF ERRORLEVEL 5 goto AntistasiEXTENDED_5
IF ERRORLEVEL 4 goto AntistasiEXTENDED_4
IF ERRORLEVEL 3 goto AntistasiEXTENDED_3
IF ERRORLEVEL 2 goto AntistasiEXTENDED_2
IF ERRORLEVEL 1 goto AntistasiEXTENDED_1

:AntistasiEXTENDED_1
%A1% -port=3302 "%Antistasi%%o1%"
GOTO End
:AntistasiEXTENDED_2
%A1% -port=3302 "%Antistasi%%o2%"
GOTO End
:AntistasiEXTENDED_3
%A1% -port=3302 "%Antistasi%%o4%"
GOTO End
:AntistasiEXTENDED_4
%A1% -port=3302 "%Antistasi%%o1%%o2%"
GOTO End
:AntistasiEXTENDED_5
%A1% -port=3302 "%Antistasi%%o1%%o4%"
GOTO End
:AntistasiEXTENDED_6
%A1% -port=3302 "%Antistasi%%o2%%o4%"
GOTO End
:AntistasiEXTENDED_7
%A1% -port=3302 "%Antistasi%%o1%%o2%%o4%"
GOTO End

:ExileEscape
set ExileEscape=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework%o1%
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
set KOTH=-mod=Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort
if %Status%==ENABLED goto KOTHEXTENDED
%A1% -port=2322 "%KOTH%" 
GOTO End
:KOTHEXTENDED
cls
color 6
echo King of The Hill
echo  1 - Advanced Render Manager
echo  2 - JSRS_SOUNDMOD
echo  3 - Blastcore
echo  4 - Advanced Render Manager + JSRS_SOUNDMOD
echo  5 - Advanced Render Manager + Blastcore
echo  6 - JSRS_SOUNDMOD + Blastcore
echo  7 - Advanced Render Manager + JSRS_SOUNDMOD + Blastcore
choice /C 1234567 /M "Choose your mods"
IF ERRORLEVEL 5 goto KOTHEXTENDED_7
IF ERRORLEVEL 5 goto KOTHEXTENDED_6
IF ERRORLEVEL 5 goto KOTHEXTENDED_5
IF ERRORLEVEL 4 goto KOTHEXTENDED_4
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
%A1% -port=2322 "%KOTH%%o4%"
GOTO End
:KOTHEXTENDED_4
%A1% -port=2322 "%KOTH%%o1%%o2%"
GOTO End
:KOTHEXTENDED_5
%A1% -port=2322 "%KOTH%%o1%%o4%"
GOTO End
:KOTHEXTENDED_6
%A1% -port=2322 "%KOTH%%o2%%o4%"
GOTO End
:KOTHEXTENDED_7
%A1% -port=2322 "%KOTH%%o1%%o2%%o4%"
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
