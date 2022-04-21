@echo off
javac -g -verbose -cp bin\minecraft.jar;bin\jinput.jar;bin\lwjgl.jar;bin\lwjgl_util.jar -sourcepath minecraft.src -d minecraft minecraft.src\*.java
javac -g -verbose -cp minecraft_server.jar -sourcepath minecraft_server.src -d minecraft_server minecraft_server.src\*.java
pause