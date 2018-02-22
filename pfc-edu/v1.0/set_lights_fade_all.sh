#!/bin/bash

min=80
max=190
delay=0.001
increment=5

# Turn all lights off
for i in 0 2 4 5 6 7
do
    i2cset -y 2 0x4c $((0x30+$i)) 0xff 0x00 i
done

# Loop forever
while [ 1 ]; do
    # Fade the lights up
    i=$max
    while [ $i -ge $min ]; do
        # echo $i
        for j in 0 2 4 5 6 7
        do
            i2cset -y 2 0x4c $((0x30+$j)) $i 0x00 i
        done
        let i=i-$increment
        sleep $delay
    done

    # Fade the lights down
    i=$min
    while [ $i -le $max ]; do
        # echo $i
        for j in 0 2 4 5 6 7
        do
            i2cset -y 2 0x4c $((0x30+$j)) $i 0x00 i
        done
        let i=i+$increment
        sleep $delay
    done
done
