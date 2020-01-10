# Factorio-Docker-Management-Scripts

These are scripts for standing up and managing Factorio in a docker container. Helps you stand up new systems, manage saves, update mods, etc.

```
cd 
git clone https://github.com/Orionx86/Factorio-Docker-Management-Scripts.git
sudo sh setup.sh
```
You can store your mods in mods and use the copy-mods script to copy them to the games folder. This is a destructive process so all wanted mods need to be here. 

backup.sh will copy /opt/factorio to /opt/backup with todays date. 
restore.sh will copy ONLY the map save to the running game. This prevents old mods from stopping the server from coming up.
edit-config.sh will allow you to change any main server functions.
logs.sh because i hate typing docker logs factorio
