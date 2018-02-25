#!/bin/bash

# build keys for server
./build-key-server zion-server

# Diffie-Hellman
./build-dh

# HMAC signature
openvpn --genkey --secret keys/ta.key

# build keys for client
# without password
#./build-key socket
# with password
./build-key-pass socket

# move necessary files to openvpn folder
cd ~/openvpn-ca/keys
#sudo cp ca.crt ca.key server.crt server.key ta.key dh2048.pem /etc/openvpn
sudo cp ca.crt ca.key zion-server.crt zion-server.key ta.key dh2048.pem /etc/openvpn
