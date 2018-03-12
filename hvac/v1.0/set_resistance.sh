if [ $1 -gt 20000 ]
then
  echo "Invalid entry, resistance must be between 0-20,000 Ohms"
  exit 0
pwd
fi

if [ $1 -lt 0 ]
then
  echo "Invalid entry, resistance must be between 0-20,000 Ohms"
  exit 0
pwd
fi

# Display welcome messsage
echo "Setting resistance to: $1 Ohms"

# Calculate desired dac value
bits=1024 # 10 bit resolution
ohms=20000 # 0-20K pot
out=`echo $1*$bits/$ohms | bc`
msb=$((($out & 0x300) >> 8))
lsb=$(($out&0xff))

# Convert into data bytes
data0=`echo 4 + $msb | bc`
data1=$lsb

# Send command
i2cset -y 2 0x2c $data0 $data1 i
