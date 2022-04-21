#!/bin/bash

source setup.sh

javac -help >/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
  echo "Unable to locate javac."
  exit 1
fi

mkdir $MCBIN 2>/dev/null
mkdir $MCSBIN 2>/dev/null

bail() {
  echo "Compilation failed:"
  grep -v '^\[' "$MCPCOMPLOG"
  exit 1
}

echo "=== Minecraft Coder Pack $MCPVERSION ===" > $MCPCOMPLOG

if [ "$2" != "server" ]; then
  echo "Compiling Minecraft"
  echo "*** Compiling Minecraft" >> $MCPCOMPLOG
  javac -g -verbose -classpath $MCCP -sourcepath $MCJADOUT -d $MCBIN $MCSRC1/*.java $MCSRC2/*.java $MCSTART 2>> $MCPCOMPLOG || bail

  echo "Compiling Minecraft Start class"
  echo "*** Compiling Minecraft starter" >> $MCPCOMPLOG
  javac -g -verbose -sourcepath $MCJADOUT -d $MCBIN $MCSNDFIX 2>> $MCPCOMPLOG || bail
fi

if [ "$2" != "client" ]; then
  echo "Compiling Minecraft Server"
  echo "*** Compiling Minecraft Server" >> $MCPCOMPLOG
  javac -g -verbose -sourcepath $MCSJADOUT -d $MCSBIN $MCSSRC1/*.java $MCSSRC2/*.java 2>> $MCPCOMPLOG || bail
fi

echo "=== MCP $MCPVERSION recompile script finished ==="

