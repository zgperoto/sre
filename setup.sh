#!/bin/bash
# Atualiza pacotes
sudo apt update -y

# Instala Docker
sudo apt install -y docker.io

# Instala Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Clona seu repositório
git clone https://github.com/zgperoto/sre.git /home/ubuntu/app

# Entra na pasta
cd /home/ubuntu/app

# Sobe os containers
sudo docker-compose up -d --build