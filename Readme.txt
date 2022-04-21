Minecraft mod creator pack v1.2
===============================

1) Prepare the files:
- Copy the "minecraft_server.jar" file into this folder.
- Copy the folders "bin" and "resources" from your "%APPDATA$\.minecraft" folder into this folder.

2) Decompilation and patching
- Start the "decompile.bat" script in this folder.

3) Modding
- Modify the sourcecode in the "minecraft.src" folder or in the "minecraft_server.src" folder.

4) Compile
- Start the "recompile.bat" script in this folder.

5) Testing
- To test the modified game, start the "test_game.bat" script in this folder.
- To test the modified server, start the "test_server.bat" script in this folder.

6) Warning
- Make sure that you backup the modified sources before you run "decompile.bat" again or all changes will be lost!

Now have fun and create some cool mods.

Notes:
The "test_game.bat" file uses the "Start.class" file to start the game. This will make sure the game will not
use your "%APPDATA%\.minecraft" folder, but instead use this folder for all saves. So any bugs in the modified
game will not corrupt your worlds.

If you have any problems using this toolpack, put the mcp.log file that the decompile.bat generated into a
zip-file and send it to me (post it in the minecraft forum):

http://www.minecraftforum.net/viewtopic.php?f=25&t=58464

History:
1.2 - Redirect output of all tools to a logfile
1.1 - Fixed TNT bug
1.0 - First release