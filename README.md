# Oukitel Power Station - MQTT Bridge (Standalone & Portable)

Standalone, lightweight background bridge to connect **Oukitel Portable Power Stations** (P2001 Plus, P2001, P5000, BP2000, etc.) to **Home Assistant** via MQTT Discovery.

<div align="center">
  <img src="docs/images/05_device_dashboard.png" width="85%" alt="Home Assistant Dashboard with Oukitel" />

  [![GitHub Release](https://img.shields.io/github/v/release/VictorCV-DAM/oukitel-portable-bridge?style=for-the-badge&color=blue)](https://github.com/VictorCV-DAM/oukitel-portable-bridge/releases)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
  [![Buy Me A Coffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-Donate-orange?style=for-the-badge&logo=buy-me-a-coffee)](https://buymeacoffee.com/VictorCV)
  [![PayPal](https://img.shields.io/badge/PayPal-Donate-blue?style=for-the-badge&logo=paypal)](https://paypal.me/victorcava)
  [![Ko-fi](https://img.shields.io/badge/Ko--fi-Donate-red?style=for-the-badge&logo=ko-fi)](https://ko-fi.com/victorcv)
</div>

---

## ✨ Key Advantages

1. **Zero Smartphone / Zero Emulator Needed**: No Android emulators (Nox, Bluestacks), no ADB commands, and no smartphone running 24/7.
2. **Ultra-Low Memory Footprint**: Runs in just **~30 MB of RAM** instead of 4–8 GB of an emulator.
3. **No Session Drops**: Transparent OAuth token auto-renewal before expiration.
4. **Home Assistant MQTT Discovery**: Sensors and bidirectional switches automatically appear in Home Assistant.
5. **Bidirectional Control**: Control AC 230V, DC 12V, and USB ports directly from HA automations and dashboard.
6. **Automatic Sleep Keep-Alive**: Periodically keeps reporting active so the battery station does not turn off communication.
7. **Multi-Region Cloud Support**: `EU` (Europe - Verified), `US` (North America - [EXPERIMENTAL]), `CN` (China/Asia - [EXPERIMENTAL]).

---

## 📸 User Interface Preview

<div align="center">
  <table width="100%">
    <tr>
      <td width="50%" align="center">
        <b>1. Real-Time Telemetry & Controls</b><br/><br/>
        <img src="docs/images/05_device_dashboard.png" alt="Oukitel Dashboard" width="95%"/>
      </td>
      <td width="50%" align="center">
        <b>2. Dynamic Update Frequency (3-120s)</b><br/><br/>
        <img src="docs/images/04_options_frequency.png" alt="Update Frequency" width="95%"/>
      </td>
    </tr>
  </table>
</div>

---

## ⚙️ Quick Start (Portable Setup)

### 1. Configure Credentials
Copy `config.example.json` to `config.json` and enter your Wonderfree / Oukitel mobile app account details and MQTT broker:

```json
{
  "cloud": {
    "region": "EU",
    "email": "your_wonderfree_app_email@example.com",
    "password": "your_app_password"
  },
  "mqtt": {
    "broker": "192.168.1.XXX",
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

### 2. Install Dependencies
```bash
pip install -r requirements.txt
```

### 3. Run
- **On Windows**: Double-click `Lanzar MQTT OUKITEL.bat` or run `Iniciar_Oukitel_V4.ps1`.
- **On Linux / macOS**: Run `python3 oukitel_cloud_mqtt.py`.

---

## ☕ Support & Donations

If this standalone bridge has saved you hardware costs or helped integrate your solar storage, consider supporting continuous maintenance:

- ☕ **Buy Me a Coffee:** [buymeacoffee.com/VictorCV](https://buymeacoffee.com/VictorCV)
- 🅿️ **PayPal:** [paypal.me/victorcava](https://paypal.me/victorcava)
- 🔴 **Ko-fi:** [ko-fi.com/victorcv](https://ko-fi.com/victorcv)
- 💖 **GitHub Sponsors:** [github.com/sponsors/VictorCV-DAM](https://github.com/sponsors/VictorCV-DAM)

---

## ⚖️ Disclaimer

This project is an independent community development and is not affiliated with, sponsored by, or endorsed by Oukitel or Quectel/Acceleronix. All product names, logos, and brands are property of their respective owners.
