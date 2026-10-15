
Infrastructure deployed with Vagrant, HAProxy, Keepalived, and Systemd.

## 1. Directory Structure

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
    │   ├── package.json
    │   └── src/
    ├── scripts/
    │   ├── check-health.sh
    │   ├── deploy-react.sh
    │   ├── server-report.sh
    │   ├── service-manager.sh
    │   └── setup-web.sh
    ├── screenshots/
    └── systemd/
        └── react-app.service



2. Infrastructure Information

This environment consists of 4 Ubuntu 24.04 virtual machines connected via a VirtualBox private network:

- lb-01 (Master): 192.168.56.10 (HAProxy + Keepalived)

- lb-02 (Backup): 192.168.56.11 (HAProxy + Keepalived)

- web-01 (Backend): 192.168.56.20 (React + Systemd, Port 3000)

- web-02 (Backend): 192.168.56.21 (React + Systemd, Port 3000)

- Virtual IP (VIP): 192.168.56.100

3. Installation Instructions

Ensure VirtualBox and Vagrant are installed on your host machine.

- Clone this repository and navigate to the ha-react-homework directory.

- Run vagrant up to automatically provision and configure all 4 virtual machines.

- Once provisioned, access the application at http://192.168.56.100.

4. Configuration Explanations

- Systemd: The Vite/React application is managed as a background service (react-app.service) configured to automatically restart on failure and launch on system boot.

- HAProxy Load Balancing: Configured to bind on port 80 and distribute incoming HTTP requests to web-01 and web-02 using the Round Robin algorithm. Layer 7 health checks (GET /health) ensure traffic is only routed to healthy nodes.

- Keepalived High Availability: Configured using VRRP to manage the floating Virtual IP (192.168.56.100). lb-01 acts as the MASTER with a higher priority. A tracking script continuously monitors the HAProxy process; if HAProxy crashes, the VIP is automatically failed over to lb-02.

5. Testing Results

All failure simulation tests were completed successfully:

- Stopped React on web-01; traffic routed smoothly to web-02.

- Restarted web-01; it successfully rejoined the HAProxy pool.

- Stopped HAProxy on lb-01; Keepalived immediately transferred the VIP to lb-02.

- Powered off lb-01 completely; website remained accessible via VIP.

- Powered on lb-01; failback occurred and lb-01 reclaimed the VIP.

- Rebooted web-02; systemd automatically brought the React app back online.