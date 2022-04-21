@echo off

set MCPVERSION=1.5

set MCPDIR=%CD%

set MCBIN=%MCPDIR%\bin

set MCCP=%MCBIN%\minecraft_server

echo === Minecraft Coder Pack %MCPVERSION% ===

cd "%MCBIN%"
java -Xmx1024M -Xms1024M -cp "%MCCP%" MinecraftServer
