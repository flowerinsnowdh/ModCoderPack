@echo off
mkdir minecraft\minecraft 2>nul:
mkdir minecraft\minecraft_server 2>nul:
mkdir minecraft_fixed\minecraft 2>nul:
mkdir minecraft_fixed\minecraft_server 2>nul:
echo -=#=- >logs\compile.log
echo COMPILING NORMAL MINECRAFT
javac -g -verbose -cp jars\bin\minecraft.jar;jars\bin\jinput.jar;jars\bin\lwjgl.jar;jars\bin\lwjgl_util.jar -sourcepath sources\minecraft -d minecraft\minecraft sources\minecraft\*.java 2>>logs\compile.log
echo -=#=- >>logs\compile.log
echo COMPILING NORMAL MINECRAFT SERVER
javac -g -verbose -cp jars\minecraft_server.jar -sourcepath sources\minecraft_server -d minecraft\minecraft_server sources\minecraft_server\*.java 2>>logs\compile.log
echo -=#=- >>logs\compile.log
echo -=#=- >logs\compile2.log
echo COMPILING FIXED MINECRAFT
javac -g -verbose -cp jars\bin\minecraft.jar;jars\bin\jinput.jar;jars\bin\lwjgl.jar;jars\bin\lwjgl_util.jar -sourcepath sources\minecraft_fixed -d minecraft_fixed\minecraft sources\minecraft_fixed\*.java 2>>logs\compile2.log
echo -=#=- >>logs\compile2.log
echo COMPILING FIXED MINECRAFT SERVER
javac -g -verbose -cp jars\minecraft_server.jar -sourcepath sources\minecraft_server_fixed -d minecraft_fixed\minecraft_server sources\minecraft_server_fixed\*.java 2>>logs\compile2.log
echo -=#=- >>logs\compile2.log

echo COMPILING NORMAL MINECRAFT STARTER
javac -g -verbose -cp minecraft\minecraft;jars\bin\minecraft.jar;jars\bin\jinput.jar;jars\bin\lwjgl.jar;jars\bin\lwjgl_util.jar -sourcepath minecraft -d minecraft minecraft\Start.java 2>>logs\compile.log
echo -=#=- >>logs\compile.log
echo COMPILING FIXED MINECRAFT STARTER
javac -g -verbose -cp minecraft_fixed\minecraft;jars\bin\minecraft.jar;jars\bin\jinput.jar;jars\bin\lwjgl.jar;jars\bin\lwjgl_util.jar -sourcepath minecraft_fixed -d minecraft_fixed minecraft_fixed\Start.java 2>>logs\compile2.log
echo -=#=- >>logs\compile2.log

echo DONE
pause
