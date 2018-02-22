#!/bin/bash

# Trigger humidity measurement (no hold master)
i2cset -y 2 0x40 0xf5

# Get raw bytes
msb=`i2cget -y 2 0x40`
lsb=`i2cget -y 2 0x40`
# echo $msb, $lsb

# Convert msb & lsb to decimal
msb=$(($msb&0xff))
lsb=$(($lsb&0xff))
# echo $msb, $lsb

humidity=`echo "((($msb*256.0+$lsb)*125.0)/65536.0) - 6" | bc`
echo $humidity %RH
