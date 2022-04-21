@echo off
java -Xmx1024M -Xms1024M -cp minecraft;.;..\temp\minecraft;.\jars\bin\jinput.jar;..\jars\bin\lwjgl.jar;..\jars\bin\lwjgl_util.jar -Dorg.lwjgl.librarypath=%CD%\..\jars\bin\natives -Dnet.java.games.input.librarypath=%CD%\.\jars\bin\natives Start
