@echo off

set MCPDIR=%CD%
set MCPTOOLS=%MCPDIR%\tools
set MCPCONF=%MCPDIR%\conf

"%MCPTOOLS%\get_csv.exe" -d "%MCPCONF%"
"%MCPTOOLS%\renamer.exe" -R --skipopengl -c "%MCPCONF%\renamer.conf"

pause
