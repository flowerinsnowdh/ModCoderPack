@echo off
echo CLEANING UP
del /f /q /s logs\*.log 2>NUL:
rmdir /q /s sources\minecraft\ 2>NUL:
rmdir /q /s sources\minecraft_server\ 2>NUL:
rmdir /q /s sources\minecraft_fixed\ 2>NUL:
rmdir /q /s sources\minecraft_server_fixed\ 2>NUL:
rmdir /q /s temp\minecraft\ 2>NUL:
rmdir /q /s temp\minecraft_server\ 2>NUL:
rmdir /q /s minecraft\minecraft\ 2>NUL:
rmdir /q /s minecraft\minecraft_server\ 2>NUL:
rmdir /q /s minecraft_fixed\minecraft\ 2>NUL:
rmdir /q /s minecraft_fixed\minecraft_server\ 2>NUL:
del /f /q /s minecraft\Start.class 2>NUL:
del /f /q /s minecraft_fixed\Start.class 2>NUL:
rmdir /q /s minecraft\world\ 2>NUL:
rmdir /q /s minecraft_fixed\world\ 2>NUL:
del /f /q /s minecraft\banned*.txt 2>NUL:
del /f /q /s minecraft\ops.txt 2>NUL:
del /f /q /s minecraft\server.log 2>NUL:
del /f /q /s minecraft_fixed\banned*.txt 2>NUL:
del /f /q /s minecraft_fixed\ops.txt 2>NUL:
del /f /q /s minecraft_fixed\server.log 2>NUL:
echo DONE
@pause
