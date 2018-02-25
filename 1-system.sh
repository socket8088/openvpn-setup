#!/bin/bash

# update and upgrade system
echo "[+] Updating and upgrading system"
apt-get update
apt-get upgrade

# add new user to the system
adduser socket
usermod -a -G sudo socket
