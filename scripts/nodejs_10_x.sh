#!/usr/bin/env bash

echo "-- nodejs_10_x.sh"

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "-- end nodejs_10_x.sh"