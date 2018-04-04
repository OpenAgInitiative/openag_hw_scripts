#!/bin/bash

((counter=1))
((n=0x80))
while [ $counter -le 64 ]
do
y="$(i2cget -y 2 0x69 $n)"
y="$(printf "%d" $y)"
((y=y/4))
((z=y+z))
((x++))
echo "$y," >> data.txt
((n=n+2))
((counter++))
done 

((z=z/x))
echo "Average $z," >> data.txt
echo "next" >> data.txt

echo done





