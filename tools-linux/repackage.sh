#!/bin/bash

sed -i 's$// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.$package net.minecraft.src;\n// Decompiled by Jad v1.5.8g. Copyright 2001 Pavel Kouznetsov.$g' $1/*.java

mkdir $2 2>/dev/null
mv -f -v $1/*.java $2 2>/dev/null

