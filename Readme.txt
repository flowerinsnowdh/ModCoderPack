Minecraft mod creator pack v1.3
===============================

1) Prepare the files:
- Copy the "minecraft_server.jar" file into the "jars" folder.
- Copy the folders "bin" and "resources" from your "%APPDATA$\.minecraft" folder into the "jars" folder.

2) Decompilation and patching
- Start the "decompile.bat" script in this folder.

3) Modding
- Modify the sourcecode in the "sources\minecraft" folder or in the "sources\minecraft_server" folder.
- The folders "sources\minecraft_fixed" and "sources\minecraft_server_fixed" contain special versions.

4) Compile
- Start the "recompile.bat" script in this folder.

5) Testing
- To test the modified game, start the "test_game.bat" script in the "minecraft" folder.
- To test the modified server, start the "test_server.bat" script in the "minecraft" folder.
- To test the special modified game, start the "test_game.bat" script in the "minecraft_fixed" folder.
- To test the special modified server, start the "test_server.bat" script in the "minecraft_fixed" folder.

6) Warning
- Make sure that you backup the modified sources before you run "decompile.bat" again or all changes will be lost!
- The "cleanup.bat" file will delete most of the generated files and sources. Be careful with this one :)


Now have fun and create some cool mods.


Notes:
* The "test_game.bat" file uses the "Start.class" file to start the game. This will make sure the game will not
  use your "%APPDATA%\.minecraft" folder, but instead use the "jars" folder for all saves. So any bugs in the modified
  game will not corrupt your normal worlds.

* If you have any problems using this toolpack, put the "logs\mcp.log" file that the "decompile.bat" generated into a
  zip-file and send it to me (post it in the minecraft forum):
  http://www.minecraftforum.net/viewtopic.php?f=25&t=58464
  
* The folders "sources\minecraft_fixed" and "sources\minecraft_server_fixed" contain special versions of the
  sourcecode where Minecraft.class, MinecraftApplet.class and MinecraftServer.class are decompiled and patched
  in a way that they can be changed and recompiled.
  CLASSES COMPILED WITH THIS VERSION OF THE SOURCECODE ARE NOT COMPATIBLE WITH THE NORMAL MINECRAFT.JAR FILE !!!


History:
1.3 - Added upgrade scripts to decompile and recompile Minecraft.class, MinecraftApplet.class and MinecraftServer.class
1.2 - Redirect output of all tools to a logfile
1.1 - Fixed TNT bug
1.0 - First release
