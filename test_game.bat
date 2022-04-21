@echo off
java -Xmx1024M -Xms1024M -cp minecraft;.;bin\jinput.jar;bin\lwjgl.jar;bin\lwjgl_util.jar -Dorg.lwjgl.librarypath=%CD%\bin\natives -Dnet.java.games.input.librarypath=%CD%\bin\natives Start
