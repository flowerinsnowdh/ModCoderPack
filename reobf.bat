@echo off

call setup.bat %1

rmdir /q /s "%MCREOBDIR%" 2>NUL:
rmdir /q /s "%MCSREOBDIR%" 2>NUL:

if NOT EXIST "%MCPTEMPDIR%" mkdir "%MCPTEMPDIR%"
if NOT EXIST "%MCPSOURCESDIR%" mkdir "%MCPSOURCESDIR%"
if NOT EXIST "%MCPLOGDIR%" mkdir "%MCPLOGDIR%"
if NOT EXIST "%MCREOBDIR%" mkdir "%MCREOBDIR%"
if NOT EXIST "%MCSREOBDIR%" mkdir "%MCSREOBDIR%"

echo === Minecraft Coder Pack %MCPVERSION% === >"%MCPREOBLOG%"

echo MCP %MCPVERSION% running in %MCPDIR%

    echo + Obfuscating client.
    echo + Obfuscating client. >>"%MCPREOBLOG%"
    "%MCPOBFUSC%" -c "%MCPCONFDIR%\client_obfuscation.txt" -d "%MCREOBSCRIPT%" -i "%MCBIN%" -o "%MCREOBDIR%" >>"%MCPREOBLOG%"

    echo + Obfuscating server.
    echo + Obfuscating server. >>"%MCPREOBLOG%"
    "%MCPOBFUSC%" -c "%MCPCONFDIR%\server_obfuscation.txt" -d "%MCSREOBSCRIPT%" -i "%MCSBIN%" -o "%MCSREOBDIR%" >>"%MCPREOBLOG%"

echo === MCP %MCPVERSION% reobfuscation script finished ===
pause
