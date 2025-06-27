# 🛡️ Telegram Scraper - XPSSH Edition

Sistema automático para agregar usuarios de grupos públicos de Telegram a tu grupo destino, con soporte para múltiples cuentas, configuración simple, y ejecución automatizada desde menú tipo SSH Plus.

---

## 🚀 Instalación rápida (modo automático XPSSH)

Copia y pega esto en tu VPS para instalar y lanzar el sistema:

```bash
cd ~
rm -rf telegram-scraper telegram-scraper.zip
wget https://github.com/VIPNETBR/telegram-scraper/raw/main/telegram-scraper.zip -O telegram-scraper.zip
unzip telegram-scraper.zip -d telegram-scraper
cd telegram-scraper
bash install.sh
menu
