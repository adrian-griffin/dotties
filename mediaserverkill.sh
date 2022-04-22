#Shutdown to ensure proper and secure startup

transmission_vpn_docker_instance_id=$(docker ps -aqf "name=transmission-openvpn")
plex_docker_instance_id=$(docker ps -aqf "name=plex")
echo "Killing Transmission >> Mullvad Docker Container Instances"
docker stop $transmission_vpn_docker_instance_id
echo "Killing Plex Media Server -- Located on SLC VPS via Mullvad tunnel @ port:55789"
docker stop $plex_docker_instance_id
sleep 1
echo "$(docker ps -a)"
sleep 2
echo ""
echo ""
echo ""
echo "$(docker ps -a)"
sleep 2
echo ""
echo ""
echo ""
echo "$(docker ps)"
