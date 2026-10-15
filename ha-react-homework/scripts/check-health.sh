#!/bin/bash
# Check both backend servers and print their health status
SERVERS=("192.168.56.20" "192.168.56.21")
for IP in "${SERVERS[@]}"; do
  STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$IP:3000/health)
  if [ "$STATUS" -eq 200 ]; then
    echo "Server $IP: HEALTHY"
  else
    echo "Server $IP: UNHEALTHY (HTTP $STATUS)"
  fi
done
exit 0