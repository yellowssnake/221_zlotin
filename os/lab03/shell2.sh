#!/bin/sh

sum() {
    local sum=0
    for num in $1
    do
        if ! expr "$num" : '^[0-9]\+$' > /dev/null; then
                    sum=0
                    break
                fi
        sum=$((sum + num))
    done
    echo $sum
}

read -p "" line1
read -p "" line2

sum1=$(sum "$line1")
sum2=$(sum "$line2")

if [ $sum1 -eq $sum2 ]; then
    echo "Equal"
else
    echo "Not equal"
fi