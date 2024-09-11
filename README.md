# Docker Fabric 1.21 server
A clean Docker based Fabric Minecraft server for 1.21 including cloudflare tunnel


## WARNING
YOUR WILL AUTOMATICALLY ACCEPT THE MINECRAFT EULA! BE AWARE

## configure
### tunnel
set your cloudflare tunnel TOKEN inside `docker-compose.yml`

### mods
download mod files to `./server/mods/`

## start
`docker compose up -d`

## access server console
`docker attach <ID OF THE CONTAINER>`
(find the container id using `docker ps`)

## connect from outside
### Windows
1. Download cloudflared to your client-system 
find the newest `cloudflared-windows-amd64.exe` from https://github.com/cloudflare/cloudflared/releases/ and install it

2. start the tunnel connection
`C:\<PATH TO THE DOWNLOADED EXE>\cloudflared-windows-amd64.exe access tcp --hostname <DOMAIN FROM WHICH THE SERVER IS REACHABLE> --url localhost:25565`

3. add server to minecraft 
add the server by using localhost:25565

### Linux
1. install cloudflared using your package manager

2. start the tunnel connection
`cloudflared access tcp --hostname <DOMAIN FROM WHICH THE SERVER IS REACHABLE> --url localhost:25565`

3. add server to minecraft 
add the server by using localhost:25565

### IMPORTANT
the cloudflared process MUST run in the backgroun

## Change server version
go to `start.sh` and replace the fabric download link your desired version. You will also need to change the name of the file!