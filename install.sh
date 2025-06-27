#!/bin/bash

set -e

WORKDIR="$HOME/telegram-scraper"

echo "[+] Actualizando sistema..."
sudo apt update -y && sudo apt upgrade -y

echo "[+] Instalando dependencias necesarias..."
sudo apt install -y python3 python3-pip python3-venv unzip wget git

echo "[+] Preparando carpeta $WORKDIR"
rm -rf "$WORKDIR"
mkdir -p "$WORKDIR"
cd "$WORKDIR"

echo "[+] Descargando proyecto desde GitHub..."
wget -q https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper.zip -O telegram-scraper.zip

echo "[+] Descomprimiendo..."
unzip -o telegram-scraper.zip
rm telegram-scraper.zip

echo "[+] Creando entorno virtual..."
python3 -m venv venv

echo "[+] Activando entorno virtual e instalando dependencias Python..."
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "[+] Creando comando global 'menu'..."
echo '#!/bin/bash
cd "'"$WORKDIR"'"
source ./venv/bin/activate
python3 menu.py "$@"' > menu

chmod +x menu
sudo ln -sf "$WORKDIR/menu" /usr/local/bin/menu
sudo chmod +x /usr/local/bin/menu

echo "[+] Configurando ejecución automática diaria con cron..."
(crontab -l 2>/dev/null | grep -v 'menu ejecutar_scraper'; echo "0 3 * * * cd $WORKDIR && source venv/bin/activate && python3 menu.py ejecutar_scraper >> $WORKDIR/scraper.log 2>&1") | crontab -

echo "[+] Instalación completada."
echo "Ejecuta el comando 'menu' para iniciar el sistema."
