#!/bin/bash
usage() {
  echo "usage:"
  echo "srcfetch [-l] dir"
  echo
  echo "-l    equivalent to ls /mnt"
}

if [ $# -eq 0 ]; then
  usage
  exit
fi

if [ "$1" == "-l" ]; then
  ls /mnt
  exit
fi

rsync -r /mnt/$1 $HOME

