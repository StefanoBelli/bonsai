#!/bin/bash

check_user()
{
  if [ $UID -ne 0 ];then
    info "* Hey, $USER, you cannot use this option unless you are root\n"
    exit 3
  fi
}

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

banner ()
{
  info "Bonsai-$BONSAI_VERSION\n"
}

if_editor ()
{
	:
}

export -f info msg check_user banner if_editor
