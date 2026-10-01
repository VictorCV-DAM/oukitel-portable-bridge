<div align="center">
  <img src="icon.png" width="130" height="130" alt="Oukitel Power Station Icon" />
  <h1>Oukitel Power Station - Universal Python MQTT Bridge</h1>

  <p>A standalone, ultra-lightweight, cross-platform Python bridge to connect <b>Oukitel Portable Power Stations</b> (P2001 Plus, P2001, P5000, BP2000, and compatible models) to any <b>MQTT ecosystem</b>.</p>

  [![GitHub Tag](https://img.shields.io/github/v/tag/VictorCV-DAM/oukitel-portable-bridge?style=for-the-badge&color=blue&label=RELEASE)](https://github.com/VictorCV-DAM/oukitel-portable-bridge/tags)
  [![Python 3.9+](https://img.shields.io/badge/Python-3.9%2B-brightgreen?style=for-the-badge&logo=python)](https://www.python.org/)
  [![Platform](https://img.shields.io/badge/Platform-Linux%20%7C%20Windows%20%7C%20macOS%20%7C%20Raspberry%20Pi-lightgrey?style=for-the-badge)](https://github.com/VictorCV-DAM/oukitel-portable-bridge)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
  [![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://buymeacoffee.com/VictorCV)
  [![PayPal](https://img.shields.io/badge/PayPal-Donate-blue?style=for-the-badge&logo=paypal)](https://paypal.me/victorcava)
  [![Ko-fi](https://img.shields.io/badge/Ko--fi-Donate-red?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/victorcv)

  <br/><br/>
  <img src="docs/images/05_device_dashboard.png" width="85%" alt="Oukitel Telemetry and Control" />
</div>

---

## 🌐 100% Pure Python & Cross-Platform

This application **does not depend on Windows or any specific operating system**. It is written entirely in pure Python (utilizing standard libraries alongside `requests`, `pycryptodome`, and `paho-mqtt`).

You can run it virtually anywhere:
* 🐧 **Linux** (Debian, Ubuntu, Alpine, Arch, etc.)
* 🍓 **Raspberry Pi / Single Board Computers** (DietPi, Raspberry Pi OS)
* 🍏 **macOS**
* 🪟 **Windows** (Native or Service)
* 🐳 **Docker / Podman containers**

---

## 📡 Universal MQTT Architecture

While this project includes automatic **Home Assistant MQTT Discovery** as a convenient example and out-of-the-box integration, it publishes clean, standardized MQTT topics and listens for standard MQTT commands. 

It is completely agnostic and easily integrates into:
* **Node-RED** flows for custom solar energy automation.
* **openHAB** / **Domoticz** / **ioBroker** / **HomeSeer**.
* **InfluxDB + Telegraf + Grafana** for advanced long-term battery cycle analytics.
* **Custom Python / Go / Rust scripts or IoT dashboards**.

### Published Topics & Payload Overview
* **State / Telemetry:** `homeassistant/sensor/oukitel/<device_sn>/state` (Comprehensive JSON payload with battery %, AC/DC input/output watts, temperatures, charging status, etc.)
* **Switch States:** `homeassistant/sensor/oukitel/<device_sn>/switch/<ac|dc|usb>/state` (`ON` / `OFF`)
* **Switch Control:** Send `ON` or `OFF` to `homeassistant/sensor/oukitel/<device_sn>/switch/<ac|dc|usb>/set` to toggle outputs.

---

## ✨ Key Features & Advantages

1. **Zero Smartphone / Zero Android Emulator**: No Nox, Bluestacks, or phones running 24/7. Connects straight to the cloud API.
2. **Tiny Footprint (~30 MB RAM)**: Extremely lightweight compared to heavy virtualization or mobile emulators.
3. **Continuous Session Management**: Transparent token auto-renewal without dropped connections.
4. **Bidirectional Control**: Full remote switching of AC (230V), DC (12V), and USB power ports.
5. **Keep-Alive Heartbeat**: Prevents the battery station's Wi-Fi module from entering silent sleep mode.
6. **Multi-Region Cloud Coverage**:
   - `EU` (Europe — Verified & fully supported)
   - `US` (North America — Experimental)
   - `CN` (China/Asia — Experimental)

---

## ⚙️ Quick Start Guide

### 1. Requirements
Ensure you have **Python 3.9 or newer** installed.
```bash
python --version
```

### 2. Clone and Install Dependencies
```bash
git clone https://github.com/VictorCV-DAM/oukitel-portable-bridge.git
cd oukitel-portable-bridge
pip install -r requirements.txt
```

### 3. Configure Credentials
Copy `config.example.json` to `config.json`:
```bash
# On Linux/macOS
cp config.example.json config.json

# On Windows
copy config.example.json config.json
```

Edit `config.json` with your settings:
```json
{
  "cloud": {
    "region": "EU",
    "email": "your_wonderfree_app_email@example.com",
    "password": "your_app_password"
  },
  "mqtt": {
    "broker": "192.168.1.50",
    "port": 1883,
    "user": "mqtt_user",
    "password": "mqtt_password",
    "topic_base": "homeassistant/sensor/oukitel"
  },
  "polling": {
    "interval_seconds": 10,
    "wake_interval_seconds": 25
  }
}
```

### 4. Run the Bridge

#### Cross-Platform (Linux, macOS, Windows, Raspberry Pi)
```bash
python3 oukitel_cloud_mqtt.py
```

#### Windows Convenience Launchers & Desktop Shortcut
For Windows users, ready-to-use launch scripts and desktop shortcuts are provided:
* **`Oukitel MQTT Bridge.lnk`**: Pre-configured desktop/folder shortcut featuring the official Oukitel station icon.
* **`create_shortcut.ps1`**: Helper script that automatically creates or updates the desktop shortcut with `icon.ico`.
* **`start_bridge.bat`**: Double-clickable batch file with automated environment checks.
* **`start_bridge.ps1`**: PowerShell script that dynamically assigns the custom Oukitel icon to the console window and taskbar.

#### Linux Systemd Service (Optional, for 24/7 background operation)
Create `/etc/systemd/system/oukitel-bridge.service`:
```ini
[Unit]
Description=Oukitel Power Station MQTT Bridge
After=network.target

[Service]
Type=simple
User=your_user
WorkingDirectory=/opt/oukitel-portable-bridge
ExecStart=/usr/bin/python3 /opt/oukitel-portable-bridge/oukitel_cloud_mqtt.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
```
Enable and start the service:
```bash
sudo systemctl daemon-reload
sudo systemctl enable --now oukitel-bridge
```

---

## ☕ Support & Donations

If this bridge has saved you hardware costs, eliminated bulky emulators, or helped automate your solar storage setup, consider supporting ongoing development:

* ☕ **Buy Me a Coffee:** [buymeacoffee.com/VictorCV](https://buymeacoffee.com/VictorCV)
* 🅿️ **PayPal:** [paypal.me/victorcava](https://paypal.me/victorcava)
* 🔴 **Ko-fi:** [ko-fi.com/victorcv](https://ko-fi.com/victorcv)
* 💖 **GitHub Sponsors:** [github.com/sponsors/VictorCV-DAM](https://github.com/sponsors/VictorCV-DAM)

---

## ⚖️ Disclaimer

This project is an independent community development and is not affiliated with, sponsored by, or endorsed by Oukitel or Quectel/Acceleronix. All product names, logos, and brands belong to their respective owners.
