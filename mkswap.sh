#!/bin/sh

# MB
SWAP_SIZE=4000

# Swapfile path
SWAP_FILE=/var/swapfile

# Swap Off
sudo swapoff -a

# Delete Swapfile
if [ -d $SWAP_FILE ]; then
    sudo rm $SWAP_FILE
fi

# make file
sudo /bin/dd if=/dev/zero of=$SWAP_FILE bs=1M count=$SWAP_SIZE

# change permission
sudo chmod 0600 $SWAP_FILE

# make swap
sudo mkswap $SWAP_FILE

# swap start
sudo swapon $SWAP_FILE

