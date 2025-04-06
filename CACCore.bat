@echo off
:RESTART
curl --ssl-no-revoke https://raw.githubusercontent.com/TanRayCz/CAC/master/hosts.txt > hosts.txt 2> nul
set title=echo Arma 3 CAC Launcher - discord.gg/dNGcyEYK8F
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
set /p SteamPath=<CACCore\memory.txt
if not exist "%SteamPath%" type CACCore\memory.txt & echo DOES NOT EXIST
goto RESTART

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
if exist CACCore\password.txt set /p Password=<CACCore\password.txt
if exist CACCore\moddir.txt set /p ModPath=<CACCore\moddir.txt
if not exist CACCore\moddir.txt set ModPath=Mods
set ModPath=%ModPath%\
set /p ArmaUserName=<CACCore\username.txt
set ip1=brenner.servebeer.com
set ip2=cacservers.servebeer.com
set ip3=cackoth.servebeer.com
set ip4=unladencoconut.ddns.net
set ip5=theghost.ddns.net
set A1=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip1% -name="%ArmaUserName%"
set A2=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip2% -name="%ArmaUserName%"
set A3=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip3% -name="%ArmaUserName%"
set A4=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip4% -name="%ArmaUserName%"
set A5=start "" /normal arma3_x64 -skipIntro -noSplash -world=empty -exThreads=7 -enableHT -setThreadCharacteristics -connect=%ip5% -name="%ArmaUserName%"

:MODPRELOADER
if not exist CACCore\@A3ThermalImprovement.txt echo DISABLED > CACCore\@A3ThermalImprovement.txt
if not exist CACCore\@ARM.txt echo DISABLED > CACCore\@ARM.txt
if not exist CACCore\@Athena.txt echo DISABLED > CACCore\@Athena.txt
if not exist CACCore\@AthenaWeb.txt echo DISABLED > CACCore\@AthenaWeb.txt
if not exist CACCore\@AutomaticViewDistance.txt echo DISABLED > CACCore\@AutomaticViewDistance.txt
if not exist CACCore\@BetterInventory.txt echo DISABLED > CACCore\@BetterInventory.txt
if not exist CACCore\@Blastcore.txt echo DISABLED > CACCore\@Blastcore.txt
if not exist CACCore\@DiscordRichPresence.txt echo DISABLED > CACCore\@DiscordRichPresence.txt
if not exist CACCore\@DUI.txt echo DISABLED > CACCore\@DUI.txt
if not exist CACCore\@EnhancedMap.txt echo DISABLED > CACCore\@EnhancedMap.txt
if not exist CACCore\@EnhancedMapAce.txt echo DISABLED > CACCore\@EnhancedMapAce.txt
if not exist CACCore\@JSRS_SOUNDMOD.txt echo DISABLED > CACCore\@JSRS_SOUNDMOD.txt
if not exist CACCore\@VanillaSmokeForBlastcore.txt echo DISABLED > CACCore\@VanillaSmokeForBlastcore.txt

set /p @A3ThermalImprovement=<CACCore\@A3ThermalImprovement.txt
set /p @ARM=<CACCore\@ARM.txt
set /p @Athena=<CACCore\@Athena.txt
set /p @AthenaWeb=<CACCore\@AthenaWeb.txt
set /p @AutomaticViewDistance=<CACCore\@AutomaticViewDistance.txt
set /p @BetterInventory=<CACCore\@BetterInventory.txt
set /p @Blastcore=<CACCore\@Blastcore.txt
set /p @DiscordRichPresence=<CACCore\@DiscordRichPresence.txt
set /p @DUI=<CACCore\@DUI.txt
set /p @EnhancedMap=<CACCore\@EnhancedMap.txt
set /p @EnhancedMapAce=<CACCore\@EnhancedMapAce.txt
set /p @JSRS_SOUNDMOD=<CACCore\@JSRS_SOUNDMOD.txt
set /p @VanillaSmokeForBlastcore=<CACCore\@VanillaSmokeForBlastcore.txt

if %@A3ThermalImprovement%==ENABLED set o1=;%ModPath%@A3ThermalImprovement
if %@A3ThermalImprovement%==DISABLED set o1=
if %@ARM%==ENABLED set o2=;%ModPath%@ARM
if %@ARM%==DISABLED set o2=
if %@Athena%==ENABLED set o3=;%ModPath%@Athena
if %@Athena%==DISABLED set o3=
if %@AthenaWeb%==ENABLED set o4=;%ModPath%@AthenaWeb
if %@AthenaWeb%==DISABLED set o4=
if %@AutomaticViewDistance%==ENABLED set o5=;%ModPath%@AutomaticViewDistance
if %@AutomaticViewDistance%==DISABLED set o5=
if %@BetterInventory%==ENABLED set o6=;%ModPath%@BetterInventory
if %@BetterInventory%==DISABLED set o6=
if %@Blastcore%==ENABLED set o7=;%ModPath%@Blastcore
if %@Blastcore%==DISABLED set o7= & set o13=
if %@DiscordRichPresence%==ENABLED set o8=;%ModPath%@DiscordRichPresence
if %@DiscordRichPresence%==DISABLED set o8=
if %@DUI%==ENABLED set o9=;%ModPath%@DUI
if %@DUI%==DISABLED set o9=
if %@EnhancedMap%==ENABLED set o10=;%ModPath%@EnhancedMap
if %@EnhancedMap%==DISABLED set o10=
if %@EnhancedMapAce%==ENABLED set o11=;%ModPath%@EnhancedMapAce
if %@EnhancedMapAce%==DISABLED set o11=
if %@JSRS_SOUNDMOD%==ENABLED set o12=;%ModPath%@JSRS_SOUNDMOD
if %@JSRS_SOUNDMOD%==DISABLED set o12=
if %@VanillaSmokeForBlastcore%==ENABLED set o13=;%ModPath%@VanillaSmokeForBlastcore
if %@VanillaSmokeForBlastcore%==DISABLED set o13=

:MODPRELOADERSKIP

set launcherversion=1.8.1
set gameversion=2.18.152302

color 2
title Arma 3 CAC Launcher
echo.
echo VERSION: %launcherversion% (%gameversion%)
echo.
if "%username%"=="%ArmaUserName%" echo USERNAME: %ArmaUserName% (Default)
if not "%username%"=="%ArmaUserName%" echo USERNAME: %ArmaUserName%
echo.
if %Status%==ENABLED echo OPTIONAL MODS: ENABLED
if %Status%==DISABLED echo OPTIONAL MODS: DISABLED
echo.
echo  1 Antistasi 1
echo  2 Antistasi 2 
echo  3 King of The Hill [Variable Uptime/Event only]
REM echo  4 Exile Altis
REM echo  5 Exile Escape [Variable Uptime/Event only]
REM echo  6 Liberation 
REM echo  7 Special Ops [Variable Uptime/Event only]
REM echo  8 Dynamic Recon Ops CUP
echo.
echo  9 CAC Settings
echo.
echo  0 Exit CAC Launcher
echo.
choice /C 1234567890 /M "Choose CAC Server"
IF ERRORLEVEL 10 exit
IF ERRORLEVEL 9 GOTO CACSETTINGS
REM IF ERRORLEVEL 8 GOTO DynamicReconOps
IF ERRORLEVEL 7 GOTO SpecOps
IF ERRORLEVEL 6 GOTO Liberation
REM IF ERRORLEVEL 5 GOTO ExileEscape
REM IF ERRORLEVEL 4 GOTO Exile
IF ERRORLEVEL 3 GOTO KingofTheHillEU
IF ERRORLEVEL 2 GOTO Antistasi2
IF ERRORLEVEL 1 GOTO Antistasi1

:Exile
set Exile=-mod=%ModPath%@Exile;%ModPath%@CBA_A3;%ModPath%@DualArms;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@Extended_Base_Mod;%ModPath%@X66-MammothTank;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling
if %Status%==ENABLED goto ExileEXTENDED
%A2% -port=2402 -password="%Password%" "%Exile%"
GOTO End
:ExileEXTENDED
%A2% -port=2402 -password="%Password%" "%Exile%%o1%%o2%%o5%%o6%%o7%%o8%%o9%%o10%%o12%%o13%"
GOTO End

:: Server EU
:KingofTheHillEU
set KOTHEU=-mod=%ModPath%@CBA_A3;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@MfHealAbort;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling
if %Status%==ENABLED goto KOTHEUEXTENDED
%A3% -port=2322 "%KOTHEU%" 
GOTO End
:KOTHEUEXTENDED
%A3% -port=2322 "%KOTHEU%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o10%%o12%%o13%"
GOTO End

:Antistasi1
set Antistasi1=-mod=rf;%ModPath%@ace;%ModPath%@ace_nouniformrestrictions;%ModPath%@CBA_A3;%ModPath%@RHSAFRF;%ModPath%@RHSGREF;%ModPath%@RHSSAF;%ModPath%@RHSUSAF;%ModPath%@Antistasi;%ModPath%@CAC_AE;%ModPath%@AWR;%ModPath%@RealEngine;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@VET_Unflipping;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling;%ModPath%@ACEGrenades
if %Status%==ENABLED goto Antistasi1EXTENDED
%A4% -port=3302 "%Antistasi1%"
GOTO End
:Antistasi1EXTENDED
%A4% -port=3302 "%Antistasi1%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o13%"
::JSRS_RHS_Compatibility::
if %@JSRS_SOUNDMOD%==ENABLED if %@RHSUSAF%==ENABLED goto JSRS_RHS_A1_Compatibility
:JSRS_RHS_A1_Compatibility
set o12addon=;%ModPath%@JSRS_AFRF;%ModPath%@JSRS_GREF;%ModPath%@JSRS_USAF;%ModPath%@JSRS_SAF
%A4% -port=3302 "%Antistasi1%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o12addon%%o13%"
::JSRS_RHS_Compatibility_End::
GOTO End

:Antistasi2
set Antistasi2=-mod=rf;%ModPath%@CBA_A3;%ModPath%@Lingor-DingorIsland;%ModPath%@AntistasiUltimate;%ModPath%@cac_aue;%ModPath%@RHSAFRF;%ModPath%@RHSGREF;%ModPath%@RHSSAF;%ModPath%@RHSUSAF;%ModPath%@AWR;%ModPath%@RealEngine;%ModPath%@ace;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@VET_Unflipping;%ModPath%@ace_nouniformrestrictions;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling;%ModPath%@ACEGrenades
if %Status%==ENABLED goto Antistasi2EXTENDED
%A4% -port=2702 "%Antistasi2%"
GOTO End
:Antistasi2EXTENDED
%A4% -port=2702 "%Antistasi2%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o13%"
::JSRS_RHS_Compatibility::
if %@JSRS_SOUNDMOD%==ENABLED if %@RHSUSAF%==ENABLED goto JSRS_RHS_A2_Compatibility
:JSRS_RHS_A2_Compatibility
set o12addon=;%ModPath%@JSRS_AFRF;%ModPath%@JSRS_GREF;%ModPath%@JSRS_USAF;%ModPath%@JSRS_SAF
%A4% -port=2702 "%Antistasi2%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o12addon%%o13%"
::JSRS_RHS_Compatibility_End::
GOTO End

:Liberation
set Liberation=-mod=%ModPath%@ace;%ModPath%@ACEGrenades;%ModPath%@ace_nouniformrestrictions;%ModPath%@CBA_A3;%ModPath%@CUPTerrainsCore;%ModPath%@CUPTerrainsMaps;%ModPath%@CUPUnits;%ModPath%@RealEngine;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@VET_Unflipping;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling;%ModPath%@USAF;%ModPath%@CUPVehicles;%ModPath%@CUPWeapons;%ModPath%@AWR;%ModPath%@FayshkhaburIraq;%ModPath%@KPRanks;%ModPath%@POOKCamonets;%ModPath%@POOKSAMPACK;%ModPath%@Suppress;%ModPath%@USAF_Mod_Fighters;%ModPath%@USAF_Mod_Utility;%ModPath%@Vehicle_Inventory_System;%ModPath%@CFP;%ModPath%@Align;%ModPath%@AdvancedTowing;%ModPath%@AdvancedSlingLoading;%ModPath%@CAC_Liberation
if %Status%==ENABLED goto LiberationExtended
%A5% -port=3302 "%Liberation%"
GOTO End
:LiberationExtended
%A5% -port=3302 "%Liberation%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o13%"
::JSRS_RHS_Compatibility::
if %@JSRS_SOUNDMOD%==ENABLED if %@RHSUSAF%==ENABLED goto JSRS_RHS_A2_Compatibility
:JSRS_RHS_A2_Compatibility
set o12addon=;%ModPath%@JSRS_AFRF;%ModPath%@JSRS_GREF;%ModPath%@JSRS_USAF;%ModPath%@JSRS_SAF
%A5% -port=3302 "%Liberation%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o12addon%%o13%"
::JSRS_RHS_Compatibility_End::
GOTO End

:SpecOps
set SpecOps=-mod=%ModPath%@ace;%ModPath%@CBA_A3;%ModPath%@RHSAFRF;%ModPath%@RHSGREF;%ModPath%@RHSUSAF;%ModPath%@AWR;%ModPath%@RealEngine;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@VET_Unflipping;%ModPath%@ace_nouniformrestrictions;%ModPath%@AdvancedRappelling;%ModPath%@AdvancedUrbanRappelling;%ModPath%SpecialOps/@Albasrah;%ModPath%SpecialOps\@BettIR;%ModPath%@Blastcore;%ModPath%SpecialOps\@Iraqi-SyrianStyleCivilians;%ModPath%SpecialOps\@IslamicState[RHS];%ModPath%SpecialOps\@Jbad;%ModPath%SpecialOps\@PMCVehiclesMod;%ModPath%SpecialOps\@PMCAUniforms;%ModPath%SpecialOps\@ProjectBJC-PMCUniforms;%ModPath%SpecialOps\@TierOneWeapons;%ModPath%SpecialOps\@ZeusEnhanced;%ModPath%SpecialOps\@TierOneWeapons-BettIRCompatibilityConfig;%ModPath%SpecialOps\@Mavic3dropmod;%ModPath%SpecialOps\@Mavic3;%ModPath%SpecialOps\@ACE3ArsenalCore;%ModPath%SpecialOps\@RDSCivilianPack;%ModPath%SpecialOps\@ZeusEnhancedACE3Compatibility
if %Status%==ENABLED goto SpecOpsExtended
%A5% -port=20100 "%SpecOps%"
GOTO End
:SpecOpsExtended
%A5% -port=20100 "%SpecOps%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o13%"
::JSRS_RHS_Compatibility::
if %@JSRS_SOUNDMOD%==ENABLED if %@RHSUSAF%==ENABLED goto JSRS_RHS_A2_Compatibility
:JSRS_RHS_A2_Compatibility
set o12addon=;%ModPath%@JSRS_AFRF;%ModPath%@JSRS_GREF;%ModPath%@JSRS_USAF;%ModPath%@JSRS_SAF
%A5% -port=20100 "%pecOps%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o12addon%%o13%"
::JSRS_RHS_Compatibility_End::
GOTO End

:DynamicReconOps
set DynamicReconOps=-mod=%ModPath%@CBA_A3;%ModPath%@CUPTerrainsCore;%ModPath%@CUPTerrainsMaps;%ModPath%@Fallujah;%ModPath%@ace;%ModPath%@CUPWeapons;%ModPath%@CUPUnits;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@AdvancedUrbanRappelling
if %Status%==ENABLED goto DynamicReconOpsEXTENDED
%A1% -port=3502 "%DynamicReconOps%"
GOTO End
:DynamicReconOpsEXTENDED
%A1% -port=3502 "%DynamicReconOps%%o1%%o2%%o3%%o4%%o5%%o6%%o7%%o8%%o9%%o11%%o12%%o13%"
GOTO End

:ExileEscape
set ExileEscape=-mod=%ModPath%@Exile;%ModPath%@CBA_A3;%ModPath%@EnhancedMovement;%ModPath%@EnhancedMovementRework;%ModPath%@MfHealAbort;%ModPath%@DualArms
if %Status%==ENABLED goto ExileEscapeEXTENDED
%A3% -port=2372 "%ExileEscape%"
GOTO End
:ExileEscapeEXTENDED
%A3% -port=2372 "%ExileEscape%%o1%%o2%%o5%%o6%%o7%%o8%%o9%%o10%%o12%%o13%"
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
IF ERRORLEVEL 3 GOTO CACSETTINGS
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

if exist "Mods/@A3ThermalImprovement" (echo  1 - @A3ThermalImprovement		                        STATUS: %@A3ThermalImprovement%) else echo  1 - @A3ThermalImprovement		                                        STATUS: NOT FOUND
if exist "Mods/@ARM" (echo  2 - @ARM		                                        STATUS: %@ARM%) else echo  2 - @ARM		                                        STATUS: NOT FOUND
if exist "Mods/@Athena" (echo  3 - @Athena		                                        STATUS: %@Athena%) else echo  3 - @Athena		                                        STATUS: NOT FOUND
if exist "Mods/@AthenaWeb" (echo  4 - @AthenaWeb		                                        STATUS: %@AthenaWeb%) else echo  4 - @AthenaWeb		                                        STATUS: NOT FOUND
if exist "Mods/@AutomaticViewDistance" (echo  5 - @AutomaticViewDistance		                        STATUS: %@AutomaticViewDistance%) else echo  5 - @AutomaticViewDistance		                                        STATUS: NOT FOUND
if exist "Mods/@BetterInventory" (echo  6 - @BetterInventory	                                        STATUS: %@BetterInventory%) else echo  6 - @BetterInventory		                                STATUS: NOT FOUND
if exist "Mods/@Blastcore " (echo  7 - @Blastcore 		                                STATUS: %@Blastcore%) else echo  7 - @Blastcore 		                                STATUS: NOT FOUND
if exist "Mods/@DiscordRichPresence" (echo  8 - @DiscordRichPresence		                        STATUS: %@DiscordRichPresence%) else echo  8 - @DiscordRichPresence		                                        STATUS: NOT FOUND
if exist "Mods/@DUI" (echo  9 - @DUI		                                        STATUS: %@DUI%) else echo  9 - @DUI		                                        STATUS: NOT FOUND
if exist "Mods/@EnhancedMap" (echo  10 - @EnhancedMap	                                        STATUS: %@EnhancedMap%) else echo  10 - @EnhancedMap		                                STATUS: NOT FOUND
if exist "Mods/@EnhancedMapAce" (echo  11 - @EnhancedMapAce  		                                STATUS: %@EnhancedMapAce%) else echo  11 - @EnhancedMapAce		                        STATUS: NOT FOUND
if exist "Mods/@JSRS_SOUNDMOD" (echo  12 - @JSRS_SOUNDMOD	                                        STATUS: %@JSRS_SOUNDMOD%) else echo  12 - @JSRS_SOUNDMOD		                                STATUS: NOT FOUND
if exist "Mods/@VanillaSmokeForBlastcore" (echo  13 - @VanillaSmokeForBlastcore - Blastcore required		STATUS: %@VanillaSmokeForBlastcore%) else echo  13 - @VanillaSmokeForBlastcore		                        STATUS: NOT FOUND


echo.
echo  b - Back
echo.
echo  r - Refresh
echo.
echo Confirm with enter
SET /P "M=Switch optional mod:"
IF "%M%"=="1" GOTO A3ThermalImprovement
IF "%M%"=="2" GOTO ARM
IF "%M%"=="3" GOTO Athena
IF "%M%"=="4" GOTO AthenaWeb
IF "%M%"=="5" GOTO AutomaticViewDistance
IF "%M%"=="6" GOTO BetterInventory
IF "%M%"=="7" GOTO Blastcore
IF "%M%"=="8" GOTO DiscordRichPresence
IF "%M%"=="9" GOTO DUI
IF "%M%"=="10" GOTO EnhancedMap
IF "%M%"=="11" GOTO EnhancedMapAce
IF "%M%"=="12" GOTO JSRS_SOUNDMOD
IF "%M%"=="13" GOTO VanillaSmokeForBlastcore

IF "%M%"=="b" GOTO CACSETTINGS
IF "%M%"=="r" GOTO ModSettings

echo Invalid selection ("%M%")
timeout /t 2
GOTO ModSettings

:A3ThermalImprovement
set /p ModPath=<CACCore\@A3ThermalImprovement.txt
if %ModPath%==DISABLED del CACCore\@A3ThermalImprovement.txt & echo ENABLED > CACCore\@A3ThermalImprovement.txt
if %ModPath%==ENABLED del CACCore\@A3ThermalImprovement.txt & echo DISABLED > CACCore\@A3ThermalImprovement.txt
set /p @A3ThermalImprovement=<CACCore\@A3ThermalImprovement.txt
goto ModSettings

:ARM
set /p ModPath=<CACCore\@ARM.txt
if %ModPath%==DISABLED del CACCore\@ARM.txt & echo ENABLED > CACCore\@ARM.txt
if %ModPath%==ENABLED del CACCore\@ARM.txt & echo DISABLED > CACCore\@ARM.txt
set /p @ARM=<CACCore\@ARM.txt
goto ModSettings

:Athena
set /p ModPath=<CACCore\@Athena.txt
if %ModPath%==DISABLED del CACCore\@Athena.txt & echo ENABLED > CACCore\@Athena.txt
if %ModPath%==ENABLED del CACCore\@Athena.txt & echo DISABLED > CACCore\@Athena.txt
set /p @Athena=<CACCore\@Athena.txt
goto ModSettings

:AthenaWeb
set /p ModPath=<CACCore\@AthenaWeb.txt
if %ModPath%==DISABLED del CACCore\@AthenaWeb.txt & echo ENABLED > CACCore\@AthenaWeb.txt
if %ModPath%==ENABLED del CACCore\@AthenaWeb.txt & echo DISABLED > CACCore\@AthenaWeb.txt
set /p @AthenaWeb=<CACCore\@AthenaWeb.txt
goto ModSettings

:AutomaticViewDistance
set /p ModPath=<CACCore\@AutomaticViewDistance.txt
if %ModPath%==DISABLED del CACCore\@AutomaticViewDistance.txt & echo ENABLED > CACCore\@AutomaticViewDistance.txt
if %ModPath%==ENABLED del CACCore\@AutomaticViewDistance.txt & echo DISABLED > CACCore\@AutomaticViewDistance.txt
set /p @AutomaticViewDistance=<CACCore\@AutomaticViewDistance.txt
goto ModSettings

:BetterInventory
set /p ModPath=<CACCore\@BetterInventory.txt
if %ModPath%==DISABLED del CACCore\@BetterInventory.txt & echo ENABLED > CACCore\@BetterInventory.txt
if %ModPath%==ENABLED del CACCore\@BetterInventory.txt & echo DISABLED > CACCore\@BetterInventory.txt
set /p @BetterInventory=<CACCore\@BetterInventory.txt
goto ModSettings

:Blastcore
set /p ModPath=<CACCore\@Blastcore.txt
if %ModPath%==DISABLED del CACCore\@Blastcore.txt & echo ENABLED > CACCore\@Blastcore.txt
if %ModPath%==ENABLED del CACCore\@Blastcore.txt & echo DISABLED > CACCore\@Blastcore.txt
set /p @Blastcore=<CACCore\@Blastcore.txt
goto ModSettings

:DiscordRichPresence
set /p ModPath=<CACCore\@DiscordRichPresence.txt
if %ModPath%==DISABLED del CACCore\@DiscordRichPresence.txt & echo ENABLED > CACCore\@DiscordRichPresence.txt
if %ModPath%==ENABLED del CACCore\@DiscordRichPresence.txt & echo DISABLED > CACCore\@DiscordRichPresence.txt
set /p @DiscordRichPresence=<CACCore\@DiscordRichPresence.txt
goto ModSettings

:DUI
set /p ModPath=<CACCore\@DUI.txt
if %ModPath%==DISABLED del CACCore\@DUI.txt & echo ENABLED > CACCore\@DUI.txt
if %ModPath%==ENABLED del CACCore\@DUI.txt & echo DISABLED > CACCore\@DUI.txt
set /p @DUI=<CACCore\@DUI.txt
goto ModSettings

:EnhancedMap
set /p ModPath=<CACCore\@EnhancedMap.txt
if %ModPath%==DISABLED del CACCore\@EnhancedMap.txt & echo ENABLED > CACCore\@EnhancedMap.txt
if %ModPath%==ENABLED del CACCore\@EnhancedMap.txt & echo DISABLED > CACCore\@EnhancedMap.txt
set /p @EnhancedMap=<CACCore\@EnhancedMap.txt
goto ModSettings

:EnhancedMapAce
set /p ModPath=<CACCore\@EnhancedMapAce.txt
if %ModPath%==DISABLED del CACCore\@EnhancedMapAce.txt & echo ENABLED > CACCore\@EnhancedMapAce.txt
if %ModPath%==ENABLED del CACCore\@EnhancedMapAce.txt & echo DISABLED > CACCore\@EnhancedMapAce.txt
set /p @EnhancedMapAce=<CACCore\@EnhancedMapAce.txt
goto ModSettings

:JSRS_SOUNDMOD
set /p ModPath=<CACCore\@JSRS_SOUNDMOD.txt
if %ModPath%==DISABLED del CACCore\@JSRS_SOUNDMOD.txt & echo ENABLED > CACCore\@JSRS_SOUNDMOD.txt
if %ModPath%==ENABLED del CACCore\@JSRS_SOUNDMOD.txt & echo DISABLED > CACCore\@JSRS_SOUNDMOD.txt
set /p @JSRS_SOUNDMOD=<CACCore\@JSRS_SOUNDMOD.txt
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
echo  Different usernames will use seperate save games/profile folders.
echo.
if "%username%"=="%ArmaUserName%" echo Current Username: %ArmaUserName% (Default)
if not "%username%"=="%ArmaUserName%" (
echo Current Username: %ArmaUserName%
setlocal EnableDelayedExpansion
set ArmaUserName=!ArmaUserName: =%%20!)
echo.
if "%ArmaUserName%"=="%username%" color 3 & echo Profile: Exists, is the system default. & endlocal & GOTO UserCtl2
if exist %USERPROFILE%\Documents\"Arma 3 - Other Profiles"\"%ArmaUserName%" color 2 & echo Profile: Exists. & endlocal & GOTO UserCtl2
if not exist %USERPROFILE%\Documents\"Arma 3 - Other Profiles"\"%ArmaUserName%" color 6 & echo Warning: Profile non-existent, will be created at Arma 3 launch. & endlocal & GOTO UserCtl2

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
endlocal
)
echo.
echo  1 Set username
echo  2 Reset username to system default
echo  3 Exit
echo.
choice /C 123 /M "->"
IF %ERRORLEVEL% EQU 3 GOTO CACSETTINGS
IF %ERRORLEVEL% EQU 2 set ArmaUserName=%username%
IF %ERRORLEVEL% EQU 1 set /p ArmaUserName="Username: "
echo %ArmaUserName%>CACCore\username.txt
GOTO UserCtl

:MODCHECK
curl --ssl-no-revoke https://raw.githubusercontent.com/TanRayCz/CAC/master/modcheck.bat > CACCore\modcheck.bat 2> nul
call CACCore\modcheck.bat

:CACSETTINGS
cls 
color 2
echo.
echo  1 Optional Mods Management [%Status%]
echo  2 Change Username/Profile  [%ArmaUserName%]
echo  3 Change Exile Password    [%Password%]
echo  4 Change Mods Directory    [%ModPath%]
echo  5 Mandatory Mods Check
echo.
echo  6 Return
echo.
choice /C 123456
IF ERRORLEVEL 6 GOTO RESTART
IF ERRORLEVEL 5 GOTO MODCHECK
IF ERRORLEVEL 4 GOTO MODDIRCHANGER
IF ERRORLEVEL 3 GOTO PASSWORDMANAGER
IF ERRORLEVEL 2 GOTO UserCtl
IF ERRORLEVEL 1 GOTO StatusChanger

:MODDIRCHANGER
cls
color 2
echo.
echo  Change Mod Directory
echo.
if exist CACCore\moddir.txt set /p ModPath=<CACCore\moddir.txt
if exist CACCore\moddir.txt echo   Current Directory: %ModPath%
if not exist CACCore\moddir.txt set ModPath=Mods\
if not exist CACCore\moddir.txt echo   Current Mod Directory: Default (%ModPath%)

echo.
echo  1 Change Directory
echo  2 Default Directory
echo  3 Exit
echo.
choice /C 123
IF ERRORLEVEL 3 GOTO CACSETTINGS
IF ERRORLEVEL 2 GOTO MODDIR_DELETE
IF ERRORLEVEL 1 GOTO MODDIR_CHANGE

:MODDIR_CHANGE
set /p ModPath="New Mod Directory: "
echo %ModPath%>CACCore\moddir.txt
goto MODDIRCHANGER
:MODDIR_DELETE
del CACCore\moddir.txt
set ModPath=
GOTO MODDIRCHANGER

:PASSWORDMANAGER
cls
color 4
echo.
echo  Manage password for CAC Exile servers
echo.
if exist CACCore\password.txt set /p Password=<CACCore\password.txt
if exist CACCore\password.txt echo   Current Password: %Password%
if not exist CACCore\password.txt echo   Current Password: None
echo.
echo  1 Change Password
echo  2 Remove Password
echo  3 Exit
echo.
choice /C 123
IF ERRORLEVEL 3 GOTO CACSETTINGS
IF ERRORLEVEL 2 GOTO PASSWORDMANAGER_DELETE
IF ERRORLEVEL 1 GOTO PASSWORDMANAGER_ADD

:PASSWORDMANAGER_ADD
set /p Password="Password: "
echo %Password%>CACCore\password.txt
goto PASSWORDMANAGER
:PASSWORDMANAGER_DELETE
del CACCore\password.txt
set Password=
GOTO PASSWORDMANAGER

:End
cls
curl --ssl-no-revoke https://raw.githubusercontent.com/TanRayCz/CAC/master/logo.txt > CACCore\logo.txt 2> nul
type CACCore\logo.txt
timeout 3 > nul
exit
