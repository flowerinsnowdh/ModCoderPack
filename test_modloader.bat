@echo off

call setup.bat
call findjdk.bat PATH

java -help >NUL 2>NUL
if errorlevel 1 (
    echo Unable to locate java.exe. Please verify that it is in the PATH.
    pause
    exit /b
)

if exist "%MCPPATCHDIR%\modloader.jar" (
    %MCPUNZIP% -o "%MCPPATCHDIR%\modloader.jar" * -d "%MCBIN%"
) else (
    echo *** mod loader jar file not found
    exit /b
)

if exist "%MCBIN%\net\minecraft\client\Minecraft.class" (
    java -Xms1024M -Xmx1024M -cp "%MCTESTCP%" "-Djava.library.path=%MCNAT%" Start
) else (
    echo *** Client not compiled, run recompile.bat
)

pause
