#!/bin/bash
sudo apt-get update
sudo apt-get install nfs-kernel-server tftp tftpd xinetd -y
sudo apt-get install gcc-multilib -y

mkdir /tftpboot
chmod 777 /tftpboot

touch /etc/xinetd.d/tftpd
echo "service tftp" >> /etc/xinetd.d/tftpd
echo "{" >> /etc/xinetd.d/tftpd
echo "protocol	= udp" >> /etc/xinetd.d/tftpd
echo "port	= 69" >> /etc/xinetd.d/tftpd
echo "socket_type	= dgram" >> /etc/xinetd.d/tftpd
echo "wait	= yes" >> /etc/xinetd.d/tftpd
echo "user	= nobody" >> /etc/xinetd.d/tftpd
echo "server	= /usr/sbin/in.tftpd" >> /etc/xinetd.d/tftpd
echo "server_args	= /tftpboot" >> /etc/xinetd.d/tftpd
echo "disable	= no" >> /etc/xinetd.d/tftpd
echo "}" >> /etc/xinetd.d/tftpd

/etc/init.d/xinetd restart



