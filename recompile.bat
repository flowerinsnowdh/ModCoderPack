@echo off

set MCPDIR=%CD%
set MCPLOG=%MCPDIR%\logs\minecraft_compile.log

set MCSRC=%MCPDIR%\sources\minecraft
set MCBIN=%MCPDIR%\bin

set MCJARS=%MCPDIR%\jars\bin
set MCJAR=%MCJARS%\minecraft.jar
set MCJI=%MCJARS%\jinput.jar
set MCJGL=%MCJARS%\lwjgl.jar
set MCJGLU=%MCJARS%\lwjgl_util.jar

set MCCP=%MCJAR%;%MCJI%;%MCJGL%;%MCJGLU%

set MCSTART=%MCPDIR%\patches\Start.java

echo === Minecraft Coder Pack 1.4 === >%MCPLOG%

echo Compiling Minecraft
echo *** Compiling Minecraft >>%MCPLOG%
javac -g -verbose -cp %MCCP% -sourcepath %MCSRC% -d %MCBIN% %MCSRC%\*.java 2>>%MCPLOG%

echo Compiling Minecraft Starter
echo *** Compiling Minecraft Starter >>%MCPLOG%
javac -g -verbose -cp %MCBIN% -d %MCBIN% %MCSTART% 2>>%MCPLOG%

echo === MCP 1.4 recompile script finished ===
pause
