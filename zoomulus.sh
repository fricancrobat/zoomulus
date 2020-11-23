#!/bin/bash

echo 'This script will install programs needed for Jamulus and Zoom for AoH rehearsals'
echo ''
read -n -1 -s -r -p 'Press any key to continue'
sudo apt update
sudo apt upgrade
wget https://github.com/corrados/jamulus/archive/latest.tar.gz
tar -xvf latest.tar.gz

sudo apt-get -y install build-essential qt5-qmake qtdeclarative5-dev qt5-default qttools5-dev-tools libjack-jackd2-dev

sudo apt-get -y install qjackctl
sudo apt-get install linux-lowlatency

cd jamulus-latest
qmake "CONFIG+=noupcasename" Jamulus.pro
make clean
make
sudo make install

cd ~
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo apt install ./zoom_amd64.deb

echo 'All done!'
read -n -1 -s -r -p 'Press any key to reboot'