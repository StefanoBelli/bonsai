#!/bin/bash

BONSAI_DIR="/usr/bonsai"
BUILD_DIR="/var/tmp"
SRC_DIR="/usr/src"
SRC_FILE=""
SRC_URL=""

_echoc ()
{
  echo -e "\E["$1"m$2\E[0m";
}

info ()
{
  _echoc 33 "$@"
}

msg ()
{
  _echoc 31 "$@"
}

setup ()
{
   #if [ "$SRC_FILE" == "" ];then
   SRC_FILE="$SRC_DIR/$PN-$VERSION"
   #fi

   info "\nsetup $PN-$VERSION...\n"
}

prepare ()
{
   fetch_pkg
   prepare_src
}

fetch_pkg ()
{
  if [ ! -f $SRC_FILE.* ];then
    info "fetching package..."
    wget -P $SRC_DIR $SRC_URL
  fi
}

prepare_src ()
{
  info "unpacking src..."

  if [ -e $BUILD_DIR/$PN-src ]; then
    info "cleaning src directory"
    rm -rf $BUILD_DIR/$PN-src
  fi
  mkdir -pv $BUILD_DIR/$PN-src
  cd $BUILD_DIR/$PN-src

  tar -xf $SRC_FILE.* --strip 1
}

prepare_src_ext_build ()
{
  mkdir -pv ../$PN-build
  cd ../$PN-build
}

configure ()
{
   :
}

build ()
{
   :
}

check ()
{
   info "sorry, no tests available"
}

merge ()
{
   :
}

extra ()
{
   :
}

clean ()
{
  info "cleaning build directories..."
  rm -rf $BUILD_DIR/$PN-{src,build}
  cd -
}

export BONSAI_DIR SRC_URL SRC_DIR SRC_FILE BUILD_DIR
export -f info setup prepare fetch_pkg prepare_src prepare_src_ext_build configure build check merge extra clean
