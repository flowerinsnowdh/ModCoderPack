@echo off

call setup.bat
call findjdk.bat PATH

java -help >NUL 2>NUL
if errorlevel 1 (
    echo Unable to locate java.exe. Please verify that it is in the PATH.
    pause
    exit /b
)

if exist "%MCJADOUT%\net\minecraft\client\Minecraft.java" (
    echo Patching minecraft sources
    echo *** Patching minecraft sources >>"%MCPLOG%"
    %MCPPATCH% -p 1 -u -i "%MLPATCH%" -d "%MCJADOUT%" -s | %MCPTEE% -a "%MCPLOG%"
) else (
    if exist "%MCJAR%" (
        echo *** Client not decompiled, run decompile.bat
    ) else (
        echo *** minecraft.jar was not found, skipping
    )
)

pause
