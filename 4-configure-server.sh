# unzip and copy an example server.conf file
echo "[+] Getting an example server.conf file"
gunzip -c /usr/share/doc/openvpn/examples/sample-config-files/server.conf.gz > /etc/openvpn/server.conf

# edit server.conf file
echo "[+] Editing openvpn server.conf"
# create HMAC firewall
sed -i 's/;tls-auth ta.key 0/tls-auth ta.key 0/' /etc/openvpn/server.conf
# select AES cipher
sed -i 's/;cipher AES-128-CBC/cipher AES-128-CBC/' /etc/openvpn/server.conf
# set auth
sed -i '252 a # Modify Auth\nauth SHA256\n' /etc/openvpn/server.conf
# avoid using root to run openvpn
sed -i 's/;user nobody/user nobody/' /etc/openvpn/server.conf
sed -i 's/;group nogroup/group nogroup/' /etc/openvpn/server.conf
# change server name
sed -i 's/cert server.crt/cert zion-server.crt/' /etc/openvpn/server.conf
sed -i 's/key server.key/key zion-server.key/' /etc/openvpn/server.conf
# fix for HMAC
sed -i '245 a key-direction 0' /etc/openvpn/server.conf
