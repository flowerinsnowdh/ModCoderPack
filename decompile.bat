@echo off
echo -=#=- >logs\mcp.log
echo UNPACKING MINECRAFT.JAR
tools\unzip -o jars\bin\minecraft.jar * -d temp\minecraft >>logs\mcp.log
echo -=#=- >>logs\mcp.log
echo UNPACKING MINECRAFT_SERVER.JAR
tools\unzip -o jars\minecraft_server.jar * -d temp\minecraft_server >>logs\mcp.log
echo -=#=- >>logs\mcp.log
echo DECOMPILING MINECRAFT.JAR
tools\jad -f -dead -ff -safe -stat -v -o -s .java -d sources\minecraft temp\minecraft\*.class 2>>logs\mcp.log
echo -=#=- >>logs\mcp.log
echo DECOMPILING MINECRAFT_SERVER.JAR
tools\jad -f -dead -ff -safe -stat -v -o -s .java -d sources\minecraft_server temp\minecraft_server\*.class 2>>logs\mcp.log
echo -=#=- >>logs\mcp.log
echo APPLYING FILE FIXES
del temp\minecraft\META-INF\MOJANG_C.DSA 2>NUL:
del temp\minecraft\META-INF\MOJANG_C.SF 2>NUL:
del sources\minecraft\dofix.java 2>NUL:
ren sources\minecraft\do.java dofix.java
del sources\minecraft\iffix.java 2>NUL:
ren sources\minecraft\if.java iffix.java
del sources\minecraft_server\dofix.java 2>NUL:
ren sources\minecraft_server\do.java dofix.java
del sources\minecraft_server\iffix.java 2>NUL:
ren sources\minecraft_server\if.java iffix.java
echo APPLYING SOURCECODE FIXES
tools\applydiff -u -i ..\..\patches\minecraft.patch -d sources\minecraft >>logs\mcp.log
echo -=#=- >>logs\mcp.log
tools\applydiff -u -i ..\..\patches\minecraft_server.patch -d sources\minecraft_server >>logs\mcp.log
echo -=#=- >>logs\mcp.log
dir /b sources\minecraft >>logs\mcp.log
echo -=#=- >>logs\mcp.log
dir /b sources\minecraft_server >>logs\mcp.log
echo -=#=- >>logs\mcp.log

echo -=#=- >logs\mcp2.log
echo PREPARING FOLDERS FOR FIXED VERSION
mkdir sources\minecraft_fixed 2>nul:
copy sources\minecraft\*.java sources\minecraft_fixed\ >>logs\mcp2.log
mkdir sources\minecraft_server_fixed 2>nul:
copy sources\minecraft_server\*.java sources\minecraft_server_fixed\ >>logs\mcp2.log
del sources\minecraft_server\bn.java 2>NUL:
echo DECOMPILING MINECRAFT.JAR
tools\jad -f -dead -ff -safe -stat -v -o -s .java -d sources\minecraft_fixed temp\minecraft\net\minecraft\client\*.class 2>>logs\mcp2.log
echo -=#=- >>logs\mcp2.log
echo DECOMPILING MINECRAFT_SERVER.JAR
tools\jad -f -dead -ff -safe -stat -v -o -s .java -d sources\minecraft_server_fixed temp\minecraft_server\net\minecraft\server\*.class 2>>logs\mcp2.log
echo -=#=- >>logs\mcp2.log
echo APPLYING SOURCECODE FIXES
tools\applydiff -u -i ..\..\patches\minecraft.upgrade.patch -d sources\minecraft_fixed >>logs\mcp2.log
echo -=#=- >>logs\mcp2.log
tools\applydiff -u -i ..\..\patches\minecraft_server.upgrade.patch -d sources\minecraft_server_fixed >>logs\mcp2.log
echo -=#=- >>logs\mcp2.log
dir /b sources\minecraft_fixed >>logs\mcp2.log
echo -=#=- >>logs\mcp2.log
dir /b sources\minecraft_server_fixed >>logs\mcp2.log
echo -=#=- >>logs\mcp2.log

echo DONE
pause
