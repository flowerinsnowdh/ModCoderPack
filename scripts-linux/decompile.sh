#!/bin/bash

source setup.sh

echo "=== Minecraft Coder Pack $MCPVERSION ===" > $MCPLOG

echo "MCP $MCPVERSION running in $MCPDIR"

if [ -e "$MCJAR" ]
then
  echo "*** minecraft.jar was found, processing" >> $MCPLOG

  echo "Deobfuscating minecraft.jar"
  echo "*** Deobfuscating $MCJAR" >> $MCPLOG
  $MCPRG $MCJAR $MCRGJAR $MCRGSCRIPT $MCRGLOG >> $MCPLOG

  echo "Unpacking minecraft.jar"
  echo "*** Unpacking $MCJAR" >> $MCPLOG
  $MCPUNZIP -o $MCRGJAR -d $MCTEMP >> $MCPLOG
  rm -rf $MCTEMP"\META-INF\MOJANG_C.*"

  echo "Fixing minecraft classes"
  echo "*** Fixing minecraft classes" >> $MCPLOG
  wine $MCPJR $MCTEMP >> $MCPLOG 2>/dev/null

  echo "Decompiling minecraft classes"
  echo "*** Decompiling minecraft classes" >> $MCPLOG
  wine $MCPJAD -b -d $MCJADOUT -dead -o -r -s .java -stat -v $MCTEMP/*.class 2>>$MCPLOG
  wine $MCPJAD -b -d $MCJADOUT -dead -o -r -s .java -stat -v $MCTEMP/net/minecraft/client/*.class 2>> $MCPLOG
  echo "Repackage minecraft sources"
  echo "*** Repackage minecraft sources" >> $MCPLOG

  #mono $MCPREPACK $MCJADOUT $MCPACKAGE >> $MCPLOG
  $MCPREPACK $MCJADOUT $MCSRC2 >> $MCPLOG

  echo "Patching minecraft sources"
  echo "*** Patching minecraft sources" >> $MCPLOG
  
  sed "/^--- \\|^+++ / s#\\\\#/#g" "$MCPATCH" | patch --binary  -p 1 -u -d "$MCJADOUT" >>"$MCPLOG"
else
  echo "Minecraft.jar was not found."
  echo "Minecraft.jar was not found" >> $MCPLOG
fi

if [ -e "$MCSJAR" ]
then
  echo "*** minecraft_server.jar was found, processing" >> $MCPLOG
  echo "Deobfuscating minecraft_server.jar"
  echo "*** Deobfuscating $MCSJAR" >> $MCPLOG
  $MCPRG $MCSJAR $MCSRGJAR $MCSRGSCRIPT $MCSRGLOG >> $MCPLOG

  echo "Unpacking minecraft_server.jar"
  echo "*** Unpacking $MCSJAR" >> $MCPLOG
  $MCPUNZIP -o $MCSRGJAR -d $MCSTEMP >> $MCPLOG

  echo "Fixing minecraft server classes"
  echo "*** Fixing minecraft server classes" >> $MCPLOG
  wine $MCPJR $MCSTEMP >> $MCPLOG 2>/dev/null

  echo "Decompiling minecraft server classes"
  echo "*** Decompiling minecraft server classes" >> $MCPLOG
  wine $MCPJAD -b -d $MCSJADOUT -dead -o -r -s .java -stat -v $MCSTEMP/*.class 2>>$MCPLOG
  wine $MCPJAD -b -d $MCSJADOUT -dead -o -r -s .java -stat -v $MCSTEMP/net/minecraft/server/*.class 2>> $MCPLOG

  echo "Repackage minecraft server sources"
  echo "*** Repackage minecraft server sources" >> $MCPLOG

  #mono $MCPREPACK $MCSJADOUT $MCSPACKAGE >> $MCPLOG
  $MCPREPACK $MCSJADOUT $MCSSRC2 >> $MCPLOG

  echo "Patching minecraft server sources"
  echo "*** Patching minecraft server sources" >> $MCPLOG
  
  sed "/^--- \\|^+++ / s#\\\\#/#g" "$MCSPATCH" | patch --binary  -p 1 -u   -d "$MCSJADOUT" >>"$MCPLOG"

else
  echo "Minecraft_server.jar was not found."
  echo "Minecraft_server.jar was not found" >> $MCPLOG
fi

if [ -e $MCPSPLASHES ]
then
  cp  $MCPSPLASHES $MCSPLASHES
fi

echo "Renaming methods and fields"
echo "*** Renaming methods and fields" >> $MCPLOG
python $MCPRENAMER -R -c $MCPCONFDIR/renamer.conf >> $MCPLOG 2>/dev/null

echo === MCP $MCPVERSION decompile script finished ===

