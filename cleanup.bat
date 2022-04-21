@echo off
echo CLEANING UP
del /f /q /s bin\*.class >NUL: 2>NUL:
del /f /q /s logs\*.log >NUL: 2>NUL:
del /f /q /s temp\*.jar >NUL: 2>NUL:
rmdir /q /s temp\minecraft\ 2>NUL:
rmdir /q /s sources\minecraft\ 2>NUL:
echo DONE
@pause
