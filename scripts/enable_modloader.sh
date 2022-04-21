#!/bin/bash

source setup.sh

javac -help >/dev/null 2>/dev/null
if [ $? -ne 0 ]
then
  echo "Unable to locate javac."
  exit 1
fi

if [ -e "$MCJADOUT/net/minecraft/client/Minecraft.java" ]; then
    echo Patching minecraft sources
    echo *** Patching minecraft sources >>"$MCPLOG"
    sed '/^[-+]\{3\} /s/\\/\//g' "$MLPATCH" | patch -p1 -u -d "$MCJADOUT" 2>&1 | tee -a "$MCPLOG" | grep -v "^patching file" | grep -v "Stripping trailing CRs"
elif [ -e "$MCJAR" ]; then
    echo *** Client not decompiled, run decompile.bat
else
    echo *** minecraft.jar was not found, skipping
fi
