@echo off
for /f "usebackq delims=" %%A in (CACCore\memory2.txt) do %%A
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set EXE=SteamService.exe
if not exist "CACCore" md "CACCore"
if not exist CACCore\memory2.txt echo set Status=DISABLED > CACCore\memory2.txt
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY
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
echo FAILED TO LAUNCH STEAM, EXITING. PLEASE LAUNCH STEAM MANUALLY.
timeout /t 5
exit

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

color 2
title Arma 3 CAC Launcher
echo.
echo VERSION: 1.5.0 unfinished untested
echo CHANGES: CAC filesystem; status disable/enable (no implemented practical use so far); DNS instead of IP
echo PLANNED: loop steam launch fail instead of exit; somewhat optimized mod selector (if %Status%==ENABLED); move KOTH to 4
echo potential .bat to cmd update, splitting github caclauncher in 2 for temporary legacy support (cmd and bat)
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo Choose CAC Server
echo.
echo  1 Exile Altis
echo  2 Exile Tanoa
echo  3 Coop
echo  4 Exile TanoaZ
echo  5 Ravage Malden
echo  6 Exile Chernarus
echo  7 Exile Escape
echo  8 King of The Hill
echo.
echo  9 ENABLE/DISABLE Optional mods
echo.
choice /C 123456789 /M "Enter your server"
IF ERRORLEVEL 9 GOTO StatusChanger
IF ERRORLEVEL 8 GOTO KingofTheHill
IF ERRORLEVEL 7 GOTO ExileEscape
IF ERRORLEVEL 6 GOTO Chernarus
IF ERRORLEVEL 5 GOTO RavageMalden
IF ERRORLEVEL 4 GOTO ExileTanoaZ
IF ERRORLEVEL 3 GOTO Coop
IF ERRORLEVEL 2 GOTO ExileTanoa
IF ERRORLEVEL 1 GOTO ExileAltis

:ExileAltis
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2302 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank"
GOTO End

:ExileTanoa
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2602 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank"
GOTO End

:Coop
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2702 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Ace3;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@MfHealAbort;Mods\@Vindicta;Mods\@ShackTacUI;Mods\@CHViewDistance;Mods\@VET_Unflipping"
GOTO End

:ExileTanoaZ
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=3402 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@ZombiesAndDemons;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank;Mods\@ARM;Mods\@ShackTacUI"
GOTO End

:RavageMalden
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2342 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@CBA_A3;Mods\@VA_Beta;Mods\@Ravage;Mods\@ACE_No_medical;Mods\@VET_Unflipping;Mods\@EnhancedMovement;Mods\@ShackTacUI;Mods\@ARM"
GOTO End

:Chernarus
start "" /normal arma3_x64 -connect=cacservers.ddns.net  -port=3302 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@CUPTerrainsCore;Mods\@CUPTerrainsMaps;Mods\@ChernarusIsles;Mods\@DSHouses;Mods\@InteriorsforCUP;Mods\@SM_Sheds;Mods\@CUPUnits;Mods\@CUPVehicles;Mods\@CUPWeapons;Mods\@Extended_Base_Mod;Mods\@DualArms;Mods\@AdvancedUrbanRappelling;Mods\@MfHealAbort;Mods\@EnhancedMovement;Mods\@JSRS_SOUNDMOD"
GOTO End

:ExileEscape
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2372 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@ARM"
GOTO End

:KingofTheHill
start "" /normal arma3_x64 -connect=cacservers.ddns.net -port=2322 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@EnhancedMovement;Mods\@MfHealAbort" 
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
