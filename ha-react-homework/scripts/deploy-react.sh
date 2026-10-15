#!/bin/bash
# Build and deploy React.js application and restart systemd
set -e
APP_DIR="/home/reactuser/react-app"
echo "Deploying application in $APP_DIR..."
cd $APP_DIR
npm install
npm run build
systemctl restart react-app
echo "Deployment successful."
exit 0