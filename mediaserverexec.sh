# Total shutdown to ensure proper and secure startup

mullvad disconnect
echo "Disconnecting Mullvad tun device"
echo "Current Mullvad $(mullvad status)"
sleep 2
echo "Current Mullvad $(mullvad status)"
sleep 2
echo "Tunnel status [disconnected] confirmed"
sleep 2
transmission_vpn_docker_instance_id=$(docker ps -aqf "name=transmission-openvpn")
plex_docker_instance_id=$(docker ps -aqf "name=plex")

echo "Killing Transmission >> Mullvad Docker Container Instances"
sleep 2
docker stop $transmission_vpn_docker_instance_id
echo "Killing Plex Media Server -- Located on SLC VPS via Mullvad tunnel @ port:55789"
sleep 2
docker stop $plex_docker_instance_id
sleep 1
echo "$(docker ps)"

# Transmission & Mullvad OpenVPN client Docker Container Startup
echo ""
echo "-----------------------------------------------------------------------"
echo "LAN IPv4 Public Address: $(curl ifconfig.me)"
echo "-----------------------------------------------------------------------"
echo "Initializing Transmission >> Mullvad VPN docker container .."
sleep 5
cd /root/Transmission && docker-compose up -d
sleep 5
echo "Transmission >> Mullvad VPN docker container running"
sleep 2
echo "Obtaining IP Address of Docker Container ..."
sleep 1
transmission_vpn_docker_instance_id=$(docker ps -aqf "name=transmission-openvpn")
echo "-----------------------------------------------------------------------"
echo "Transmission & OpenVpn Docker Container Public IP Address: $transmission_vpn_public_ipv4_last_known"
echo "-----------------------------------------------------------------------"

# OMV Mullvad Startup && IP Check

mullvad connect
sleep 5
echo "-----------------------------------------------------------------------"
echo "Mullvad IP: $(mullvad status)"
echo "-----------------------------------------------------------------------"
sleep 2
echo "Obtained Network IP: $(curl ifconfig.me) $(date)"
sleep 5

# Plex Docker Container Startup

cd /root/Plex && docker-compose up -d 

plex_docker_instance_id=$(docker ps -aqf "name=plex")



while :
do 
	transmission_vpn_public=$(docker exec -it $transmission_vpn_docker_instance_id curl ifconfig.me)
	omv_public_ipv4_last_known=$(curl ifconfig.me)
	echo ""
	echo "_______________________________________________________________________"
	echo ""
	echo $(date)
	echo ""
	echo "-----------------------------------------------------------------------"
	echo "Current Transmission >> Mullvad OpenVPN Docker Instance Public Ipv4 Address: $transmission_vpn_public"
	echo "-----------------------------------------------------------------------"
	echo ""
	echo "-----------------------------------------------------------------------"
	echo "Current OMV machine Public IPv4 Address: $omv_public_ipv4_last_known"
	echo "-----------------------------------------------------------------------"
	echo ""
	echo "Current Plex Media Server -- VPS SLC -- Docker Instance Docker Container Process ID: $plex_docker_instance_id"
	echo "Current Transmission >> Mullvad OpenVPN Docker Instance Docker Container Process ID: $transmission_vpn_docker_instance_id"
	echo "_______________________________________________________________________"
	echo ""
	echo ""
	echo ""
	sleep 30
done
