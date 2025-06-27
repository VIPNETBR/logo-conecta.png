#!/bin/bash
set -e

echo "📥 Limpiando instalaciones anteriores..."
rm -rf ~/telegram-scraper ~/telegram-scraper.zip

echo "⬇️ Descargando telegram-scraper desde GitHub..."
wget -q https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper.zip -O ~/telegram-scraper.zip

echo "📂 Descomprimiendo telegram-scraper.zip..."
unzip -q -o ~/telegram-scraper.zip -d ~/telegram-scraper

echo "🐍 Creando y activando entorno virtual..."
python3 -m venv ~/telegram-scraper/venv
source ~/telegram-scraper/venv/bin/activate

echo "📦 Instalando dependencias necesarias..."
pip install --upgrade pip > /dev/null
pip install telethon pyyaml > /dev/null

echo "🔧 Preparando comando global 'menu'..."
sudo ln -sf ~/telegram-scraper/menu.py /usr/local/bin/menu
sudo chmod +x /usr/local/bin/menu

echo "✅ Instalación completada. Ejecuta 'menu' para iniciar el panel."
