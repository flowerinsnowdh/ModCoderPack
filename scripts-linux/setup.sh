#!/bin/bash

MCVERSION="$1"

if [ "$1" != "" ]
then
  echo " *** Processing Minecraft version $1 *** "
  MCVERSIONPATH="/$MCVERSION"
else
  MCVERSIONPATH=""
fi
  
MCPVERSION=2.7

MCPDIR=`pwd`

if [ "${0/decompile}" != "$0" -o  "$MCPDIR" != "${MCPDIR/ }" ]
then
  echo "=== Creating directory symlink in /tmp..."
  TMPFILE=`mktemp /tmp/mcpXXXXX`
  if ! [ -f "$TMPFILE" ]; then
    echo "=== Could not create temporary file!"
    exit 1
  fi

  ln -sf `pwd` $TMPFILE
  if ! [ -h "$TMPFILE" ]; then
    echo "=== Could not create directory symlink!"
    rm -f "$TMPFILE"
    exit 1
  fi

  cd $TMPFILE
  trap "rm -f $TMPFILE" 0
  MCPDIR="$TMPFILE"
fi

MCPTOOLSDIR="$MCPDIR/tools"
MCPLINUXTOOLSDIR="$MCPDIR/tools-linux"
MCPLOGDIR="$MCPDIR/logs$MCVERSIONPATH"
MCPJARSDIR="$MCPDIR/jars$MCVERSIONPATH"
MCPCONFDIR="$MCPDIR/conf$MCVERSIONPATH"
MCPTEMPDIR="$MCPDIR/temp$MCVERSIONPATH"
MCPSOURCESDIR="$MCPDIR/sources$MCVERSIONPATH"
MCPSOURCEBASE=sources$MCVERSIONPATH
MCPPATCHDIR="$MCPDIR/patches$MCVERSIONPATH"
MCPBINDIR="$MCPDIR/bin$MCVERSIONPATH"

MCPLOG="$MCPLOGDIR/minecraft.log"
MCPCOMPLOG="$MCPLOGDIR/minecraft_compile.log"
MCPRG="java -cp "$MCPTOOLSDIR/retroguard.jar" RetroGuard"
MCPUNZIP="unzip"
MCPJR="$MCPTOOLSDIR/jadretro.exe"
MCPJAD="$MCPTOOLSDIR/jad.exe"
MCPPATCH="patch"
MCPRENAMER="$MCPLINUXTOOLSDIR/renamer_v3.py"
#MCPREPACK=$MCPDIR"/repackage.sh"
MCPREPACK="$MCPLINUXTOOLSDIR/repackage.sh"
MCPOBFUSC="$MCPLINUXTOOLSDIR/obfuscathon.py"
MCPGETCSV="$MCPLINUXTOOLSDIR/get_csv.py"

MCJAR="$MCPJARSDIR/bin/minecraft.jar"
MCSJAR="$MCPJARSDIR/minecraft_server.jar"
MCJI="$MCPJARSDIR/bin/jinput.jar"
MCJGL="$MCPJARSDIR/bin/lwjgl.jar"
MCJGLU="$MCPJARSDIR/bin/lwjgl_util.jar"
MCCP="$MCJAR":"$MCJI":"$MCJGL":"$MCJGLU"

MCRGJAR="$MCPTEMPDIR/minecraft_rg.jar"
MCRGSCRIPT="$MCPCONFDIR/minecraft.rgs"
MCRGLOG="$MCPLOGDIR/minecraft_rg.log"

MCSRGJAR="$MCPTEMPDIR/minecraft_server_rg.jar"
MCSRGSCRIPT="$MCPCONFDIR/minecraft_server.rgs"
MCSRGLOG="$MCPLOGDIR/minecraft_server_rg.log"

MCTEMP="$MCPTEMPDIR/minecraft"
MCSTEMP="$MCPTEMPDIR/minecraft_server"

MCJADOUT="$MCPSOURCESDIR/minecraft"
MCSJADOUT="$MCPSOURCESDIR/minecraft_server"

MCPACKAGE="net.minecraft.src"
MCSPACKAGE="net.minecraft.src"

MCPATCH="$MCPPATCHDIR/minecraft.patch"
MCSPATCH="$MCPPATCHDIR/minecraft_server.patch"
MCPSPLASHES="$MCPPATCHDIR/splashes.txt"

MCSTART="$MCPPATCHDIR/Start.java"
MCSNDFIX="$MCPPATCHDIR/gd.java"

MCSRC1="$MCPSOURCEBASE/minecraft/net/minecraft/client"
MCSRC2="$MCPSOURCEBASE/minecraft/net/minecraft/src"
MCBIN="$MCPBINDIR/minecraft"
MCSSRC1="$MCPSOURCEBASE/minecraft_server/net/minecraft/server"
MCSSRC2="$MCPSOURCEBASE/minecraft_server/net/minecraft/src"
MCSBIN="$MCPBINDIR/minecraft_server"

MCSPLASHES="$MCPTEMPDIR/minecraft/title/splashes.txt"

MCTESTCP="$MCBIN":"$MCTEMP":"$MCJI":"$MCJGL":"$MCJGLU"
MCNAT="$MCPJARSDIR/bin/natives"
MCSTESTCP="$MCSBIN":"$MCSTEMP"

MCREOBSCRIPT="$MCPDIR/conf/minecraft_rev.saffx"
MCSREOBSCRIPT="$MCPDIR/conf/minecraft_server_rev.saffx"
MCPREOBDIR="$MCPDIR/final_out"
MCREOBDIR="$MCPREOBDIR/minecraft"
MCSREOBDIR="$MCPREOBDIR/minecraft_server"

MCPREOBJAR="$MCPTEMPDIR/minecraft_preob.jar"
MCSPREOBJAR="$MCPTEMPDIR/minecraft_server_preob.jar"
MCPOSTOBJAR="$MCPTEMPDIR/minecraft_obfuscated.jar"
MCSPOSTOBJAR="$MCPTEMPDIR/minecraft_server_obfuscated.jar"

MCPREOBLOG="$MCPDIR/logs/reobf.log"
MCREOBLOG="$MCPDIR/logs/reobf_minecraft_rg.log"
MCSREOBLOG="$MCPDIR/logs/reobf_minecraft_server_rg.log"

if [ "$1" == --init ] || [ ! -e "$MCPCONFDIR/init" ]
then
  echo "=== Initializing MCP "$MCPVERSION" environment ==="

  echo "+++ Checking scripts"
  chmod -c +x "$MCPDIR"/*.sh
  chmod -c +x "$MCPLINUXTOOLSDIR"/*.sh

  echo "+++ Checking directory structure"
  echo "+ $MCPREOBDIR"
  mkdir "$MCPREOBDIR" 2>/dev/null

  echo "+ $MCPJARSDIR"
  mkdir "$MCPJARSDIR" 2>/dev/null

  echo "+ $MCPLOGDIR"
  mkdir "$MCPLOGDIR" 2>/dev/null

  echo "+ $MCPSOURCESDIR"
  mkdir "$MCPSOURCESDIR" 2>/dev/null

  echo "+ $MCPTEMPDIR"
  mkdir "$MCPTEMPDIR" 2>/dev/null
  touch "$MCPCONFDIR/init"

  echo "=== MCP "$MCPVERSION" initialized. ==="
fi

