#!/bin/bash

#i2cset -y 2 0x4c $((0x30)) $i 0x00 i

# Turn all lights off
for i in 0 1 2 3 4 5 6 7
do
    i2cset -y 2 0x4c $((0x30+$i)) 0xff 0x00 i
done

# Loop forever
while [ 1 ]; do
    for j in 0 2 4 5 6 7
    do
        # Fade the lights up
        i=255
        while [ $i -ge 0 ]; do
            echo $j, $i
            i2cset -y 2 0x4c $((0x30+$j)) $i 0x00 i
            let i=i-5
            sleep 0.01
        done

        # Fade the lights down
        i=0
        while [ $i -le 255 ]; do
            echo $j, $i
            i2cset -y 2 0x4c $((0x30+$j)) $i 0x00 i
            let i=i+5
            sleep 0.01
        done
    done
done
