sudo mkdir -p /opt/factorio
sudo chown 845:845 /opt/factorio
echo "docker repo is located at https://hub.docker.com/r/factoriotools/factorio"
echo "port is 34197/udp"

sudo docker run -d \
  --network=host \
  -p 34197:34197/udp \
  -v /opt/factorio:/factorio \
  --name factorio \
  --restart=always \
  factoriotools/factorio

