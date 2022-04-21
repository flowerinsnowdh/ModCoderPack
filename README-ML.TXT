Modloader 1.3_01v3 support in MCP 2.9a
======================================

Read this instructions before you start creating your modloader mods. And after reading this
instructions, read them again. Repeat until you've really _read_ these instruction. Now you
can ask questions in our IRC channels if there are any problems.

How to use the modloader support in MCP to create mods:
-------------------------------------------------------
- Do NOT include modloader in the jar files you want to decompile, use clean, unmodded jars instead
- after using decompile.bat you need to execute enable_modloader.bat once
- The sources are now patched to include the modloader API
- Create your mods as usual
- Reobfuscate the classes of your mod, do NOT include the modloader class files
- Now take the release of modloader from Risugami and use those class files with your mod
- You can test your mod in MCP with test_modloader.bat instead of test_game.bat


Thanks again to Risugami for giving us the sourcecode of modloader as referencce and the permission
to add some files from his system in MCP.
