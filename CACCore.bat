@echo off
:RESTART
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set title=echo Arma 3 CAC Launcher - discord.gg/4QZcD7b
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
timeout /t 3
goto CUSTOM

:DEFAULT
cls
color 6
echo.
echo STEAM IS NOT RUNNING, ATTEMPTING TO RUN STEAM
start "" "C:\Program Files (x86)\Steam\steam.exe" -silent
::timeout /t 8
cls
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY2
goto FAIL

:CUSTOM
set /p SteamPath=<CACCore\memory.txt
if not exist "%SteamPath%" del CACCore\memory.txt & goto RESTART
cls
color 6
echo.
echo STEAM IS NOT RUNNING, ATTEMPTING TO RUN STEAM
set /p SteamPath=<CACCore\memory.txt
start "" "%SteamPath%" -silent
::timeout /t 8
cls
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto READY2
goto FAIL

:FAIL
color 4
cls
echo.
echo FAILED TO LAUNCH STEAM, TRYING AGAIN... LAUNCH STEAM MANUALLY IF ISSUE PERSISTS.
timeout /t 3
goto LOAD

:FINDFAIL
if exist "CACCore\memory.txt" del /Q "CACCore\memory.txt"
cls
echo.
echo FAILED TO FIND STEAM
echo.
echo  1 Enter Steam.exe path
echo  2 Exit
echo.
choice /C 12 
IF ERRORLEVEL 2 GOTO End
IF ERRORLEVEL 1 GOTO MANUAL
:MANUAL
cls
echo. & echo Please enter path of your steam.exe. (Example: "C:\Steam.exe") & echo.
set /p UserInput=Steam Directory: (Please use "" brackets): 
(echo=%UserInput%) > "CACCore\memory.txt"

:READY2
cls
color 2
echo.
%title%
echo.
echo STEAM LAUNCHED SUCCESSFULLY
goto START

:READY
cls
color 2
echo.
%title%
echo.
echo STEAM IS RUNNING
goto START

:START
if not exist CACCore\username.txt echo %username%>CACCore\username.txt
set /p ArmaUserName=<CACCore\username.txt

set A1=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -connect=cacservers.ddns.net -name="%ArmaUserName%"

:MODPRELOADER
if not exist CACCore\@ARM.txt echo DISABLED > CACCore\@ARM.txt
if not exist CACCore\@JSRS_SOUNDMOD.txt echo DISABLED > CACCore\@JSRS_SOUNDMOD.txt
if not exist CACCore\@DUI.txt echo DISABLED > CACCore\@DUI.txt
if not exist CACCore\@Blastcore.txt echo DISABLED > CACCore\@Blastcore.txt
if not exist CACCore\@VanillaSmokeForBlastcore.txt echo DISABLED > CACCore\@VanillaSmokeForBlastcore.txt

set /p @ARM=<CACCore\@ARM.txt
set /p @JSRS_SOUNDMOD=<CACCore\@JSRS_SOUNDMOD.txt
set /p @DUI=<CACCore\@DUI.txt
set /p @Blastcore=<CACCore\@Blastcore.txt
set /p @VanillaSmokeForBlastcore=<CACCore\@VanillaSmokeForBlastcore.txt

if %@ARM%==ENABLED set o1=;Mods\@ARM
if %@ARM%==DISABLED set o1=
if %@JSRS_SOUNDMOD%==ENABLED set o2=;Mods\@JSRS_SOUNDMOD
if %@JSRS_SOUNDMOD%==DISABLED set o2=
if %@DUI%==ENABLED set o3=;Mods\@DUI
if %@DUI%==DISABLED set o3=

if %@VanillaSmokeForBlastcore%==ENABLED set o5=;Mods\@VanillaSmokeForBlastcore
if %@VanillaSmokeForBlastcore%==DISABLED set o5=
if %@Blastcore%==ENABLED set o4=;Mods\@Blastcore
if %@Blastcore%==DISABLED set o4= & set o5=
:MODPRELOADERSKIP

color 2
title Arma 3 CAC Launcher
echo.
echo VERSION: 1.7.0
echo.
if %username%==%ArmaUserName% echo USERNAME: %ArmaUserName% (Default)
if not %username%==%ArmaUserName% echo USERNAME: %ArmaUserName%
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo  1 Exile Altis
echo  2 Exile Tanoa
echo  3 Coop PVE
echo  4 King of The Hill TVT
echo  5 Wasteland
echo  6 Antistasi
echo  7 Exile Escape
echo  8 Antistasi S.O.G. Prarie Fire
echo.
echo  9 ENABLE/DISABLE Optional mods
echo.
echo  0 Change Username/profile
echo.
choice /C 1234567890 /M "Choose CAC Server"
IF ERRORLEVEL 10 GOTO UserCtl
IF ERRORLEVEL 9 GOTO StatusChanger
IF ERRORLEVEL 8 GOTO PrarieFire
IF ERRORLEVEL 7 GOTO ExileEscape
IF ERRORLEVEL 6 GOTO Antistasi
IF ERRORLEVEL 5 GOTO Wasteland
IF ERRORLEVEL 4 GOTO KingofTheHill
IF ERRORLEVEL 3 GOTO Coop
IF ERRORLEVEL 2 GOTO ExileTanoa
IF ERRORLEVEL 1 GOTO ExileAltis

:ExileAltis
set ExileAltis=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling
if %Status%==ENABLED goto ExileAltisEXTENDED
%A1% -port=2302 "%ExileAltis%"
GOTO End
:ExileAltisEXTENDED
%A1% -port=2302 "%ExileAltis%%o1%%o2%%o4%%o5%"
GOTO End

:ExileTanoa
set ExileTanoa=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@Extended_Base_Mod;Mods\@X66-MammothTank;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling
if %Status%==ENABLED goto ExileTanoaEXTENDED
%A1% -port=2602 "%ExileTanoa%"
GOTO End
:ExileTanoaEXTENDED
%A1% -port=2602 "%ExileTanoa%%o1%%o2%%o4%%o5%"
GOTO End

:Coop
set Coop=-mod=Mods\@CBA_A3;Mods\@ace;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort;Mods\@VET_Unflipping;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling;Mods\@Blastcore;Mods\@InconEffects
if %Status%==ENABLED goto CoopEXTENDED
%A1% -port=2702 "%Coop%"
GOTO End
:CoopEXTENDED
%A1% -port=2702 "%Coop%%o1%%o2%%o3%%o4%%o5%"
GOTO End

:PrarieFire
set PrarieFire=-mod=vn;Mods\@CBA_A3;Mods\@ace;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort;Mods\@VET_Unflipping;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling;Mods\@Blastcore;Mods\@InconEffects
if %Status%==ENABLED goto PrarieFireEXTENDED
%A1% -port=3402 "%PrarieFire%"
GOTO End
:PrarieFireEXTENDED
%A1% -port=3402 "%PrarieFire%%o1%%o2%%o4%%o5%"
GOTO End

:Wasteland
set Wasteland=-mod=Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@DualArms;Mods\@MfHealAbort;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling;Mods\@Blastcore;Mods\@InconEffects
if %Status%==ENABLED goto WastelandEXTENDED
%A1% -port=3502 "%Wasteland%"
GOTO End
:WastelandEXTENDED
%A1% -port=3502 "%Wasteland%%o1%%o2%%o3%%o5%"
GOTO End

:Antistasi
set Antistasi=-mod=Mods\@CBA_A3;Mods\@Anizay;Mods\@KunduzAfgFD;Mods\@TembelanIsland;Mods\@VirolahtiValtatie7;Mods\@CUPTerrainsCore;Mods\@CUPTerrainsMaps;Mods\@DSHouses;Mods\@InteriorsforCUP;Mods\@SM_Sheds;Mods\@RHSAFRF;Mods\@RHSGREF;Mods\@RHSUSAF;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort;Mods\@VET_Unflipping;Mods\@AdvancedRappelling;Mods\@AdvancedUrbanRappelling;Mods\@ace;Mods\@ACEComRHSAFRF;Mods\@ACEComRHSGREF;Mods\@ACEComRHSUSAF;Mods\@Blastcore;Mods\@InconEffects
if %Status%==ENABLED goto AntistasiEXTENDED
%A1% -port=3302 "%Antistasi%"
GOTO End
:AntistasiEXTENDED
if %@JSRS_SOUNDMOD%==ENABLED set o2addon=;Mods\@JSRS_AFRF;Mods\@JSRS_GREF;Mods\@JSRS_USAF
%A1% -port=3302 "%Antistasi%%o1%%o2%%o2addon%%o3%%o4%%o5%"
GOTO End

:ExileEscape
set ExileEscape=-mod=Mods\@Exile;Mods\@CBA_A3;Mods\@DualArms;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework
if %Status%==ENABLED goto ExileEscapeEXTENDED
%A1% -port=2372 "%ExileEscape%"
GOTO End
:ExileEscapeEXTENDED
%A1% -port=2372 "%ExileEscape%%o1%%o2%"
GOTO End

:KingofTheHill
set KOTH=-mod=Mods\@CBA_A3;Mods\@EnhancedMovement;Mods\@EnhancedMovementRework;Mods\@MfHealAbort
if %Status%==ENABLED goto KOTHEXTENDED
%A1% -port=2322 "%KOTH%" 
GOTO End
:KOTHEXTENDED
%A1% -port=2322 "%KOTH%%o1%%o2%%o4%%o5%"
GOTO End

:StatusChanger
if %Status%==ENABLED color 2
if %Status%==DISABLED color 4
cls 
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo  1 ENABLE
echo  2 DISABLE
echo  3 RETURN
echo.
if %Status%==ENABLED echo 4 SELECT OPTIONAL MODS
if %Status%==ENABLED echo.
if %Status%==ENABLED choice /C 1234
if %Status%==DISABLED choice /C 123
IF ERRORLEVEL 4 GOTO ModSettings
IF ERRORLEVEL 3 GOTO RESTART
IF ERRORLEVEL 2 GOTO MODDISABLE
IF ERRORLEVEL 1 GOTO MODENABLE

:MODENABLE
if exist CACCore\memory2.txt del CACCore\memory2.txt
>>CACCore\memory2.txt Echo set Status=ENABLED
set Status=ENABLED
cls
goto StatusChanger

:MODDISABLE
if exist CACCore\memory2.txt del CACCore\memory2.txt
>>CACCore\memory2.txt Echo set Status=DISABLED
set Status=DISABLED
cls
goto StatusChanger

:ModSettings
color 2
cls

if exist "Mods/@ARM" (echo  1 - @ARM		                                        STATUS: %@ARM%) else echo  1 - @ARM		                                        STATUS: NOT FOUND
if exist "Mods/@JSRS_SOUNDMOD" (echo  2 - @JSRS_SOUNDMOD	                                        STATUS: %@JSRS_SOUNDMOD%) else echo  2 - @JSRS_SOUNDMOD		                                STATUS: NOT FOUND
if exist "Mods/@DUI" (echo  3 - @DUI		                                        STATUS: %@DUI%) else echo  3 - @DUI		                                        STATUS: NOT FOUND
if exist "Mods/@Blastcore " (echo  4 - @Blastcore 		                                STATUS: %@Blastcore%) else echo  4 - @Blastcore 		                                STATUS: NOT FOUND
if exist "Mods/@VanillaSmokeForBlastcore" (echo  5 - @VanillaSmokeForBlastcore - Blastcore required		STATUS: %@VanillaSmokeForBlastcore%) else echo  5 - @VanillaSmokeForBlastcore		                        STATUS: NOT FOUND
echo.
echo  6 - Return
echo.
echo  7 - Mandatory mod check
echo.
echo Confirm with enter
SET /P "M=Switch optional mod:"
IF "%M%"=="1" GOTO ARM
IF "%M%"=="2" GOTO JSRS_SOUNDMOD
IF "%M%"=="3" GOTO DUI
IF "%M%"=="4" GOTO Blastcore
IF "%M%"=="5" GOTO VanillaSmokeForBlastcore
IF "%M%"=="6" GOTO RESTART
IF "%M%"=="7" GOTO MODCHECK
echo Invalid selection ("%M%")
timeout /t 2
GOTO ModSettings

:MODCHECK
curl https://raw.githubusercontent.com/TanRayCz/CAC/master/modcheck.bat > CACCore\modcheck.bat 2> nul
call CACCore\modcheck.bat

:ARM
set /p ModPath=<CACCore\@ARM.txt
if %ModPath%==DISABLED del CACCore\@ARM.txt & echo ENABLED > CACCore\@ARM.txt
if %ModPath%==ENABLED del CACCore\@ARM.txt & echo DISABLED > CACCore\@ARM.txt
set /p @ARM=<CACCore\@ARM.txt
goto ModSettings

:JSRS_SOUNDMOD
set /p ModPath=<CACCore\@JSRS_SOUNDMOD.txt
if %ModPath%==DISABLED del CACCore\@JSRS_SOUNDMOD.txt & echo ENABLED > CACCore\@JSRS_SOUNDMOD.txt
if %ModPath%==ENABLED del CACCore\@JSRS_SOUNDMOD.txt & echo DISABLED > CACCore\@JSRS_SOUNDMOD.txt
set /p @JSRS_SOUNDMOD=<CACCore\@JSRS_SOUNDMOD.txt
goto ModSettings

:DUI
set /p ModPath=<CACCore\@DUI.txt
if %ModPath%==DISABLED del CACCore\@DUI.txt & echo ENABLED > CACCore\@DUI.txt
if %ModPath%==ENABLED del CACCore\@DUI.txt & echo DISABLED > CACCore\@DUI.txt
set /p @DUI=<CACCore\@DUI.txt
goto ModSettings

:Blastcore
set /p ModPath=<CACCore\@Blastcore.txt
if %ModPath%==DISABLED del CACCore\@Blastcore.txt & echo ENABLED > CACCore\@Blastcore.txt
if %ModPath%==ENABLED del CACCore\@Blastcore.txt & echo DISABLED > CACCore\@Blastcore.txt
set /p @Blastcore=<CACCore\@Blastcore.txt
goto ModSettings

:VanillaSmokeForBlastcore
set /p ModPath=<CACCore\@VanillaSmokeForBlastcore.txt
if %ModPath%==DISABLED del CACCore\@VanillaSmokeForBlastcore.txt & echo ENABLED > CACCore\@VanillaSmokeForBlastcore.txt
if %ModPath%==ENABLED del CACCore\@VanillaSmokeForBlastcore.txt & echo DISABLED > CACCore\@VanillaSmokeForBlastcore.txt
set /p @VanillaSmokeForBlastcore=<CACCore\@VanillaSmokeForBlastcore.txt
goto ModSettings

:UserCtl
cls
echo.
echo N.B. Different usernames will use seperate save games/profile folders.
echo.
if %username%==%ArmaUserName% echo Current Username: %ArmaUserName% (Default)
if not %username%==%ArmaUserName% echo Current Username: %ArmaUserName%
echo.
if "%ArmaUserName%"=="%username%" color 3 & echo Profile: Exists, is the system default. & GOTO UserCtl2
if exist %USERPROFILE%\Documents\"Arma 3 - Other Profiles"\"%ArmaUserName%" color 2 & echo Profile: Exists. & GOTO UserCtl2
if not exist %USERPROFILE%\Documents\"Arma 3 - Other Profiles"\"%ArmaUserName%" color 6 & echo Warning: Profile non-existent, will be created at Arma 3 launch. & GOTO UserCtl2
:UserCtl2
echo.
echo Existing profiles:
echo.
echo  %username% (Default)
for /F %%u in ('dir %USERPROFILE%\Documents\"Arma 3 - Other Profiles" /A:D /B') DO (
setlocal EnableDelayedExpansion
set name=%%u
set name=!name:%%20= !
echo  !name!
setlocal DisableDelayedExpansion
)
echo.
echo  1 Set username
echo  2 Reset username to system default
echo  3 Return
echo.
choice /C 123 /M "->"
IF %ERRORLEVEL% EQU 3 GOTO RESTART
IF %ERRORLEVEL% EQU 2 set ArmaUserName=%username%
IF %ERRORLEVEL% EQU 1 set /p ArmaUserName="Username: "
echo %ArmaUserName%>CACCore\username.txt
GOTO UserCtl

:End
cls
if not exist CACCore\logo.txt curl https://raw.githubusercontent.com/TanRayCz/CAC/master/logo.txt > CACCore\logo.txt 2> nul
type CACCore\logo.txt
timeout 3 > nul
exit
