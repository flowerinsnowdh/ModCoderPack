@echo off

set MCPVERSION=1.5

set MCPDIR=%CD%
set MCPLOG=%MCPDIR%\logs\minecraft.log
set MCPTOOLS=%MCPDIR%\tools
set MCPRG=java -cp "%MCPTOOLS%\retroguard.jar" RetroGuard
set MCPUNZIP=%MCPTOOLS%\unzip.exe
set MCPJR=%MCPTOOLS%\jadretro.exe
set MCPJAD=%MCPTOOLS%\jad.exe
set MCPPATCH=%MCPTOOLS%\applydiff.exe

set MCJAR=%MCPDIR%\jars\bin\minecraft.jar
set MCSJAR=%MCPDIR%\jars\minecraft_server.jar

set MCRGJAR=%MCPDIR%\temp\minecraft_rg.jar
set MCRGSCRIPT=%MCPDIR%\conf\minecraft.rgs
set MCRGLOG=%MCPDIR%\logs\minecraft_rg.log

set MCSRGJAR=%MCPDIR%\temp\minecraft_server_rg.jar
set MCSRGSCRIPT=%MCPDIR%\conf\minecraft_server.rgs
set MCSRGLOG=%MCPDIR%\logs\minecraft_server_rg.log

set MCTEMP=%MCPDIR%\temp\minecraft
set MCSTEMP=%MCPDIR%\temp\minecraft_server

set MCJADOUT=%MCPDIR%\sources\minecraft
set MCSJADOUT=%MCPDIR%\sources\minecraft_server

set MCPATCH=%MCPDIR%\patches\minecraft.patch
set MCSPATCH=%MCPDIR%\patches\minecraft_server.patch

echo === Minecraft Coder Pack %MCPVERSION% === >"%MCPLOG%"
echo === Minecraft Coder Pack %MCPVERSION% ===

echo MCP %MCPVERSION% running in %MCPDIR%

if exist "%MCJAR%" (
    echo *** minecraft.jar was found, processing >>"%MCPLOG%"
    
    echo Deobfuscating minecraft.jar
    echo *** Deobfuscating minecraft.jar >>"%MCPLOG%"
    %MCPRG% "%MCJAR%" "%MCRGJAR%" "%MCRGSCRIPT%" "%MCRGLOG%" >>"%MCPLOG%"
    
    echo Unpacking minecraft.jar
    echo *** Unpacking minecraft.jar >>"%MCPLOG%"
    "%MCPUNZIP%" -o "%MCRGJAR%" * -d "%MCTEMP%" >>"%MCPLOG%"
    del /f /q "%MCTEMP%\META-INF\MOJANG_C.*"

    echo Fixing minecraft classes
    echo *** Fixing minecraft classes >>"%MCPLOG%"
    "%MCPJR%" -b "%MCTEMP%" >>"%MCPLOG%" 2>NUL:

    echo Decompiling minecraft classes
    echo *** Decompiling minecraft classes >>"%MCPLOG%"
    "%MCPJAD%" -b -d "%MCJADOUT%" -dead -o -r -s .java -stat -v "%MCTEMP%\*.class" 2>>"%MCPLOG%"
    "%MCPJAD%" -b -d "%MCJADOUT%" -dead -o -s .java -stat -v "%MCTEMP%\net\minecraft\client\*.class" 2>>"%MCPLOG%"

    echo Patching minecraft sources
    echo *** Patching minecraft sources >>"%MCPLOG%"
    "%MCPPATCH%" -u -i "%MCPATCH%" -d "%MCJADOUT%" >>"%MCPLOG%"

) else (
    echo Minecraft.jar was not found.
    echo Minecraft.jar was not found >>"%MCPLOG%"
)

if exist "%MCSJAR%" (
    echo *** minecraft_server.jar was found, processing >>"%MCPLOG%"
    
    echo Deobfuscating minecraft_server.jar
    echo *** Deobfuscating minecraft_server.jar >>"%MCPLOG%"
    %MCPRG% "%MCSJAR%" "%MCSRGJAR%" "%MCSRGSCRIPT%" "%MCSRGLOG%" >>"%MCPLOG%"
    
    echo Unpacking minecraft_server.jar
    echo *** Unpacking minecraft_server.jar >>"%MCPLOG%"
    "%MCPUNZIP%" -o "%MCSRGJAR%" * -d "%MCSTEMP%" >>"%MCPLOG%"

    echo Fixing minecraft server classes
    echo *** Fixing minecraft server classes >>"%MCPLOG%"
    "%MCPJR%" -b "%MCSTEMP%" >>"%MCPLOG%" 2>NUL:

    echo Decompiling minecraft server classes
    echo *** Decompiling minecraft server classes >>"%MCPLOG%"
    "%MCPJAD%" -b -d "%MCSJADOUT%" -dead -o -r -s .java -stat -v "%MCSTEMP%\*.class" 2>>"%MCPLOG%"
    "%MCPJAD%" -b -d "%MCSJADOUT%" -dead -o -s .java -stat -v "%MCSTEMP%\net\minecraft\server\*.class" 2>>"%MCPLOG%"

    echo Patching minecraft server sources
    echo *** Patching minecraft server sources >>"%MCPLOG%"
    "%MCPPATCH%" -u -i "%MCSPATCH%" -d "%MCSJADOUT%" >>"%MCPLOG%"

) else (
    echo Minecraft_server.jar was not found.
    echo Minecraft_server.jar was not found >>"%MCPLOG%"
)

echo === MCP %MCPVERSION% decompile script finished ===
pause
