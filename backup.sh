#!/usr/bin/env bash

# Backup provision script, written by Som
set -e
set -u

_author="Som / somsubhra1 [at] xshellz.com"
_package="Backup"
_version="1.0"

echo "Running provision for package $_package version: $_version by $_author"

TIME=`date +%b-%d-%y`
DIR="backup"
FILENAME=$SRCDIR-$TIME.tar.gz

if [ -z $SRCDIR ]
then
    FILENAME=home-$TIME.tar.gz
    SRCDIR=$HOME
fi

cd ~

if [ $SRCDIR != $HOME ] && [ ! -d $SRCDIR ]
then
    echo "$SRCDIR not present at $HOME. Stopping process"
    exit
fi


if [ ! -d $DIR ] 
then
    mkdir backup
fi

DESDIR=$HOME/$DIR

cd $DESDIR

if [ -f $FILENAME ]
then
    rm $FILENAME
fi

cd ~

tar -cpzf $DESDIR/$FILENAME $SRCDIR
echo "Backed up Successfully at $HOME/$DIR/$FILENAME"