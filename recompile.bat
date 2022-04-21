@echo off

set MCPVERSION=1.5

set MCPDIR=%CD%
set MCPLOG=%MCPDIR%\logs\minecraft_compile.log

set MCSRC=sources\minecraft
set MCBIN=%MCPDIR%\bin\minecraft
set MCSSRC=sources\minecraft_server
set MCSBIN=%MCPDIR%\bin\minecraft_server

set MCJARS=%MCPDIR%\jars\bin
set MCJAR=%MCJARS%\minecraft.jar
set MCJI=%MCJARS%\jinput.jar
set MCJGL=%MCJARS%\lwjgl.jar
set MCJGLU=%MCJARS%\lwjgl_util.jar

set MCCP=%MCJAR%;%MCJI%;%MCJGL%;%MCJGLU%

set MCSTART=patches\Start.java
set MCEO=patches\eo.java

echo === Minecraft Coder Pack %MCPVERSION% === >"%MCPLOG%"

mkdir "%MCBIN%" 2>NUL:
mkdir "%MCSBIN%" 2>NUL:

echo Compiling Minecraft
echo *** Compiling Minecraft >>"%MCPLOG%"
javac -g -verbose -cp "%MCCP%" -sourcepath "%MCSRC%" -d "%MCBIN%" %MCSRC%\*.java 2>>"%MCPLOG%"

echo Compiling Minecraft Start Class
echo *** Compiling Minecraft Starter >>"%MCPLOG%"
javac -g -verbose -cp "%MCBIN%" -d "%MCBIN%" %MCSTART% 2>>"%MCPLOG%"
javac -g -verbose -cp "%MCBIN%" -d "%MCBIN%" %MCEO% 2>>"%MCPLOG%"

echo Compiling Minecraft Server
echo *** Compiling Minecraft Server >>"%MCPLOG%"
javac -g -verbose -sourcepath "%MCSSRC%" -d "%MCSBIN%" %MCSSRC%\*.java 2>>"%MCPLOG%"

echo === MCP %MCPVERSION% recompile script finished ===
pause
