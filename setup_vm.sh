#!/bin/bash

# Script de preparación de la VM (Ubuntu/Debian)
USER_TO_ADD="$1" # Recibe el nombre de usuario de SSH

echo "--- 1. Actualizando e instalando Docker y Docker Compose ---"
sudo apt update -y
sudo apt install -y docker.io docker-compose

echo "--- 2. Configurando permisos de Docker ---"
sudo usermod -aG docker $USER_TO_ADD

echo "--- 3. Configurando Firewall Interno (UFW en Puerto 80) ---"
sudo apt install -y ufw
sudo ufw allow 80/tcp
sudo ufw --force enable
sudo ufw status verbose

echo "--- 4. Creando Directorio de Despliegue ---"
DEPLOY_PATH="/home/$USER_TO_ADD/deploy"
mkdir -p $DEPLOY_PATH

echo "--- Configuración inicial de la VM completada ---"
