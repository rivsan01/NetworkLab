#!/bin/bash
echo -e "\n**Some tests to check connectivity with the server and more information**\n"

echo "Checking if there is connectivity with Ubuntu Server host..."
ping_cmd=$(ping -c 3 10.10.10.20 2>&1)

if [[ $? -eq 0 && $ping_cmd=~"3 packets transmitted, 3 received, 0% packet loss" ]]; then
	echo -e "=> Connectivity is OK!\n"
else
	echo "=> Connectivity ERROR!"
	echo -e "$ping_cmd\n"
fi

echo "Checking if HTTP server is up..."
curl_cmd=$(curl -s -o /dev/null -w "%{http_code}" http://10.10.10.20/)
if [[ $curl_cmd == 200 ]]; then
	echo -e "=> HTTP Server running!\n"
else
	echo -e "=> HTTP Server NOT running!\n"
fi

echo "Checking if DNS server is up..."
dig_cmd=$(dig @10.10.10.20 2>&1)

if [[ $? -eq 0 && $dig_cmd=~"status: NOERROR" ]]; then
	echo -e "=> DNS Server is OK!\n"
else
	echo "=> DNS Server ERROR!"
	echo -e "$ping_cmd\n"
fi
