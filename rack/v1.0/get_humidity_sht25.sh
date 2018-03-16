#!/bin/sh

# Trigger humidity measurement (no hold master)
i2cset -y 2 0x40 0xf5

# Wait for sensor to process
sleep 0.1

# Get raw bytes
msb=`i2cget -y 2 0x40`
lsb=`i2cget -y 2 0x40`
# checksum=`i2cget -y 2 0x40`
# echo $msb, $lsb, $checksum

# Convert msb & lsb to decimal
msb=$(($msb&0xff))
lsb=$(($lsb&0xff))
# echo $msb, $lsb

a=`echo "$msb*256.0+$lsb" | bc`
b=`echo "$a*125.0" | bc`
c=`echo "$b/65536.0" | bc`
humidity=`echo "$c-6" | bc`
echo $humidity %RH
