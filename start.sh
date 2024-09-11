#!/bin/sh


#### Create Backup

cd /backup
zip -r "$(date).zip" /app

# Delete old backups (only 10 at a time)
ls -t | sed -e '1,10d' | xargs -d '\n' rm
# ls -t                 lists all files in decreasing order of modification
# sed -e '1,10d'        deletes first 10 lines
# xargs -d '\n' rm      collects all leftover lines to parse to rm


#### Create Server files

cd /app
if [ -e "/app/eula.txt" ]; then
  echo "everything should be installed"
else
  # Download Fabric
  curl -OJ https://meta.fabricmc.net/v2/versions/loader/1.21.1/0.16.5/1.0.1/server/jar
  # Setup Server
  java -jar fabric-server-mc.1.21.1-loader.0.16.5-launcher.1.0.1.jar server -downloadMinecraft
  # Agree to eula
  echo "eula=true" >> eula.txt
fi

#### Start the Server
java -Xmx10G -jar fabric-server-mc.1.21.1-loader.0.16.5-launcher.1.0.1.jar nogui
