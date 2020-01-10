echo "put in the name of a backup folder in order to swap only the save file"
echo "located at /opt/backup"
echo " "

read VERSION
echo "Factorio stopping"
docker stop factorio

echo "Factorio Save Copying"
cp -R /opt/backup/$VERSION/saves/ /opt/factorio/saves/

echo "Factorio starting"
docker start factorio
