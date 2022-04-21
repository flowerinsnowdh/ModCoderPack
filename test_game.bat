@echo off

set MCPVERSION=1.5

set MCPDIR=%CD%

set MCBIN=%MCPDIR%\bin\minecraft

set MCTEMP=%MCPDIR%\temp\minecraft

set MCJARS=%MCPDIR%\jars\bin
set MCJI=%MCJARS%\jinput.jar
set MCJGL=%MCJARS%\lwjgl.jar
set MCJGLU=%MCJARS%\lwjgl_util.jar

set MCCP=%MCBIN%;%MCTEMP%;%MCJI%;%MCJGL%;%MCJGLU%

set MCNAT=%MCPDIR%\jars\bin\natives

echo === Minecraft Coder Pack %MCPVERSION% ===

java -Xmx1024M -Xms1024M -cp "%MCCP%" "-Dorg.lwjgl.librarypath=%MCNAT%" "-Dnet.java.games.input.librarypath=%MCNAT%" Start
