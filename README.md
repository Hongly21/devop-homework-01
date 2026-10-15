# devop-homework-01

High Availability React Application Infrastructure deployed with Vagrant, HAProxy, Keepalived, and Systemd.

## Architecture

- **Load Balancers (HAProxy + Keepalived)**:
  - `lb-01`: `192.168.56.10` (Master)
  - `lb-02`: `192.168.56.11` (Backup)
  - VIP (Virtual IP): `192.168.56.100`

- **Web Application Servers (React + Systemd)**:
  - `web-01`: `192.168.56.20` (Port 3000)
  - `web-02`: `192.168.56.21` (Port 3000)

## Directory Structure

```text
.
├── README.md
├── .gitignore
└── ha-react-homework/
    ├── Vagrantfile
    ├── haproxy/
    │   └── haproxy.cfg
    ├── keepalived/
    │   ├── lb01.conf
    │   └── lb02.conf
    ├── react-app/
    │   ├── index.html
    │   ├── package.json
    │   ├── package-lock.json
    │   ├── vite.config.js
    │   ├── public/health
    │   └── src/
    │       ├── App.jsx
    │       └── main.jsx
    ├── scripts/
    │   ├── check-health.sh
    │   ├── deploy-react.sh
    │   ├── server-report.sh
    │   ├── service-manager.sh
    │   └── setup-web.sh
    └── systemd/
        └── react-app.service
```
