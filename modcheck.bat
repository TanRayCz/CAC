@echo off
color 4
cls

echo  ---MANDATORY MOD CHECKER---

echo.
echo -Mods missing for Antistasi1 + Antistasi2 servers:

if not exist %ModPath%"@ace" echo @ace NOT FOUND
if not exist "Mods/@ACEComRHSAFRF" echo @ACEComRHSAFRF NOT FOUND
if not exist "Mods/@ACEComRHSGREF" echo @ACEComRHSGREF NOT FOUND
if not exist "Mods/@ACEComRHSUSAF" echo @ACEComRHSUSAF NOT FOUND
if not exist "Mods/@AdvancedRappelling" echo @AdvancedRappelling NOT FOUND
if not exist "Mods/@AdvancedUrbanRappelling" echo @AdvancedUrbanRappelling NOT FOUND
if not exist "Mods/@Anizay" echo @Anizay NOT FOUND
if not exist "Mods/@Antistasi" echo @Antistasi NOT FOUND
if not exist "Mods/@AWR" echo @AWR NOT FOUND
if not exist "Mods/@Blastcore" echo @Blastcore NOT FOUND
if not exist "Mods/@CAC_AE1.4" echo @CAC_AE1.4 NOT FOUND
if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
if not exist "Mods/@CUPTerrainsCore" echo @CUPTerrainsCore NOT FOUND
if not exist "Mods/@CUPTerrainsMaps" echo @CUPTerrainsMaps NOT FOUND
if not exist "Mods/@CUPUnits" echo @CUPUnits NOT FOUND
if not exist "Mods/@CUPVehicles" echo @CUPVehicles NOT FOUND
if not exist "Mods/@CUPWeapons" echo @CUPWeapons NOT FOUND
if not exist "Mods/@DSHouses" echo @DSHouses NOT FOUND
if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND
if not exist "Mods/@KunduzAfgFD" echo @KunduzAfgFD NOT FOUND
if not exist "Mods/@MfHealAbort" echo @MfHealAbort NOT FOUND
if not exist "Mods/@RealEngine" echo @RealEngine NOT FOUND
if not exist "Mods/@RHSAFRF" echo @RHSAFRF NOT FOUND
if not exist "Mods/@RHSGREF" echo @RHSGREF NOT FOUND
if not exist "Mods/@RHSUSAF" echo @RHSUSAF NOT FOUND
if not exist "Mods/@SM_Sheds" echo @SM_Sheds NOT FOUND
if not exist "Mods/@TembelanIsland" echo @TembelanIsland NOT FOUND
if not exist "Mods/@VET_Unflipping" echo @VET_Unflipping NOT FOUND
if not exist "Mods/@VirolahtiValtatie7" echo @VirolahtiValtatie7 NOT FOUND

echo.
echo -Mods missing for Exile Tanoa server:

if not exist "Mods/@Exile" echo @Exile NOT FOUND
if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
if not exist "Mods/@DualArms" echo @DualArms NOT FOUND
if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND
if not exist "Mods/@Extended_Base_Mod" echo @Extended_Base_Mod NOT FOUND
if not exist "Mods/@X66-MammothTank" echo @X66-MammothTank NOT FOUND
if not exist "Mods/@AdvancedRappelling" echo @AdvancedRappelling NOT FOUND
if not exist "Mods/@AdvancedUrbanRappelling" echo @AdvancedUrbanRappelling NOT FOUND

echo.
echo -Mods missing for Exile Escape server:

if not exist "Mods/@Exile" echo @Exile NOT FOUND
if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
if not exist "Mods/@DualArms" echo @DualArms NOT FOUND
if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND

echo.
echo -Mods missing for King of The Hill serever:

if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND
if not exist "Mods/@MfHealAbort" echo @MfHealAbort NOT FOUND

echo.
::echo -Wasteland

::if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
::if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
::if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND
::if not exist "Mods/@DualArms" echo @DualArms NOT FOUND
::if not exist "Mods/@MfHealAbort" echo @MfHealAbort NOT FOUND
::if not exist "Mods/@AdvancedRappelling" echo @AdvancedRappelling NOT FOUND
::if not exist "Mods/@AdvancedUrbanRappelling" echo @AdvancedUrbanRappelling NOT FOUND
::if not exist "Mods/@Blastcore" echo @Blastcore NOT FOUND

::echo.
::echo -Prairie

::if not exist "vn" echo DLC NOT FOUND
::if not exist "Mods/@ace" echo @ace NOT FOUND
::if not exist "Mods/@CBA_A3" echo @CBA_A3 NOT FOUND
::if not exist "Mods/@EnhancedMovement" echo @EnhancedMovement NOT FOUND
::if not exist "Mods/@EnhancedMovementRework" echo @EnhancedMovementRework NOT FOUND
::if not exist "Mods/@MfHealAbort" echo @MfHealAbort NOT FOUND
::if not exist "Mods/@VET_Unflipping" echo @VET_Unflipping NOT FOUND
::if not exist "Mods/@AdvancedRappelling" echo @AdvancedRappelling NOT FOUND
::if not exist "Mods/@AdvancedUrbanRappelling" echo @AdvancedUrbanRappelling NOT FOUND
::if not exist "Mods/@Blastcore" echo @Blastcore NOT FOUND

::echo.
pause
call CACCore.bat
