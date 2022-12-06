#!/bin/bash

total=0
# Make sure input file uses LF line endings and ends with a newline
while IFS= read -r line; do # Read file
    interval_pair=(${line//,/ }) # Split line on ',' delimeter
    
    i1=(${interval_pair[0]//-/ }) # Split interval on '-' delimeter
    min1=${i1[0]}
    max1=${i1[1]}

    i2=(${interval_pair[1]//-/ })
    min2=${i2[0]}
    max2=${i2[1]}

    if (($max1 >= $min2)) && (($max1 <= $max2)); then
        total=$(($total+1))
    elif (($max2 >= $min1)) && (($max2 <= $max1)) ; then
        total=$(($total+1))
    fi

done < data.txt

echo $total


