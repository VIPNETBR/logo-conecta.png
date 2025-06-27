#!/bin/bash
set -e

echo "📦 Actualizando sistema..."
sudo apt update -y && sudo apt upgrade -y

echo "🐍 Instalando dependencias..."
sudo apt install -y python3 python3-venv python3-pip unzip wget

echo "🧹 Limpiando instalación anterior..."
cd $HOME
rm -rf telegram-scraper telegram-scraper.zip

echo "⬇️ Descargando sistema desde GitHub..."
wget https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper.zip -O telegram-scraper.zip

echo "📂 Descomprimiendo..."
unzip telegram-scraper.zip -d telegram-scraper
cd telegram-scraper

echo "🔧 Creando entorno virtual..."
python3 -m venv venv

echo "🚀 Activando entorno virtual e instalando dependencias..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "✅ Configurando comando global 'menu
