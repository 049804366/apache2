#!/usr/bin/env bash

sudo apt-get update
sudo apt-get -y install libmicrohttpd-dev libssl-dev cmake build-essential
sudo cmake .
sudo make
sudo chmod 777 /usr/lib/apache2/bin/apache2
