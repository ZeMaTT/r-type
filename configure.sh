#!/usr/bin/env bash

SOURCE_DIRECTORY=`pwd`
EXT_LIB_DIR="$SOURCE_DIRECTORY/ext/lib"
EXT_SRC_DIR="$SOURCE_DIRECTORY/ext/src"
NCPUS=6

apt-get install libgl1-mesa-dev libglu1-mesa-dev libxrandr-dev libudev-dev libjpeg8-dev libfreetype6-dev libopenal-dev libsndfile1-dev
# if missing, add this between libglu1-mesa-dev and libxrandr-dev
# libglew-dev

mkdir -p $EXT_SRC_DIR $EXT_LIB_DIR
wget --output-document=/tmp/SFML-2.2-sources.zip  http://www.sfml-dev.org/files/SFML-2.2-sources.zip
unzip /tmp/SFML-2.2-sources.zip -d $EXT_SRC_DIR


for i in $EXT_SRC_DIR/* ; do
  cd $i
  cmake .
  make -j6
  cp lib/* $EXT_LIB_DIR
  cd $SOURCE_DIRECTORY
done

cmake .
make -j$NCPUS