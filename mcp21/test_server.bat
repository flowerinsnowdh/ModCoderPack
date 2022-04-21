@echo off

java -help > NUL 2> NUL
if errorlevel 1 (
    echo Unable to locate java.exe. Please verify that it is in the PATH.
    pause
    exit /b
)

call setup.bat %1

cd "%MCPBINDIR%"
java -Xmx1024M -Xms1024M -cp "%MCSBIN%" net.minecraft.server.MinecraftServer
