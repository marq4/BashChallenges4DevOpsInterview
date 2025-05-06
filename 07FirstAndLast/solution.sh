#! /usr/bin/bash -

function get_top_nonempty_line {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  file=$1
  while read line
  do
    line=$(echo $line | xargs)
    if [[ -z $line ]]
    then
      continue
    else
      echo $line
      return
    fi
  done < $file
}

function get_first_line {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  get_top_nonempty_line $1
}

function get_last_line {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  reversed="TMP_$1.tmp"
  tac $1 > $reversed
  get_top_nonempty_line $reversed
  rm $reversed
}

function filename_missing {
  echo "Filename missing. "
  exit 2
}

function get_bottom_line_number {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  file=$1
  reversed="TMP_${file}.tmp"
  tac $file > $reversed
  offset=0
  while read line
  do
    line=$(echo $line | xargs)
    if [[ -z $line ]]
    then
      offset=$((offset + 1))
      continue
    else
      break
    fi
  done < $reversed
  total_lines=$(wc -l $file | cut -d' ' -f 1)
  linenumber=$((total_lines - offset))
  rm $reversed
  echo $linenumber
}

function get_top_line_number {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  file=$1
  linenumber=0
  while read line
  do
    line=$(echo $line | xargs)
    linenumber=$((linenumber + 1))
    if [[ -z $line ]]
    then
      continue
    else
      break
    fi
  done < $file
  echo $linenumber
}

function display_first_and_last_lines {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  file=$1
  first_line_number=$(get_top_line_number $file)
  last_line_number=$(get_bottom_line_number $file)
  first=$(get_first_line $file)
  last=$(get_last_line $file)
  #echo "FIRST=>$first<"#TMP
  #echo "LAST=>$last<"#TMP
  if [[ $first != $last ]]
  then
    echo $first_line_number $first
    echo $last_line_number $last
  fi
}

function verify_file_exists {
  if [[ $# -ne 1 ]]
  then
    filename_missing
  fi
  file=$1
  if ! [[ -f "$file" ]]
  then
    echo "Could not find that file. "
    exit 3
  fi
}

function main {
  if [[ $# -ne 1 ]]
  then
    echo "This script expects 1 argument: /path/to/file. "
    exit 1
  fi
  path=$1
  verify_file_exists $path
  display_first_and_last_lines $path
}

main "$@"

