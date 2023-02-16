##!/bin/sh

#set -x

printf "%s" "First parameter"
echo $1

printf "%s" "Second parameter"
echo $2

printf "%s" "Third parameter"
echo $3

printf "%s" "Exit status of last task"
echo #?

printf "%s" "PID of last background task"
echo $!

printf "%s" "PID of shell"
echo $$

printf "%s" "Filename of the shell script"
echo $0

printf "%s" "Last argument of the previous command"
echo $_

printf "%s" "return value of piped commands (array)"
ls | sort | find /Users/tim2/Documents/systemInfo/macOS_BashScripting systemInfo*
echo ${PIPESTATUS[n]}

#RSA COMMAND LINE !!!!!
#Generate an RSA key pair: To generate an RSA key pair, use the following command:
#This will generate a private RSA key saved as "private_key.pem" encrypted with AES-256.
openssl genpkey -algorithm RSA -out private_key.pem -aes256

#Export the public key: To export the public key, use the following command:
#This will generate a public RSA key saved as "public_key.pem".
openssl pkey -in private_key.pem -outform PEM -pubout -out public_key.pem

#Encrypt data: To encrypt data using the RSA public key, use the following command:
#This will encrypt the data in "plaintext.txt" and save it as "ciphertext.bin".
openssl pkeyutl -encrypt -in plaintext.txt -out ciphertext.bin -pubin -inkey public_key.pem

#Decrypt data: To decrypt data using the RSA private key, use the following command:
#This will decrypt the data in "ciphertext.bin" and save it as "decrypted.txt".
openssl pkeyutl -decrypt -in ciphertext.bin -out decrypted.txt -inkey private_key.pem

#SELF SIGNED CERT !!!!!!!!
#Create a private key: To create a private key, use the following command:
#This will generate a private RSA key saved as "private_key.pem" encrypted with AES-256.
openssl genpkey -algorithm RSA -out private_key.pem -aes256

#Create a certificate signing request (CSR): To create a CSR, use the following command:
#This will generate a CSR saved as "csr.pem". You will be prompted to enter information about #your organization and the domain name for which the certificate will be used.
openssl req -new -key private_key.pem -out csr.pem

#Create a self-signed certificate: To create a self-signed certificate, use the following #command:
#This will create a self-signed SSL certificate saved as "self_signed.crt".
openssl x509 -req -in csr.pem -signkey private_key.pem -out self_signed.crt

#Configure the OpenVPN server:
#Create a private key: To create a private key, use the following command:
openvpn --genkey --secret private.key
#To configure the OpenVPN server, create a configuration file with #the following contents:
#Save this file as "server.conf".
#port 1194
#proto udp
#dev tun
#ca private.key
#cert server.crt
#key server.key
#dh dh2048.pem
#server 10.8.0.0 255.255.255.0
#push "redirect-gateway def1 bypass-dhcp"
#push "dhcp-option DNS 8.8.8.8"
#keepalive 10 120
#comp-lzo
#persist-key
#persist-tun
#status openvpn-status.log
#verb 3

#Start the OpenVPN server: To start the OpenVPN server, use the following command:
openvpn --config server.conf

iw dev.
ip link show wlan0.
ip link set wlan0 up.
wpa_passphrase Yeahhub >> /etc/wpa_supplicant.conf.
wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf.
iw wlan0 link.#shasum sumfile.txt > hashvaule.txt
