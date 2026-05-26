#!/bin/bash
echo -e "**Script to periodically analyze and check logs of the Server**\n"


echo "Open ports of server..."
ss_cmd=$(ss -tulnp | awk 'NR>1 {split($5, a, ":"); print "-Port "a[length(a)]}' | sort -u)
echo -e "$ss_cmd\n"

echo "Check status of DNS server..."
dns_status_cmd=$(systemctl status dnsmasq 2>&1)
if [[ $? -eq 0 && $dns_status_cmd=~"Active: active (running)" ]]; then
	echo -e "=>  DNS Server is up!\n"
else
	echo "=> DNS Server ERROR!"
	echo -e "$dns_status_cmd\n"
fi
echo -e "Sending logs to /var/log/dns_logs ..."
$(sudo journalctl -u dnsmasq --no-pager | sudo tee /var/log/dns_logs > /dev/null)

echo -e "\nCheck status of SSH..."
ssh_status_cmd=$(systemctl status ssh 2>&1)
if [[ $? -eq 0 && $dns_status_cmd=~"Active: active (running)" ]]; then
	echo -e "=> SSH is up!\n"
else
	echo "=> SSH ERROR!"
	echo -e "$ssh_status_cmd\n"
fi
echo -e "Sending ssh logs to /var/log/ssh_logs ..."
$(sudo journalctl -u ssh --no-pager | sudo tee /var/log/ssh_logs > /dev/null)


