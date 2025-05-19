@echo off
cls
setlocal enabledelayedexpansion

REM Set the names of the variables to be checked
set "varname1=Antistasi1"
set "varname2=Antistasi2"
set "varname3=KOTH"
set "varname4=Liberation"
set "varname5=Exile"


REM Get the current directory where modcheck.bat is located
set "script_dir=%~dp0"

REM Build the path to CACCore.bat using the current directory
set "cacc_path=%script_dir%..\CACCore.bat"

REM Loop through all the variable names and check for missing mods
for %%v in ("%varname1%" "%varname2%" "%varname3%" "%varname4%" "%varname5%") do (
  set "varname=%%~v"

  REM Extract the value of the specified variable from CACCore.bat
  for /f "tokens=1,* delims== " %%a in ('type "%cacc_path%" ^| findstr /c:"set !varname!="') do set "varvalue=%%b"

  REM Remove -mod prefix from the variable value
  set "varvalue=!varvalue:-mod =!"

  REM Replace %ModPath% with the actual path in the variable value
  set "varvalue=!varvalue:%%ModPath%%=!"

  REM Extract the mod names from the variable value
  set "missing_mods="
  for %%m in (!varvalue!) do (
    if /i "%%~m" neq "!varname!" if /i "%%~m" neq "-mod" (
      REM Check if the mod folder exists in %ModPath%
      if not exist "%ModPath%\%%~m" (
        set "missing_mods=!missing_mods!%%~m "
      )
    )
  )

  REM Print the list of missing mods vertically using a for loop
  if defined missing_mods (
    ::color 4
	echo     Missing mods for !varname! server:
    for %%m in (!missing_mods!) do echo     					%%m
	echo.
  ) else (
    echo     No missing mods for !varname! server.
  )
  echo.
)

endlocal

pause
call CACCore.bat
