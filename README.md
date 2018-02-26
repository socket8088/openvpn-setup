# openvpn-setup

Setup an openvpn server for a just bought new vps. It disallows all connections except the VPN.

It upgrades the system, creates a new user and install the packages. Then it configure the environment vars and installs the CA.

After that, It creates the certificates and the keys for the server and the user.

Finally it configures the network to block all ports except de VPN.
