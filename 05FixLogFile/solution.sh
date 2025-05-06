# Add "ip-" text to HEX IPs: 
sed -Ei 's/^([^ ]+[ ]+)([^ ]+[ ]+)\[([^ ]+)\]/\1\2[ip-\3]/' logfile.txt

