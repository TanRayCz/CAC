@echo off
for /f "usebackq delims=" %%A in (CACCore\memory2.txt) do %%A
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set EXE=SteamService.exe
if not exist "CACCore" md "CACCore"
if not exist CACCore\memory2.txt echo set Status=DISABLED > CACCore\memory2.txt
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
set A1=start "" /normal arma3_x64 -connect=cacservers.ddns.net
set A2=-skipIntro -noSplash -world=empty -exThreads=7 -enableHT
set o1=;Mods\@ARM
set o2=;Mods\@JSRS_SOUNDMOD
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
%1% -connect=cacservers.ddns.net -port=2302 %2% "%ExileAltis%"
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
%1% -connect=cacservers.ddns.net -port=2302 %2% "%ExileAltis%;Mods\@ARM"
GOTO End
:ExileAltisEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2302 %2% "%ExileAltis%;Mods\@JSRS_SOUNDMOD"
GOTO End
:ExileAltisEXTENDED_3
echo %1% -connect=cacservers.ddns.net -port=2302 %2% "%ExileAltis%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
pause
%1% -connect=cacservers.ddns.net -port=2302 %2% "%ExileAltis%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:ExileTanoa
set ExileTanoa=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaEXTENDED
%1% -connect=cacservers.ddns.net -port=2602 %2% "%ExileTanoa%"
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
%1% -connect=cacservers.ddns.net -port=2602 %2% "%ExileTanoa%;Mods\@ARM"
GOTO End
:ExileTanoaEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2602 %2% "%ExileTanoa%;Mods\@JSRS_SOUNDMOD"
GOTO End
:ExileTanoaEXTENDED_3
%1% -connect=cacservers.ddns.net -port=2602 %2% "%ExileTanoa%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:Coop
set Coop=-mod=Mods\@Ace3;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@MfHealAbort;Mods\@Vindicta;Mods\@ShackTacUI;Mods\@CHViewDistance;Mods\@VET_Unflipping
if %Status%==ENABLED goto CoopEXTENDED
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%"
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

CoopEXTENDED_1
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ARM"
GOTO End

CoopEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@JSRS_SOUNDMOD"
GOTO End

CoopEXTENDED_3
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

CoopEXTENDED_4
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ARM;Mods\@ShackTacUI"
GOTO End

CoopEXTENDED_5
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@JSRS_SOUNDMOD;Mods\@ShackTacUI"
GOTO End

CoopEXTENDED_6
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ARM;Mods\@JSRS_SOUNDMOD;Mods\@ShackTacUI"
GOTO End

CoopEXTENDED_7
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ZeusEnhanced"
GOTO End

CoopEXTENDED_8
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@ShackTacUI;Mods\@ZeusEnhanced"
GOTO End

CoopEXTENDED_9
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@JSRS_SOUNDMOD;Mods\@ZeusEnhanced"
GOTO End

CoopEXTENDED_10
%1% -connect=cacservers.ddns.net -port=2702 %2% "%Coop%;Mods\@JSRS_SOUNDMOD;Mods\@ShackTacUI;Mods\@ZeusEnhanced"
GOTO End

:ExileTanoaZ
set ExileTanoaZ=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@ZombiesAndDemons;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank
if %Status%==ENABLED goto ExileTanoaZEXTENDED
%1% -connect=cacservers.ddns.net -port=3402 %2% "%ExileTanoaZ%"
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
%1% -connect=cacservers.ddns.net -port=3402 %2% "%ExileTanoaZ%;Mods\@ARM"
GOTO End
ExileTanoaZEXTENDED_2
%1% -connect=cacservers.ddns.net -port=3402 %2% "%ExileTanoaZ%;Mods\@JSRS_SOUNDMOD"
GOTO End
ExileTanoaZEXTENDED_3
%1% -connect=cacservers.ddns.net -port=3402 %2% "%ExileTanoaZ%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:RavageMalden
set RavageMalden=-mod=Mods\@CBA_A3;Mods\@VA_Beta;Mods\@Ravage;Mods\@ACE_No_medical;Mods\@VET_Unflipping;Mods\@EnhancedMovement
if %Status%==ENABLED goto RavageMaldenEXTENDED
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%"
GOTO End

:RavageMaldenEXTENDED
:: THERE IS NO OPTION FOR ALL OPTIONAL MODS
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
IF ERRORLEVEL 7 goto ChernarusEXTENDED_7
IF ERRORLEVEL 6 goto ChernarusEXTENDED_6
IF ERRORLEVEL 5 goto ChernarusEXTENDED_5
IF ERRORLEVEL 4 goto ChernarusEXTENDED_4
IF ERRORLEVEL 3 goto ChernarusEXTENDED_3
IF ERRORLEVEL 2 goto ChernarusEXTENDED_2
IF ERRORLEVEL 1 goto ChernarusEXTENDED_1

:ChernarusEXTENDED_1
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%";Mods\@ARM
GOTO End

:ChernarusEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@JSRS_SOUNDMOD"
GOTO End

:ChernarusEXTENDED_3
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@ShackTacUI"
GOTO End

:ChernarusEXTENDED_4
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:ChernarusEXTENDED_5
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@ShackTacUI;Mods\@ARM"
GOTO End

:ChernarusEXTENDED_6
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@ShackTacUI;Mods\@JSRS_SOUNDMOD"
GOTO End

:ChernarusEXTENDED_7
%1% -connect=cacservers.ddns.net -port=2342 %2% "%RavageMalden%;Mods\@ShackTacUI;Mods\@JSRS_SOUNDMOD;Mods\@ARM"
GOTO End

:Chernarus
set Chernarus=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@CUPTerrainsCore;Mods\@CUPTerrainsMaps;Mods\@ChernarusIsles;Mods\@DSHouses;Mods\@InteriorsforCUP;Mods\@SM_Sheds;Mods\@CUPUnits;Mods\@CUPVehicles;Mods\@CUPWeapons;Mods\@Extended_Base_Mod;Mods\@DualArms;Mods\@AdvancedUrbanRappelling;Mods\@MfHealAbort;Mods\@EnhancedMovement
if %Status%==ENABLED goto ChernarusEXTENDED
%1% -connect=cacservers.ddns.net -port=3302 %2% "%Chernarus%"
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
%1% -connect=cacservers.ddns.net -port=3302 %2% "%Chernarus%;Mods\@ARM"
GOTO End
:ChernarusEXTENDED_2
%1% -connect=cacservers.ddns.net -port=3302 %2% "%Chernarus%;Mods\@JSRS_SOUNDMOD"
GOTO End
:ChernarusEXTENDED_3
%1% -connect=cacservers.ddns.net -port=3302 %2% "%Chernarus%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:ExileEscape
set ExileEscape=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@ARM
if %Status%==ENABLED goto ExileEscapeEXTENDED
%1% -connect=cacservers.ddns.net -port=2372 %2% "%ExileEscape%"
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
%1% -connect=cacservers.ddns.net -port=2372 %2% "%ExileEscape%;Mods\@ARM"
GOTO End
:ExileEscapeEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2372 %2% "%ExileEscape%;Mods\@JSRS_SOUNDMOD"
GOTO End
:ExileEscapeEXTENDED_3
%1% -connect=cacservers.ddns.net -port=2372 %2% "%ExileEscape%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
GOTO End

:KingofTheHill
set KOTH=-mod=Mods\@EnhancedMovement;Mods\@MfHealAbort
if %Status%==ENABLED goto KOTHEXTENDED
%1% -connect=cacservers.ddns.net -port=2322 %2% "%KOTH%" 
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
%1% -connect=cacservers.ddns.net -port=2322 %2% "%KOTH%;Mods\@ARM"
GOTO End
:KOTHEXTENDED_2
%1% -connect=cacservers.ddns.net -port=2322 %2% "%KOTH%;Mods\@JSRS_SOUNDMOD"
GOTO End
:KOTHEXTENDED_3
%1% -connect=cacservers.ddns.net -port=2322 %2% "%KOTH%;Mods\@ARM;Mods\@JSRS_SOUNDMOD"
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
