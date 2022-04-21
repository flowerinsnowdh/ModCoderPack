set MCPVERSION=2.6
set MCVERSION=%1

echo *** Minecraft Coder Pack Version %MCPVERSION% ***
if NOT "%MCVERSION%" == "" echo *** Processing Minecraft version %MCVERSION% ***

set MCPDIR=%CD%
set MCPTOOLSDIR=%MCPDIR%\tools
set MCPLOGDIR=%MCPDIR%\logs\%MCVERSION%
set MCPJARSDIR=%MCPDIR%\jars\%MCVERSION%
set MCPCONFDIR=%MCPDIR%\conf\%MCVERSION%
set MCPTEMPDIR=%MCPDIR%\temp\%MCVERSION%
set MCPSOURCESDIR=%MCPDIR%\sources\%MCVERSION%
set MCPSOURCEBASE=sources\%MCVERSION%
set MCPPATCHDIR=%MCPDIR%\patches\%MCVERSION%
set MCPBINDIR=%MCPDIR%\bin\%MCVERSION%

set MCPLOG=%MCPLOGDIR%\minecraft.log
set MCPCOMPLOG=%MCPLOGDIR%\minecraft_compile.log
set MCPRG=java -cp "%MCPTOOLSDIR%\retroguard.jar" RetroGuard
set MCPUNZIP=%MCPTOOLSDIR%\unzip.exe
set MCPJR=%MCPTOOLSDIR%\jadretro.exe
set MCPJAD=%MCPTOOLSDIR%\jad.exe
set MCPPATCH=%MCPTOOLSDIR%\applydiff.exe
set MCPGETCSV=%MCPTOOLSDIR%\get_csv.exe
set MCPRENAMER=%MCPTOOLSDIR%\renamer.exe
set MCPREPACK=%MCPTOOLSDIR%\repackage.exe
set MCPOBFUSC=%MCPTOOLSDIR%\obfuscathon.exe
set MCPTEE=%MCPTOOLSDIR%\tee.exe
set MCPGREP=%MCPTOOLSDIR%\grep.exe

set MCJAR=%MCPJARSDIR%\bin\minecraft.jar
set MCSJAR=%MCPJARSDIR%\minecraft_server.jar
set MCJI=%MCPJARSDIR%\bin\jinput.jar
set MCJGL=%MCPJARSDIR%\bin\lwjgl.jar
set MCJGLU=%MCPJARSDIR%\bin\lwjgl_util.jar
set MCCP=%MCJAR%;%MCJI%;%MCJGL%;%MCJGLU%

set MCRGJAR=%MCPTEMPDIR%\minecraft_rg.jar
set MCRGSCRIPT=%MCPCONFDIR%\minecraft.rgs
set MCRGLOG=%MCPLOGDIR%\minecraft_rg.log

set MCSRGJAR=%MCPTEMPDIR%\minecraft_server_rg.jar
set MCSRGSCRIPT=%MCPCONFDIR%\minecraft_server.rgs
set MCSRGLOG=%MCPLOGDIR%\minecraft_server_rg.log

set MCTEMP=%MCPTEMPDIR%\minecraft
set MCSTEMP=%MCPTEMPDIR%\minecraft_server

set MCJADOUT=%MCPSOURCESDIR%\minecraft
set MCSJADOUT=%MCPSOURCESDIR%\minecraft_server

set MCPACKAGE=net.minecraft.src
set MCSPACKAGE=net.minecraft.src

set MCPATCH=%MCPPATCHDIR%\minecraft.patch
set MCSPATCH=%MCPPATCHDIR%\minecraft_server.patch
set MCPSPLASHES=%MCPPATCHDIR%\splashes.txt

set MCSTART=%MCPPATCHDIR%\Start.java
set MCSNDFIX=%MCPPATCHDIR%\fr.java

set MCSRC1=%MCPSOURCEBASE%\minecraft\net\minecraft\client
set MCSRC2=%MCPSOURCEBASE%\minecraft\net\minecraft\src
set MCBIN=%MCPBINDIR%\minecraft
set MCSSRC1=%MCPSOURCEBASE%\minecraft_server\net\minecraft\server
set MCSSRC2=%MCPSOURCEBASE%\minecraft_server\net\minecraft\src
set MCSBIN=%MCPBINDIR%\minecraft_server

set MCSPLASHES=%MCPTEMPDIR%\minecraft\title\splashes.txt

set MCTESTCP=%MCBIN%;%MCTEMP%;%MCJI%;%MCJGL%;%MCJGLU%
set MCNAT=%MCPJARSDIR%\bin\natives
set MCSTESTCP=%MCSBIN%;%MCSTEMP%

set MCREOBSCRIPT=%MCPDIR%\conf\minecraft_rev.saffx
set MCSREOBSCRIPT=%MCPDIR%\conf\minecraft_server_rev.saffx
set MCREOBDIR=%MCPDIR%\final_out\minecraft
set MCSREOBDIR=%MCPDIR%\final_out\minecraft_server

set MCPREOBJAR=%MCPTEMPDIR%\minecraft_preob.jar
set MCSPREOBJAR=%MCPTEMPDIR%\minecraft_server_preob.jar
set MCPOSTOBJAR=%MCPTEMPDIR%\minecraft_obfuscated.jar
set MCSPOSTOBJAR=%MCPTEMPDIR%\minecraft_server_obfuscated.jar

set MCPREOBLOG=%MCPDIR%\logs\reobf.log
set MCREOBLOG=%MCPDIR%\logs\reobf_minecraft_rg.log
set MCSREOBLOG=%MCPDIR%\logs\reobf_minecraft_server_rg.log
