#!/bin/bash
set -e

echo "== Actualizando sistema =="
sudo apt update -y && sudo apt upgrade -y

echo "== Instalando dependencias necesarias =="
sudo apt install -y python3 python3-venv python3-pip unzip wget

echo "== Preparando entorno de trabajo =="
cd $HOME
rm -rf telegram-scraper telegram-scraper.zip

echo "== Descargando proyecto desde GitHub =="
wget https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper-actualizado.zip -O telegram-scraper.zip

echo "== Descomprimiendo el proyecto =="
unzip telegram-scraper.zip -d telegram-scraper
cd telegram-scraper

echo "== Creando entorno virtual =="
python3 -m venv venv

echo "== Activando entorno virtual e instalando dependencias Python =="
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "== Configurando permisos y acceso global al menú =="
chmod +x menu.py
sudo ln -sf $(pwd)/menu.py /usr/local/bin/menu
sudo chmod +x
