# install packets
echo "[+] Installing necessary packets"
apt-get install openvpn easy-rsa

# make a directory for the CAs
make-cadir ~/openvpn-ca
cd ~/openvpn-ca

# modify vars file in easy-rsa
# main path
sed -i 's/export EASY_RSA="`pwd`"/export EASY_RSA="\/home\/socket\/openvpn-ca\/"/' ~/openvpn-ca/vars
# CA information
sed -i 's/export KEY_ORG="Fort-Funston"/export KEY_ORG="zion-org"/' ~/openvpn-ca/vars
sed -i 's/export KEY_EMAIL="me@myhost.mydomain"/export KEY_EMAIL="revil@zion.free"/' ~/openvpn-ca/vars
sed -i 's/export KEY_OU="MyOrganizationalUnit"/export KEY_OU="lab"/' ~/openvpn-ca/vars
sed -i 's/export KEY_NAME="EasyRSA"/export KEY_NAME="zion-server"/' ~/openvpn-ca/vars

# add easy-rsa new variables to environment
echo "[+] Adding easy-rsa new environment variables"
cd ~/openvpn-ca/
source vars
./clean_all

# build CA (Authority Certificate)
echo "[+] Building CAs"
./build-ca


