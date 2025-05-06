#! /usr/bin/bash -

if [[ $# -ne 1 ]]
then
  echo "This script expects 1 arg: /path/to/file "
  exit 1
fi

file=$1
outputfile='extracted_ips.txt'

# Extract HEX IPs:
grep -Eow \([0-9A-Fa-f]{8}\) ${file} > ${outputfile}


# Extract decimal IPs:
grep -Eo \([0-9]{1\,3}[.][0-9]{1\,3}[.][0-9]{1\,3}[.][0-9]{1\,3}\) ${file} >> ${outputfile}

