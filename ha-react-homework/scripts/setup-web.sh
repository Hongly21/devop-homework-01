#!/bin/bash
# Install dependencies and prepare React application environment
set -e
if [ "$EUID" -ne 0 ]; then
  echo "Error: Please run as root (use sudo)"
  exit 1
fi
echo "Installing Node.js and dependencies..."
apt-get update -y && apt-get install -y nodejs npm
echo "Setup complete."
exit 0