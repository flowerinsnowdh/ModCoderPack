@echo off

set MCPDIR=%CD%

set MCBIN=%MCPDIR%\bin

set MCTEMP=%MCPDIR%\temp\minecraft

set MCJARS=%MCPDIR%\jars\bin
set MCJI=%MCJARS%\jinput.jar
set MCJGL=%MCJARS%\lwjgl.jar
set MCJGLU=%MCJARS%\lwjgl_util.jar

set MCCP=%MCBIN%;%MCTEMP%;%MCJI%;%MCJGL%;%MCJGLU%

set MCNAT=%MCPDIR%\jars\bin\natives

echo === Minecraft Coder Pack 1.4 ===

java -Xmx1024M -Xms1024M -cp %MCCP% -Dorg.lwjgl.librarypath=%MCNAT% -Dnet.java.games.input.librarypath=%MCNAT% Start
