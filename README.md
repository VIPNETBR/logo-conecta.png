# 🤖 Telegram Scraper Avanzado – Multi-cuentas con Panel Interactivo

Sistema automatizado para extraer miembros de grupos públicos de Telegram y agregarlos automáticamente a otro grupo, utilizando múltiples cuentas rotativas. Incluye menú interactivo tipo SSH Plus.

---

## 🚀 Funcionalidades

- Soporte para múltiples cuentas Telegram (rotación automática)
- Extrae miembros de hasta 20 grupos públicos
- Agrega usuarios a grupo público destino (donde eres admin)
- Automatización programada cada 24 horas (cron)
- Panel de administración estilo menú interactivo
- Ligero, limpio, funcional y fácil de configurar

---

## ⚙️ Requisitos

- VPS con Ubuntu 20.04, 22.04 o 24.04
- Python 3.8+
- Conexión a internet
- API ID y HASH para cada cuenta: [https://my.telegram.org](https://my.telegram.org)
- Estar como administrador en el grupo destino

---

## 📦 Archivos incluidos

`bash
telegram-scraper/
├── install.sh            # Instalador automático
├── menu                  # Panel de administración (bash menu)
├── multi_scraper.py      # Script principal
├── cuentas.yaml          # Configuración de cuentas
├── grupos.yaml           # Grupos origen/destino
├── cron_launcher.sh      # Script automático diario
├── log.txt               # Logs de ejecución
└── README.md             # Esta guía

✅Script comando instalacion completa:
```bash
sudo apt update && sudo apt install git unzip -y && \
git clone https://github.com/VIPNETBR/telegram-scraper.git && \
cd telegram-scraper && \
bash install.sh && \
bash menu
```
