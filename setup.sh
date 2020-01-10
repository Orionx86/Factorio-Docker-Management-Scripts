echo "This script installs Docker on a brand new server..."
echo "runs the Factorio docker container, stops it, "
echo "edits your config so you can add your token and server information"
echo "and restarts factorio"

##################
# Install Docker #
##################

sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo systemctl restart docker
echo "Docker install finished"

####################
# Install Factorio #
####################

sudo mkdir -p /opt/backup
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

echo " "
echo "waiting for the container to come up and build all required files"
echo ""
echo "You will need your username and token that can be located at https://factorio.com/profile"
echo "The following are the lines you will need to edit"
echo " "
echo "Line 2 name
Line 7 max players
line 11-14 for visibility
line 18 for token
No password
Line 24 for game_password
and Line 64 for Admins"
echo " "
echo "Ctrl + O to save / Ctrl + C to exit"
echo " "

$ read -rsp $'Press any key to continue...\n' -n1 key

#################################
# Edit Factorio server settings #
#################################

docker stop factorio
nano /opt/factorio/config/server-settings.json
echo "restarting factorio container"
docker start factorio

echo "Factorio is ready"
echo "all your important information is stored at /opt/factorio"