@echo off

java -help > NUL 2> NUL
if errorlevel 1 (
    echo Unable to locate java.exe. Please verify that it is in the PATH.
    pause
    exit /b
)

call setup.bat %1

java -Xmx1024M -Xms1024M -cp "%MCTESTCP%" "-Dorg.lwjgl.librarypath=%MCNAT%" "-Dnet.java.games.input.librarypath=%MCNAT%" Start
