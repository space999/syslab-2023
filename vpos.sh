#!/bin/bash
source /etc/profile
cd /home/user/emb/vpos
make clean
make
cp images/vpos.bin /tftpboot
echo "complete"
