mkdir -p ~/client-configs/files
chmod 700 ~/client-configs/files
cp /usr/share/doc/openvpn/examples/sample-config-files/client.conf ~/client-configs/base.conf

# modify ovpn file
# get server IP
IP=$(ifconfig | grep eth0 -A 1 | grep inet | awk '{print$2}' | sed 's/addr://')
# modify file
sed -i "s/remote my-server-1 1194/remote $IP 1194/" ~/client-configs/base.conf
sed -i 's/cert client.crt/cert zion-client.crt/' ~/client-configs/base.conf
sed -i 's/key client.key/key zion-client.key/' ~/client-configs/base.conf
sed -i 's/;tls-auth ta.key 1/tls-auth ta.key 1/' ~/client-configs/base.conf
sed -i 's/;user nobody/user nobody/' ~/client-configs/base.conf
sed -i 's/;group nogroup/group nobody/' ~/client-configs/base.conf
sed -i 's/ca ca.cert/#ca ca.cert/' ~/client-configs/base.conf
sed -i 's/cert client.crt/#cert client.crt/' ~/client-configs/base.conf
sed -i 's/key client.key/#key client.key/' ~/client-configs/base.conf

echo "cipher AES-128-CBC" >> ~/client-configs/base.conf
echo "auth SHA256" >> ~/client-configs/base.conf
echo "key-direction 1" >> ~/client-configs/base.conf
