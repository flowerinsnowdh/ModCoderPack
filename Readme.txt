Minecraft mod creator pack 2.0 for Minecraft 1.2.1_01
=====================================================

Welcome to the first release of MCP for post-Halloween Minecraft versions.

CLASSES COMPILED WITH THIS VERSION OF THE TOOLPACK ARE NOT COMPATIBLE WITH THE ORIGINAL *.JAR FILES !!!

How to use:
===========
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

WARNINGS:
=========
- Make sure that you backup the modified sources before you run "decompile.bat" again or all changes will be lost!
- The "cleanup.bat" file will delete most of the generated files and sources. Be careful with this one :)

Notes:
======
* Do not use this to release complete packages of minecraft jar, class or java files. They are copyrighted
  material by Notch and mods should only contain small changes to some classes, never complete sets that
  can be used by people who did not buy the game to play it.

* Make sure that the bin folder of the JDK is in the PATH environment variable, this is necessary for the
  recompile scripts to work properly.

* Make sure you use the original minecraft.jar and minecraft_server.jar files. If you have already modded them
  they will NOT work with the patches in these scripts.

* The "test_game.bat" file uses the "Start.class" file to start the game. This will make sure the game will not
  use your "%APPDATA%\.minecraft" folder, but instead use the "jars" folder for all saves. So any bugs in the modified
  game will not corrupt your normal worlds.

* The class "fb" will be compiled with only one function in it. The original class is renamed to MathHelper, but
  the soundsystem need a class called eo with the function b in it to work properly.

* If you have any problems using this toolpack, put the "logs\*.log" files that the scripts generated into a
  zip-file and send it to me (post it in the minecraft forum):
  http://www.minecraftforum.net/viewtopic.php?f=25&t=58464
  
* This version of the mod creator package uses a deobfuscator to change all field and method names in the sources.
  Look in the "conf\minecraft.rgs" and "conf\minecraft_server.rgs" files for a complete mapping of the names. These
  can be changed, but the resulting "*.class" files after recompile will not be compatible with the patches of this
  package anymore.

* All fields and methods have unique names now, so if you reference field "field_1234" in any posts in the forum I will
  know exactly which field in the whole sourcecode you're talking about. This could also be useful for further analysis
  of the code, because everybody using this package will also be able to locate the field or method easily.

* In version 1.5 the naming convention for the de-obfuscator has changed. All renamed field will contain the original
  name in the new, unique name. So a field "f" will become "field_1234_f" and a method "int c(double)" will become
  "int func_4321_c(double)". This will make it easier to understand how the original names were before de-obfuscation.

* There are currently no known bugs in the recompiled game or server, except those that were already in the original
  game :) The known bugs, like missing sound effects or the backspace bug in the text entry gui, are fixed with this
  release.

* Remeber that the compiled "*.class" files of this package are NOT compatible with an original minecraft.jar file. So
  you can't easily create mods with this for other users at the moment. We will take care of this in a later version.


Credits:
========
Searge       - Creator of MCP and the one who fixes all compile errors in the decompiled sourcecode.
ProfMobius   - Creator of the renaming scripts and helped for re-obfuscation RGS generation and
               procedures. Ported the scripts to Linux.
IngisKahn    - Creator of the bytecode compare tool that helps us to update the mappings quickly after
               new minecraft versions are released and worked on the de-obfuscation spreadsheet.
Generic      - Works on improving IngisKahn's bytecode compare tool and added some important features for
               us to retroguard.
fotoply      - Helped to improve the batch files.
Cadde        - Works on the de-obfuscation spreadsheet.
Vaprtek      - Works on the de-obfuscation spreadsheet. Also knows how to make pet creepers.
gronk        - Script support.
n00bish      - Linux script maintenance.
Sage Pourpre - His thread in the forums inspired me to create this toolpack in the first place.
Tei          - Supported the MCP project since the first version was released.
and of course:
- Everybody who contributed to the great google spreadsheet or who created some mods (I've got them all :).
- NOTCH for creating a game that is just awesome, I hope he does not feel offended by our decompiling efforts.
        Please, Notch, support our ambitions to mod your game. I know people who bought it just because of
        some great mods.

History:
========
2.0 - Major updates to MCP and support for post-Halloween versions of Minecraft
1.6 - All classes have meaningful names now, the class name mappings and the field name mappings are applied
1.5 - Extend the scripts to also support decompiling, recompiling and testing the minecraft_server.jar file
1.4 - Using a deobfuscator to rename all fields and methods and jadretro to fix some decompile bugs
1.3 - Added upgrade scripts to decompile and recompile Minecraft.class, MinecraftApplet.class and MinecraftServer.class
1.2 - Redirect output of all tools to a logfile
1.1 - Fixed TNT bug
1.0 - First release

Roadmap:
========
2.1  - Add the other cool new features that were left out in release 2.0 but are almost ready to use. These include
       Linux support, (hopefully) OSX support, re-obfuscation to make mods compatible with the original jar files,
       updates to all name mappings in the de-obfuscation tables and much more
2.2+ - New awesome features, improvements and updates :)

_________________________________________________________________________________________________________________
_________________________________________________________________________________________________________________
________,.--:=r=.._______________________________________________________________________________,,...___________
_ -:'`      :^)-.!..[``P:  ___________________________________________________________  ,.=~r?`[:_i=.    `'~-._ _
_ .         :=)~.|:.|  [j  ___________________________________________________________  l|  [3 .:,[:.         ! _
_   :       :.[ .|:.(  [| ______________________________________________________________[|=^): [_ | .         ! _
__          :~)=.i..j  []  ___________________________________________________________  )|:')  [ _|;.         ! _
_ .         :.)..i._|;.)|  ___________________________________________________________  [!:=[` |: | .         ! _
_ )   _     :.[ .!  | .[|  ___________________________________________________________  )j:^[` (: | .         ! _
_   :_      <=l:.____ . |  ___________________________________________________________  [!:``   :.|:.       . ! _
_ ._ _ __ __:..;.|,.) .[j  ___________________________________________________________  [!3`T``l:.  .      `  ! _
____ [,...-+=c=f7l`!-( _____.~~~~~~~~._____=~~~~~~~/_____,>====~<.y=.__y~~~~~~~~~~=~.._ ```[j)=[=[.;,,_   _|'`` _
____ [ -~= ( '=r::::~( _____!<.      L____F      .=._ ,c   ;>~~<.   [_ F<.   .>~~<.   ".__ (.......!.( ..  | ____
____ [`) [ !   !^) !') ______ [ JL   (___F Z.   ( ___/   ./ ____ ". J___ L   ? ___J.   J _ |-l ,.(   !-| )-| ____
____ ) !`    (  ```[ ( _____ :. [[   J__F /]   .L___F   .F _______"L L__J    [____/    / _ | )~~~~ r-  !~! | ____
____ [ . . [_) (___|_( _____ | :L!   J.F / L   J __[    | _________   _ [   =+~~=l   ;/ __ |'[^^^( [ :'. ::( ____
____ [..     (.;.i.) ( ______L ? :.   * / J.   [__ L    L______________:L   ;...=+=^` ____ (`["[ l [`` ! ! | ____
____ )..   ....  !.. ( _____J. L_ L    / _[   :L__ [    [_________,.__ |   .L_____________ (   .       !   | ____
____ )..   --. --..!-( _____[ :.__|   / _.L   J ___"c   ?.______,/.;F _L   J._____________ [_[___  __     _| ____
____ )~)~r  -)~r - ( ( __:tT   ":LJ  / r^`     ")___ \.   7*==^`.;* r^`     "tL___________ ! (   ,,[   ._].|_____
___ _z;! : = ( ( : !=( __'^^^^^^"  ^^  *^^^^^^^^`____   "*~~~~^`  __"^^^^^^^^" ___________ ;.)   ( ( ..!.!.| ____
____F"*:P*si_(^^======.____________________________________________________________________j.....[.( !,.ztSP\ ___
_ _!      7*.)      L L___________________________________________________________________: J      :?x>'`    l___
__[ ;~.! ; :=l .-<--~~[___________________________________________________________________|,J  .__ !. :.  _,_ . _
 I :`~.  `\[ (.J-=    [___________________________________________________________________|    ._L_)~\./  ..==`. 
-.;`'=._ .L!;)-+--=-=-l___________________________________________________________________|___;__[_;=[\    ,>=`  
_   =-: `` _ --:...-...___________________________________________________________________  :_:  ._[   \=^  .-!  
_  ` -  L______-.-  ..-___________________________________________________________________: !    ._____ -' _ -' _
_____    _________________________________________________________________________________        ______ '  _____


    d8b   db  .d88b.  db   d8b   db   d888888b d888888b   d888888b .d8888. 
    888o  88 .8P  Y8. 88   I8I   88     `88'   `~~88~~'     `88'   88'  YP 
    88V8o 88 88    88 88   I8I   88      88       88         88    `8bo.   
    88 V8o88 88    88 Y8   I8I   88      88       88         88      `Y8b. 
    88  V888 `8b  d8' `8b d8'8b d8'     .88.      88        .88.   db   8D 
    VP   V8P  `Y88P'   `8b8' `8d8'    Y888888P    YP      Y888888P `8888Y' 
                                                                           
                                                                           
  db    db  .d88b.  db    db d8888b.  .o88b. d8888b.  .d8b.  d88888b d888888b 
  `8b  d8' .8P  Y8. 88    88 88  `8D d8P  Y8 88  `8D d8' `8b 88'     `~~88~~' 
   `8bd8'  88    88 88    88 88oobY' 8P      88oobY' 88ooo88 88ooo      88    
     88    88    88 88    88 88`8b   8b      88`8b   88~~~88 88~~~      88    
     88    `8b  d8' 88b  d88 88 `88. Y8b  d8 88 `88. 88   88 88         88    
     YP     `Y88P'  ~Y8888P' 88   YD  `Y88P' 88   YD YP   YP YP         YP 

======================================================================================================================
