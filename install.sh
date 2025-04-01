#!/usr/bin/env bash

# We will be using the `meta` key as mac-os 'Cmd' key, so we
# must prevent it from doing the regular gnome overlay action:
gsettings set org.gnome.mutter overlay-key ''

# install keyd
git clone https://github.com/rvaiya/keyd
cd keyd
make
sudo make install
sudo systemctl enable --now keyd

cd ..
rm -rf ./keyd

sudo mkdir -p /etc/keyd/
sudo cp default.conf /etc/keyd/default.conf
sudo chmod 644 /etc/keyd/default.conf

sudo systemctl daemon-reload
sudo systemctl stop keyd
sudo systemctl enable keyd
sudo systemctl start keyd
