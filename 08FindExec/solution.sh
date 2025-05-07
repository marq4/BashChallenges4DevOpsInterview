#! /usr/bin/bash -

# Make sure no space after \:
for logfile in $(find . \
	-type f \
  -regex '.?*log.?[0-9]+?' \
	-size -300c \
	-user log)
do
	#echo "LOGFILE=>$logfile<" #TMP
	proc=1
	while read line
	do
		#echo "LINE=>$line<" #TMP
		#line=$(echo $line | xargs) # Not needed. 
		#echo "CLEAN=>$line<" #TMP
		if [[ -z $line ]]
		then
			continue
		fi
		if [[ "X$line" != "XSUC" ]]
		then
			proc=0
			break
		fi
	done < $logfile
	if [[ "$proc" -eq 1 ]]
	then
		echo "DELETE FILE: $logfile. " #TMP
		rm $logfile
	fi
done

