#!/bin/bash
# Start, stop, restart, or check the React service
ACTION=$1
if [[ ! "$ACTION" =~ ^(start|stop|restart|status)$ ]]; then
  echo "Usage: $0 {start|stop|restart|status}"
  exit 1
fi
systemctl $ACTION react-app
exit $?