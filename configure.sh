#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt-get install libgl1-mesa-dev libglu1-mesa-dev libxrandr-dev libudev-dev libjpeg8-dev libfreetype6-dev libopenal-dev libsndfile1-dev
# if missing, add this between libglu1-mesa-dev and libxrandr-dev
# libglew-dev

PREVIOUS_PWD=`pwd`
EXT_LIB_DIR=`pwd`/ext/lib/

for i in ext/src/* ; do
  cd $i
  cmake .
  make -j6
  cp lib/* $EXT_LIB_DIR
  cd $PREVIOUS_PWD
done

cmake .
make -j6