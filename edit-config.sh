nano /opt/factorio/config/server-settings.json
echo "restarting factorio container"
docker stop factorio
docker start factorio

