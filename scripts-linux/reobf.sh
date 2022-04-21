#!/bin/bash

source setup.sh

rm -rf $MCREOBDIR 2>/dev/null
rm -rf $MCSREOBDIR 2>/dev/null

mkdir $MCREOBDIR
mkdir $MCREOBDIR/net
mkdir $MCREOBDIR/net/minecraft
mkdir $MCREOBDIR/net/minecraft/client
mkdir $MCREOBDIR/net/minecraft/isom

mkdir $MCSREOBDIR
mkdir $MCSREOBDIR/net
mkdir $MCSREOBDIR/net/minecraft
mkdir $MCSREOBDIR/net/minecraft/server

if [ ! -d $MCPTEMPDIR ]
then
  mkdir $MCPTEMPDIR
fi

if [ ! -d $MCPSOURCESDIR ]
then
  mkdir $MCPSOURCESDIR
fi

if [ ! -d $MCPLOGDIR ]
then
  mkdir $MCPLOGDIR
fi

echo "=== Minecraft Coder Pack $MCPVERSION ===" > $MCPREOBLOG

echo "MCP $MCPVERSION running in $MCPDIR"
  echo "+ Obfuscating client:"
  echo "+ Obfuscating client." >> $MCPREOBLOG
  cat "$MCPCONFDIR/client_obfuscation.txt"
  python $MCPOBFUSC -c $MCPCONFDIR/client_obfuscation.txt -d $MCREOBSCRIPT -i $MCBIN -o $MCREOBDIR >> $MCPREOBLOG 2>&1
  if [ $? -eq 1 ]
  then
    echo "## CLIENT OBFUSCATION FAILED ##"
    echo "See $MCPREOBLOG for detailed information!"
    exit 1
  fi 

  echo "+ Obfuscating server:"
  echo "+ Obfuscating server." >> $MCPREOBLOG
  cat $MCPCONFDIR/server_obfuscation.txt
  python $MCPOBFUSC -c $MCPCONFDIR/server_obfuscation.txt -d $MCSREOBSCRIPT -i $MCSBIN -o $MCSREOBDIR >> $MCPREOBLOG 2>&1
  if [ $? -eq 1 ]
  then
    echo "## SERVER OBFUSCATION FAILED ##"
    echo "See $MCPREOBLOG for detailed information!"
    exit 1
  fi 

echo "=== MCP $MCPVERSION reobfuscation script finished ==="
