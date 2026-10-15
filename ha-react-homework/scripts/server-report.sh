#!/bin/bash
# Display hostname, IP address, uptime, RAM, CPU, and disk usage
echo "--- Server Report ---"
echo "Hostname: $(hostname)"
echo "IP Address: $(hostname -I | awk '{print $1}')"
echo "Uptime: $(uptime -p)"
echo "RAM Usage: $(free -h | awk '/^Mem:/ {print $3 "/" $2}')"
echo "CPU Load: $(uptime | awk -F'load average:' '{ print $2 }' | cut -d, -f1 | xargs)"
echo "Disk Usage: $(df -h / | awk 'NR==2 {print $5}')"
exit 0