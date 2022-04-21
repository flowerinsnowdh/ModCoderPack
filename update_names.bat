@echo off


call setup.bat %1

set MCPCONF_L=%MCPDIR%\conf

"%MCPGETCSV%" -d "%MCPCONF_L%"
"%MCPRENAMER%" -R --skipopengl -c "%MCPCONFDIR%\renamer.conf"

pause
