#!/bin/bash
set -e

WORKDIR="$HOME/telegram-scraper"

echo "[+] Actualizando sistema desde GitHub..."
cd "$WORKDIR"
git reset --hard
git pull origin main

echo "[+] Activando entorno virtual..."
source venv/bin/activate

echo "[+] Actualizando dependencias Python..."
pip install --upgrade pip
pip install -r requirements.txt

echo "[+] Actualización completada."