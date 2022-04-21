Minecraft mod creator pack v1.5
===============================

CLASSES COMPILED WITH THIS VERSION OF THE SOURCECODE ARE NOT COMPATIBLE WITH THE ORIGINAL *.JAR FILES !!!

I know this is a lot to read, but please don't complain about anything before you've read this completely!

1) Prepare the files:
- Copy the "minecraft_server.jar" file into the "jars" folder.
- Copy the folders "bin" and "resources" from your "%APPDATA$\.minecraft" folder into the "jars" folder.

2) Decompilation and patching
- Start the "decompile.bat" script in this folder.

3) Modding
- Modify the sourcecode in the "sources\minecraft" folder or in the "sources\minecraft_server" folder.

4) Compile
- Start the "recompile.bat" script in this folder.

5) Testing
- To test the modified game, start the "test_game.bat" script
- To test the modified server, start the "test_server.bat" script

6) Warning
- Make sure that you backup the modified sources before you run "decompile.bat" again or all changes will be lost!
- The "cleanup.bat" file will delete most of the generated files and sources. Be careful with this one :)

Now have fun and create some cool mods.

Notes:
* Make sure that the bin folder of the JDK is in the PATH environment variable, this is necessary for the
  recompile scripts to work properly.

* Make sure you use the original minecraft.jar and minecraft_server.jar files. If you have already modded them
  they will NOT work with the patches in these scripts.

* The "test_game.bat" file uses the "Start.class" file to start the game. This will make sure the game will not
  use your "%APPDATA%\.minecraft" folder, but instead use the "jars" folder for all saves. So any bugs in the modified
  game will not corrupt your normal worlds.

* If you have any problems using this toolpack, put the "logs\*.log" files that the scripts generated into a
  zip-file and send it to me (post it in the minecraft forum):
  http://www.minecraftforum.net/viewtopic.php?f=25&t=58464
  
* This version of the mod creator package uses a deobfuscator to change all field and method names in the sources.
  Look in the "conf\minecraft.rgs" and "conf\minecraft_server.rgs" files for a complete mapping of the names. These
  can be changed, but the resulting "*.class" files after recompile will not be compatible with the patches of this
  package anymore.

* If you want to help to improve the names for classes, methods and fields, just copy the "minecraft.rgs" and
  "minecraft_server.rgs" files and make your changes in the copied file. You can send me the changes you made
  and I will eventually merge them in future versions of the package.
  http://www.minecraftforum.net/viewtopic.php?f=25&t=58464

* Remeber that the compiled "*.class" files of this package are NOT compatible with an original minecraft.jar file. So
  you can't easily create mods with this for other users at the moment. I will take care of this in a later version.

* All fields and methods have unique names now, so if you reference field "field_1234" in any posts in the forum I will
  know exactly which field in the whole sourcecode you're talking about. This could also be useful for further analysis
  of the code, because everybody using this package will also be able to locate the field or method easily.

* In version 1.5 the naming convention for the de-obfuscator has changed. All renamed field will contain the original
  name in the new, unique name. So a field "f" will become "field_1234_f" and a method "int c(double)" will become
  "int func_4321_c(double)". This will make it easier to understand how the original names were before de-obfuscation.

* There are currently no known bugs in the recompiled game or server, except those that were already in the original
  game :) The known bugs, like missing sound effects or the backspace bug in the text entry gui, are fixed with this
  release.

Credits:
* Searge - Created this nice package.
* fotoply - Helped me to improve the batch files.
* Sage Pourpre - His thread in the forums inspired me to create this toolpack.
* Tei - Was the first one to reply in my forum thread and inspired me to create the deobfuscation.
* Cadde - helping to create the de-obfuscation table
* Everybody who contributed to the great google spreadsheet or who created some mods (I've got them all :).
and, last not least
* Notch - For creating a game that is just awesome, I hope he does not feel offended by our decompiling efforts.
Please, Notch, support our ambitions to mod your game. I know people who bought it just because of some great mods.

Roadmap:
These are the plans for the next releases of this package. These plans might change eventually, but for the moment
that is what I want to do next.
1.6 - Create some scripts that allow you to patch existing mods to be compatible with the recompiled game
1.7 - Create a nice Starter that will also allow you to select the mods and/or texture packs you like to use
1.8 - Update everything to support the Halloween update after release
1.9 - Create a script that will create a modified minecraft.jar and minecraft_server.jar to replace the originals
2.0 - New scripts that will automatically fix the most annoying bugs, like the texture fix or the crash fixes
2.1 - (I don't know yet, you might want to make suggestions the the forum thread)

History:
1.5 - Extend the scripts to also support decompiling, recompiling and testing the minecraft_server.jar file
1.4 - Using a deobfuscator to rename all fields and methods and jadretro to fix some decompile bugs
1.3 - Added upgrade scripts to decompile and recompile Minecraft.class, MinecraftApplet.class and MinecraftServer.class
1.2 - Redirect output of all tools to a logfile
1.1 - Fixed TNT bug
1.0 - First release
