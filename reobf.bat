@echo off

call setup.bat %1

rmdir /q /s "%MCREOBDIR%" 2>NUL:
rmdir /q /s "%MCSREOBDIR%" 2>NUL:

if NOT EXIST "%MCPTEMPDIR%"    mkdir "%MCPTEMPDIR%"
if NOT EXIST "%MCPSOURCESDIR%" mkdir "%MCPSOURCESDIR%"
if NOT EXIST "%MCPLOGDIR%"     mkdir "%MCPLOGDIR%"
if NOT EXIST "%MCREOBDIR%\net\minecraft\client" mkdir "%MCREOBDIR%\net\minecraft\client"
if NOT EXIST "%MCSREOBDIR%\net\minecraft\server" mkdir "%MCSREOBDIR%\net\minecraft\server"

echo === Minecraft Coder Pack %MCPVERSION% === >"%MCPREOBLOG%"

echo MCP %MCPVERSION% running in %MCPDIR%

if exist "%MCBIN%\net\minecraft\client\Minecraft.class" (
    echo + Obfuscating client.
    echo + Obfuscating client. >>"%MCPREOBLOG%"
    "%MCPOBFUSC%" -c "%MCPCONFDIR%\client_obfuscation.txt" -d "%MCREOBSCRIPT%" -i "%MCBIN%" -o "%MCREOBDIR%" >>"%MCPREOBLOG%"
) else (
    echo *** Client not compiled, skipping
)

if exist "%MCSBIN%\net\minecraft\server\MinecraftServer.class" (
    echo + Obfuscating server.
    echo + Obfuscating server. >>"%MCPREOBLOG%"
    "%MCPOBFUSC%" -c "%MCPCONFDIR%\server_obfuscation.txt" -d "%MCSREOBSCRIPT%" -i "%MCSBIN%" -o "%MCSREOBDIR%" >>"%MCPREOBLOG%"
) else (
    echo *** Server not compiled, skipping
)

echo === MCP %MCPVERSION% reobfuscation script finished ===

pause
