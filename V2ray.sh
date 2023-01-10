#!/bin/sh
apt update
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt install docker-ce -y
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
mkdir ~/compose-demo
cd ~/compose-demo
service_path="app/index.html"
echo "<!doctype html>" > $service_path
echo "<html lang="en">" >> $service_path
echo "<head>" >> $service_path
echo "    <meta charset="utf-8">" >> $service_path
echo "    <title>Docker Compose Demo</title>" >> $service_path
echo "    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/kognise/water.css@latest/dist/dark.min.css">" >> $service_path
echo "</head>" >> $service_path
echo "<body>" >> $service_path
echo "    <h1>This is a Docker Compose Demo Page.</h1>" >> $service_path
echo "    <p>This content is being served by an Nginx container.</p>" >> $service_path
echo "</body>" >> $service_path
echo "</html>" >> $service_path
echo "app/index.html has been created"
service_path="docker-compose.yml"
echo "version: '3.7'" > $service_path
echo "services:" >> $service_path
echo "  web:" >> $service_path
echo "    image: nginx:alpine" >> $service_path
echo "    ports:" >> $service_path
echo "      - \"8000:80\"" >> $service_path
echo "    volumes:" >> $service_path
echo "      - ./app:/usr/share/nginx/html" >> $service_path
echo "docker-compose.yml has been created"
cd ~
git clone https://github.com/miladrahimi/v2ray-docker-compose.git
cd v2ray-docker-compose