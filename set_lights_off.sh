#!/bin/bash

for i in `seq 0 7`;
do
  i2cset -y 2 0x4c $((0x30+$i)) 0xff 0x00 i
done
