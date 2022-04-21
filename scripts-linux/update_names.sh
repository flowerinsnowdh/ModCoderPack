#!/bin/bash

source setup.sh

python $MCPGETCSV -d $MCPCONFDIR 2>test.log

if [ $? -ne 0 ]
then
  echo "- Connection timed out, please try again later."
  exit 1;
fi

python $MCPRENAMER -R --skipopengl -c $MCPCONFDIR/renamer.conf

