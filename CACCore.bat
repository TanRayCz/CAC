@echo off
cls
set EXE=SteamService.exe
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY
if exist "C:\Program Files (x86)\Steam\steam.exe" goto DEFAULT
if exist "memory.txt" goto CUSTOM
color 6
echo.
echo SEARCHING FOR STEAM DIRECTORY ON C:\ DRIVE, PLEASE WAIT
where /r C:\ steam.exe > memory.txt
color 2
echo.
echo STEAM FOUND AT
type memory.txt
timeout /t 3
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
set /p SteamPath=<memory.txt
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

:READY2
cls
color 2
echo.
echo STEAM LAUNCHED SUCCESSFULLY
echo.
goto START

:READY
cls
color 2
echo.
echo STEAM IS RUNNING
echo.
goto START

:START
title Arma 3 CAC Launcher

echo VERSION: 1.0.3

echo.
echo Choose CAC Server
echo.
echo  1 Exile Altis
echo  2 Exile Tanoa
echo  3 Coop
echo  4 Exile TanoaZ
echo  5 Ravage Malden
echo  6 Ravage Tanoa
echo  7 Exile Escape
echo  8 King of The Hill
echo.
choice /C 12345678 /M "Enter your server"
IF ERRORLEVEL 8 GOTO KingofTheHill
IF ERRORLEVEL 7 GOTO ExileEscape
IF ERRORLEVEL 6 GOTO RavageTanoa
IF ERRORLEVEL 5 GOTO RavageMalden
IF ERRORLEVEL 4 GOTO ExileTanoaZ
IF ERRORLEVEL 3 GOTO Coop
IF ERRORLEVEL 2 GOTO ExileTanoa
IF ERRORLEVEL 1 GOTO ExileAltis
:ExileAltis
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2302 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank"
GOTO End
:ExileTanoa
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2602 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank"
GOTO End
:Coop
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2702 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@Ace3;Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@MfHealAbort;Mods\@Vindicta;Mods\@ShackTacUI;Mods\@CHViewDistance;Mods\@VET_Unflipping;Mods\@TaskForceRadio"
GOTO End
:ExileTanoaZ
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2382 -skipIntro -noSplash -world=empty -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@ZombiesAndDemons;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank;Mods\@ARM;Mods\@ShackTacUI"
GOTO End
:RavageMalden
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2342 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@CBA_A3;Mods\@VA_Beta;Mods\@Ravage;Mods\@ACE_No_medical;Mods\@VET_Unflipping;Mods\@EnhancedMovement;Mods\@ShackTacUI;Mods\@ARM"
GOTO End
:RavageTanoa
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2352 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@CBA_A3;Mods\@VA_Beta;Mods\@Ravage;Mods\@ACE_No_medical;Mods\@VET_Unflipping;Mods\@EnhancedMovement;Mods\@ShackTacUI;Mods\@ARM"
GOTO End
:ExileEscape
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2372 -skipIntro -noSplash -world=empty -enableHT "-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@ARM"
GOTO End
:KingofTheHill
start "" /normal arma3_x64 -connect=89.103.168.25 -port=2322 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT "-mod=Mods\@EnhancedMovement;Mods\@MfHealAbort" 
GOTO End
:End
