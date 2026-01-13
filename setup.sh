#!/bin/bash

chmod +x tasks.sh
chmod +x lab.sh
currentuser=$USER
kernelinfo=$(uname -r)
sed -i "s/6\.17\.10\+kali-amd64/$kernelinfo/g" task5/logs/kernel.log
if [[ $kernelinfo == "6.17.11+kali-amd64" ]];then
	sed -i "s/6\.17\.11/6\.17\.10/g" task5/logs/kernel.log
fi
sudo chown root:root task4/secjez.sh
sudo chmod 777 task4/secjez.sh
sudo apt install xxd -y
chmod +x task5/*.sh
chmod 600 task5/logs/*
chmod 600 task5/trash/*

echo "You're ready to go!"
