# allow ip forwarding
echo "[+] Making changes in sysctl.conf to allow ip forwarding"
sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

# read changes in sysctl and apply them
echo "[+] Applying changes to allow ip forwarding"
sudo sysctl -p

# change firewall configuration
sed -i '10 a \n# START OPENVPN RULES\n# NAT table rules\n*nat\n:POSTROUTING ACCEPT [0:0]\n# Allow traffic from OpenVPN client to eth0\n-A POSTROUTING -s 10.8.0.0/8 -o eth0 -j MASQUERADE\nCOMMIT\n# END OPENVPN RULES\n' /etc/ufw/before.rules

# create firewall rules
ufw default deny
#ufw allow from XX.XX.XX.XX to any port 22 # change this and remove the port 22/ssh line that is open to everyone
#ufw allow 22
ufw allow 12829
ufw allow 1194/udp
ufw allow from 10.8.0.0/24

#ufw enable
