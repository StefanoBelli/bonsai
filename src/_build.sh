#!/bin/bash

opfault()
{
TYPE=$1
case $TYPE in

  fetch)
    msg "* Fetch phase failed!! Aborting..." && exit 1
  ;;

  prepare)
    msg "* Prepare phase failed! Aborting..." && exit 2
  ;;

  configure)
    msg "* Configure phase failed! Aborting..." && exit 3
  ;;

  build)
    msg "* Build/Compile phase failed! Aborting..." && exit 4
  ;;

  mergepkg)
    msg "* Merge/Install phase failed! Aborting..." && exit 5
  ;;
esac
}

setup ()
{
   #if [ "$SRC_FILE" == "" ];then
   SRC_FILE="$SRC_DIR/$PN-$VERSION"
   #fi

   info "\n* Setup:  $PN-$VERSION...\n"
}

prepare ()
{
   fetch_pkg && prepare_src || opfault "fetch"
}

fetch_pkg ()
{
  if [[ ! -f $SRC_FILE.*.* ]]; then
    rm $SRC_FILE.*.*
  fi

  if [[ ! -f $SRC_FILE.* ]]; then
    info "* Trying to fetch $SRC_FILE"
    wget -P $SRC_DIR $SRC_URL
  fi
}

prepare_src ()
{
  info "* Unpacking sources..."

  if [ -e $BUILD_DIR/$PN-src ]; then
    info "* Cleaning sources directory"
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
  #TODO maybe $EXTRA_CONF
  if [ -f configure.ac ]; then
    ./configure --prefix=/usr
  fi
}

build ()
{
  make
}

check ()
{
  info "* Sorry, no tests available"
}

merge ()
{
  make install
}

extra ()
{
   :
}

clean ()
{
  info "* Cleaning build tmp directories..."
  rm -rf $BUILD_DIR/$PN-{src,build}
  cd -
}

mem_installed()
{
  if [[ -f $INSTALLED_DIR/$PN ]];
  then
    info "* This package was already installed..."
    echo -ne ".\r"
    sleep 1
    echo -ne "..\r"
    sleep 1
    echo -ne "...\r"
    sleep 1
    info "* Skipping phase..."
  else
    info "* Updating installed packages directory..."
    echo "VERSION=\"$VERSION\"" > $INSTALLED_DIR/$PN || info "* Error while creating pkgfile"
  fi
}

export BONSAI_DIR SRC_URL SRC_DIR SRC_FILE BUILD_DIR
export -f info setup prepare fetch_pkg prepare_src prepare_src_ext_build configure build check merge extra clean
