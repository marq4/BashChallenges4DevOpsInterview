#! /usr/bin/bash -

# Read last N lines from file. Both N and filename optional.

#set -x

filename="C:\Marq\Documents_C\Self.txt"
numlines=10

function main {
  if [[ $# -ge 1 ]]
  then
    if [[ $# -ge 2 ]]
    then
      numlines=$2
    fi
    filename=$1
  fi
  tail -${numlines} ${filename} | nl
}

main "$@"

