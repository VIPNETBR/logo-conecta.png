#!/bin/bash
set -e

echo "== Actualizando sistema =="
sudo apt update -y && sudo apt upgrade -y

echo "== Instalando dependencias =="
sudo apt install -y python3 python3-venv python3-pip unzip wget

echo "== Preparando entorno =="
cd $HOME

# Borrar instalación previa (opcional)
rm -rf telegram-scraper telegram-scraper.zip

echo "== Descargando proyecto =="
wget https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper.zip -O telegram-scraper.zip

echo "== Descomprimiendo proyecto =="
unzip telegram-scraper.zip -d telegram-scraper

cd telegram-scraper

echo "== Creando entorno virtual =="
python3 -m venv venv

echo "== Activando entorno e instalando dependencias Python =="
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "== Configurando permisos =="
chmod +x menu.py

echo "== Configurando comando global 'menu' =="
sudo ln -sf $(pwd)/menu.py /usr/local/bin/menu
sudo chmod +x /usr/local/bin/menu

echo "== Configurando crontab para ejecución diaria automática =="
(crontab -l 2>/dev/null; echo "0 0 * * * cd $(pwd) && source venv/bin/activate && python3 menu.py ejecutar_scraper >> scraper.log 2>&1") | crontab -

echo "== Instalación completada =="
echo "Usa el comando 'menu' para iniciar el menú principal."
