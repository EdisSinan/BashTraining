#!/bin/bash

argc=$#
if [[ $argc -lt 2 ]]; then
  echo "You provided to few arguments"
  echo -e "You need exactly 2 arguments to run this script: \n 1. Path to the fix.log \n 2. The parent order ID"
  echo "Example call: "
  echo "skripta.sh /home/user/file.log TWAQD2kmA0S3TCyUcvUuoIoBKA**" 
  exit 42
elif [[ $argc -gt 2 ]]; then
  echo "You provided too many arguments"
  echo -e "You need exactly 2 arguments to run this script: \n 1. Path to the fix.log \n 2. The parent order ID"
  echo "Example call: "
  echo "skripta.sh /home/user/file.log TWAQD2kmA0S3TCyUcvUuoIoBKA**" 
  exit 43
fi
file=$1
parentId=$2
if [ ! -e "$file" ] ; then
  echo "The file you trying to provide does not exist."
  exit 44
elif [[ "$file" != *.log ]]; then
  echo "The file you need to provide should only and only be a .log file"
  exit 45
elif [ ! -s "$file" ]; then 
  echo "The log file you provided is empty."
  exit 46
fi
tag37=();
counter=1;
tag11=($(sed 's/\x01/|/g' "$file" | grep "583=$parentId" | awk -F'|' '{
  for (i=1; i<=NF; i++) {
    if ($i ~ /^11=/) {
      split($i, a, "=");
      print a[2];
    }
  }
}'|uniq ))
for el in "${tag11[@]}"; do
 tag37+=($(sed 's/\x01/|/g' "$file" | grep "11=$el" | awk -F'|' '{
  for (i=1; i<=NF; i++){
    if ($i ~ /^37=/){
      split($i, a, "=");
      print a[2];}
    }
  }' | uniq))
done
declare -A unique_tags
unique_tag37=()
for el in "${tag37[@]}"; do
  if [ ! -v unique_tags["$el"] ]; then
    unique_tag37+=("$el")
    unique_tags["$el"]=1
  fi
done
echo "Parent order $parentId" > output.log
for el in "${unique_tag37[@]}"; do
  firstline=$(sed 's/\x01/|/g' "$file" | grep "$el" | head -n 1)
  firsts11=$(echo "$firstline" | awk -F'|' '{
  	for (i=1; i<=NF; i++) {
  	  if ($i ~ /^11=/) {
  	    split($i, a, "=");
 	      print a[2];
      }
    }
  }')
  line=$(sed 's/\x01/|/g' "$file" | grep "$el" | tail -n 1)
  last11=$(echo "$line" | awk -F'|' '{
 	  for (i=1; i<=NF; i++) {
      if ($i ~ /^11=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }')
  last41=$(sed 's/\x01/|/g' "$file" | grep "41=$last11" | tail -n 1 | awk -F'|' '{
   	for (i=1; i<=NF; i++) {
      if ($i ~ /^41=/) {
        split($i, a, "=");
        print a[2];
      }
   	}
  }')
  if [ "$last11" == "$last41" ]; then
    line=$(sed 's/\x01/|/g' "$file" | grep "41=$last11" | tail -n 1)
  fi
  last35=$(sed 's/\x01/|/g' "$file" | grep "41=$last11" | tail -n 1 | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^35=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }' )
  first11=$(echo "$firstline" | awk -F'|' '{
  	for (i=1; i<=NF; i++) {
 	    if ($i ~ /^11=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }')
  tag39=$(echo "$line" | awk -F'|' '{
  	for (i=1; i<=NF; i++) {
      if ($i ~ /^39=/) {
        split($i, a, "=");
        tag39=a[2];
        if(tag39==2)
       	print "Fully filled";
       	else if(tag39==0) 
       	print "New";
       	else if(tag39==1)
       	print "Partialy filled"
       	else if(tag39==4) 
       	print "cancled";
       	else if(tag39==C) 
       	print "Expired";
       	else if(tag39==8) 
       	print "Rejected";
       	else if(tag39==6)
       	print "Pending cancle";
       	else
       	print "pending";
      }
    }
  }')
  tag35=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^35=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }')
  tag38=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^38=/) {
        split($i, a, "=");
        split(a[2], b, ".");
        print b[1];
      }
    }
  }')
  tag151=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^151=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }')
  tag14=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^14=/) {
        split($i, a, "=");
        split(a[2], b, ".");
        print b[1];
      }
    }
  }')
  tag41=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^41=/) {
        split($i, a, "=");
        print a[1];
      }
    }
  }')
  tag58=$(echo "$line" | awk -F'|' '{
    for (i=1; i<=NF; i++) {
      if ($i ~ /^58=/) {
        split($i, a, "=");
        print a[2];
      }
    }
  }')
  firsttimestamp=$(sed 's/\x01/|/g' "$file" | grep "$firsts11" | head -n 1 | awk '{
        date = $1;
        split(date, a, "-");
        print a[2];
  }') 
  secondTime=$(echo "$line" | awk  '{
        date = $1;
        split(date, a, "-");
        print a[2];
      }') 
  firstTime=$(echo "$firsttimestamp" | sed 's/\./:/g' | sed 's/\:[0]*/:/g')
  secondTime=$(echo "$secondTime" | sed 's/\./:/g' | sed 's/\:[0]*/:/g') 
  IFS=":" read -r firstHour firstMinute firstSecond firstNanoseconds <<< "$firstTime"
  IFS=":" read -r secondHour secondMinute secondSecond secondNanoseconds <<< "$secondTime"
  time=$(( (secondHour - firstHour) * 3600*1000000000 + (secondMinute - firstMinute) * 60*1000000000 + (secondSecond - firstSecond) * 1000000000 + (secondNanoseconds - firstNanoseconds)))
  if [ "$tag35" == "8" ]; then
    if [ "$tag39" == "New" ]; then
      echo "$counter. $first11 - $tag39, $tag38 quantity ">>output.log
    elif [ "$tag39" == "cancled" ]; then
      if [ ! -z "$tag41" ]; then
        echo "$counter. $first11 - $tag14 filled, $tag39 by user">>output.log
      else 
        echo "$counter. $first11 - $tag14 filled, unsolicited $tag39">>output.log
      fi
    elif [ "$tag39" == "Fully filled" ]; then
      echo "$counter. $first11 - $tag39 in $time ns">>output.log
    elif [ "$tag39" == "Pending cancle" ]; then
      echo "$counter. $first11 - $tag39 ">>output.log
    elif [ "$tag39" == "Partialy filled" ]; then
      echo "$counter. $first11 - $tag39, $tag14 executed and $tag151 remaining">>output.log
    elif ["$tag39" == "Expired"]; then
      echo "$counter. $first11 - $tag39 $tag14 filled and $tag151 remaining" >> output.log
    elif ["$tag39" == "Rejected"]; then
      echo "$counter. $first11 - $tag39 Reason: \"$tag58\" ">> output.log
    else 
      echo "$counter. $first11 - $tag39 ">>output.log
    fi
  else 
    if [ "$last35" == "F" ]; then
      echo "$counter. $first11 - pending cancel">>output.log
    elif [ "$last35" == "G" ]; then
      echo "$counter. $first11 - pending modify">>output.log
    elif  [ "$last35" == "D" ]; then
      echo "$counter. $first11 - pending New">>output.log
    fi
  fi
  counter=$((counter + 1))
done 
