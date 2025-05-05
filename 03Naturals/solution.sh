#! /bin/bash -


function output_numbers {
  target=$1
  for num in $(seq 0 "$target")
  do
    echo $num
  done
}

function check_if_target_valid {
  number=$1
  numregex='^[0-9]+$'
  if ! [[ $number =~ $numregex ]]
  then
    echo "Invalid number: $number"
    exit 1
  fi
}

# naturals_up_to_ + number specified + .txt 
function get_output_file_name {
  echo "naturals_up_to_$1.txt"
}

function main {
  target=100
  if [[ $# -eq 1 ]]
  then
    target=$1
  fi
  check_if_target_valid $target
  output_file=`get_output_file_name $target`
  echo "output_file=>${output_file}<" #TMP
  output_numbers $target &> "$output_file"
}

main "$@"

