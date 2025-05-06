#! /usr/bin/bash -

if [[ $# -ne 2 ]]
then
  echo "This script expects 2 args: file, N. "
  exit 1
fi

file=$1
line=$2

sed --silent "${line}p" $file

