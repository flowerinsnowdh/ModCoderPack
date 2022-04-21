@echo off

echo UNPACKING MINECRAFT.JAR
unzip -o bin\minecraft.jar * -d minecraft
echo UNPACKING MINECRAFT_SERVER.JAR
unzip -o minecraft_server.jar * -d minecraft_server

echo DECOMPILING MINECRAFT.JAR
jad -f -dead -ff -safe -stat -v -o -s .java -d minecraft.src minecraft\*.class
echo DECOMPILING MINECRAFT_SERVER.JAR
jad -f -dead -ff -safe -stat -v -o -s .java -d minecraft_server.src minecraft_server\*.class

echo APPLYING FILE FIXES
del minecraft\META-INF\MOJANG_C.DSA
del minecraft\META-INF\MOJANG_C.SF
del minecraft_server.src\bn.java
del minecraft.src\dofix.java
ren minecraft.src\do.java dofix.java
del minecraft.src\iffix.java
ren minecraft.src\if.java iffix.java
del minecraft_server.src\dofix.java
ren minecraft_server.src\do.java dofix.java
del minecraft_server.src\iffix.java
ren minecraft_server.src\if.java iffix.java

echo APPLYING SOURCECODE FIXES
applydiff -u -i ..\minecraft.patch -d minecraft.src
applydiff -u -i ..\minecraft_server.patch -d minecraft_server.src

pause
