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
  wine $MCPJR -b $MCTEMP >> $MCPLOG 2>/dev/null

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
  
  dos2unix $MCSRC1/*.java 2>/dev/null
  dos2unix $MCSRC2/*.java 2>/dev/null
  dos2unix $MCPATCH 2>/dev/null

  sed -i 's:minecraft\\net\\minecraft\\client\\:minecraft/net/minecraft/client/:g' $MCPATCH
  sed -i 's:patched\\net\\minecraft\\client\\:patched/net/minecraft/client/:g' $MCPATCH
  sed -i 's:minecraft\\net\\minecraft\\src\\:minecraft/net/minecraft/src/:g' $MCPATCH
  sed -i 's:patched\\net\\minecraft\\src\\:patched/net/minecraft/src/:g' $MCPATCH
  $MCPPATCH -p1 -u < $MCPATCH -d $MCJADOUT >> $MCPLOG
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
  wine $MCPJR -b $MCSTEMP >> $MCPLOG 2>/dev/null

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
  
  dos2unix $MCSSRC1/*.java 2>/dev/null
  dos2unix $MCSSRC2/*.java 2>/dev/null
  dos2unix $MCSPATCH 2>/dev/null

  sed -i 's:minecraft_server\\net\\minecraft\\server\\:minecraft_server/net/minecraft/server/:g' $MCSPATCH
  sed -i 's:patched\\net\\minecraft\\server\\:patched/net/minecraft/server/:g' $MCSPATCH
  sed -i 's:minecraft_server\\net\\minecraft\\src\\:minecraft_server/net/minecraft/src/:g' $MCSPATCH
  sed -i 's:patched\\net\\minecraft\\src\\:patched/net/minecraft/src/:g' $MCSPATCH
  $MCPPATCH -p1 -u < $MCSPATCH -d $MCSJADOUT >> $MCPLOG

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

