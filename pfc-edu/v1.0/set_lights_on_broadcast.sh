#!/bin/bash

for i in `seq 0 7`;
do
  i2cset -y 2 0x47 $((0x30+$i)) 0x00 0x00 i
done
