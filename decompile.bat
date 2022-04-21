@echo off

set MCPDIR=%CD%
set MCPLOG=%MCPDIR%\logs\minecraft.log
set MCPTOOLS=%MCPDIR%\tools
set MCPRG=java -cp %MCPTOOLS%\retroguard.jar RetroGuard
set MCPUNZIP=%MCPTOOLS%\unzip.exe
set MCPJR=%MCPTOOLS%\jadretro.exe
set MCPJAD=%MCPTOOLS%\jad.exe
set MCPPATCH=%MCPTOOLS%\applydiff.exe

set MCJAR=%MCPDIR%\jars\bin\minecraft.jar
set MCSJAR=%MCPDIR%\jars\minecraft_server.jar

set MCRGJAR=%MCPDIR%\temp\minecraft_rg.jar
set MCRGSCRIPT=%MCPDIR%\conf\minecraft.rgs
set MCRGLOG=%MCPDIR%\logs\minecraft_rg.log

set MCTEMP=%MCPDIR%\temp\minecraft

set MCJADOUT=%MCPDIR%\sources\minecraft

set MCPATCH=%MCPDIR%\patches\minecraft.patch

echo === Minecraft Coder Pack 1.4 === >%MCPLOG%
echo === Minecraft Coder Pack 1.4 ===

echo MCP 1.4 running in %MCPDIR%

if exist "%MCJAR%" (
    echo *** minecraft.jar was found, processing >>%MCPLOG%
    
    echo Deobfuscating minecraft.jar
    echo *** Deobfuscating minecraft.jar >>%MCPLOG%
    %MCPRG% %MCJAR% %MCRGJAR% %MCRGSCRIPT% %MCRGLOG%
    
    echo Unpacking minecraft.jar
    echo *** Unpacking minecraft.jar >>%MCPLOG%
    %MCPUNZIP% -o %MCRGJAR% * -d %MCTEMP% >>%MCPLOG%
    del /f /q %MCTEMP%\META-INF\MOJANG_C.*

    echo Fixing minecraft classes
    echo *** Fixing minecraft classes >>%MCPLOG%
    %MCPJR% -b %MCTEMP% >>%MCPLOG% 2>NUL:

    echo Decompiling minecraft classes
    echo *** Decompiling minecraft classes >>%MCPLOG%
    %MCPJAD% -b -d %MCJADOUT% -dead -o -r -s .java -stat -v %MCTEMP%\*.class 2>>%MCPLOG%
    %MCPJAD% -b -d %MCJADOUT% -dead -o -s .java -stat -v %MCTEMP%\net\minecraft\client\*.class 2>>%MCPLOG%

    echo Patching minecraft sources
    echo *** Patching minecraft sources >>%MCPLOG%
    %MCPPATCH% -u -i %MCPATCH% -d %MCJADOUT% >>%MCPLOG%

) else (
    echo Minecraft.jar was not found.
    echo Minecraft.jar was not found >>%MCPLOG%
)

echo === MCP 1.4 decompile script finished ===
pause
