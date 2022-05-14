#!/usr/bin/env bash

# install keyd
git clone https://github.com/rvaiya/keyd
cd keyd
make
sudo make install
cd ..
rm -rf ./keyd

sudo cp default.conf /etc/keyd/default.conf
sudo chmod 644 /etc/keyd/default.conf

sudo systemctl enable keyd
sudo systemctl start keyd
