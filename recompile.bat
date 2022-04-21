@echo off

call setup.bat %1
call findjdk.bat PATH

javac -help > NUL 2> NUL
if errorlevel 1 (
    echo Unable to locate javac.exe. Please verify that it is in the PATH.
    echo If you don't know where to get it, please visit http://www.oracle.com/technetwork/java/javase/downloads/index.html and download a JDK.
    pause
    exit /b
)

mkdir "%MCBIN%" 2>NUL:
mkdir "%MCSBIN%" 2>NUL:

echo === Minecraft Coder Pack %MCPVERSION% === >"%MCPCOMPLOG%"

if exist "%MCJADOUT%\net\minecraft\client\Minecraft.java" (
    echo Compiling Minecraft

    echo *** Compiling Minecraft >>"%MCPCOMPLOG%"
    javac -g -verbose -cp "%MCCP%" -sourcepath "%MCJADOUT%" -d "%MCBIN%" %MCSRC1%\*.java %MCSRC2%\*.java "%MCSTART%" 2>&1 | "%MCPTEE%" -a "%MCPCOMPLOG%" | "%MCPGREP%" -v "^\[" | "%MCPGREP%" -v "^Note:"

    echo Compiling Minecraft Start Class
    echo *** Compiling Minecraft Starter >>"%MCPCOMPLOG%"
    javac -g -verbose -sourcepath "%MCJADOUT%" -d "%MCBIN%" "%MCSNDFIX%" 2>&1 | "%MCPTEE%" -a "%MCPCOMPLOG%" | "%MCPGREP%" -v "^\[" | "%MCPGREP%" -v "^Note:"
) else (
    if exist "%MCJAR%" (
        echo *** Client not decompiled, run decompile.bat
    ) else (
        echo *** minecraft.jar was not found, skipping
    )
)


if exist "%MCSJADOUT%\net\minecraft\server\MinecraftServer.java" (
    echo Compiling Minecraft Server
    echo *** Compiling Minecraft Server >>"%MCPCOMPLOG%"
    javac -g -verbose -sourcepath "%MCSJADOUT%" -d "%MCSBIN%" %MCSSRC1%\*.java %MCSSRC2%\*.java 2>&1 | "%MCPTEE%" -a "%MCPCOMPLOG%" | "%MCPGREP%" -v "^\[" | "%MCPGREP%" -v "^Note:"
) else (
    if exist "%MCSJAR%" (
        echo *** Server not decompiled, run decompile.bat
    ) else (
        echo *** minecraft_server.jar was not found, skipping
    )
)

echo === MCP %MCPVERSION% recompile script finished ===

pause
