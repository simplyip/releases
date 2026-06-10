#!/usr/bin/env bash

# Run with: curl -fsSL https://releases.simplyip.services/debian/install.sh | sudo bash

set -euo pipefail

REPO_URL="https://releases.simplyip.services/releases/debian"
KEY_URL="${REPO_URL}/repo.asc"
KEYRING_PATH="/usr/share/keyrings/simplyip.gpg"
SOURCE_LIST_PATH="/etc/apt/sources.list.d/simplyip.list"

if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root. Try:"
  echo "  curl -fsSL ${REPO_URL}/install.sh | sudo bash"
  exit 1
fi

if ! command -v apt-get >/dev/null 2>&1; then
  echo "This installer only supports Debian/Ubuntu systems with apt."
  exit 1
fi

echo "Installing prerequisites..."
apt-get update
apt-get install -y ca-certificates curl gnupg

echo "Installing Simply IP repository signing key..."
curl -fsSL "$KEY_URL" | gpg --dearmor -o "$KEYRING_PATH"

chmod 0644 "$KEYRING_PATH"

echo "Adding Simply IP apt repository..."
echo "deb [signed-by=${KEYRING_PATH}] ${REPO_URL} stable main" > "$SOURCE_LIST_PATH"

echo "Updating apt package index..."
apt-get update

echo
echo "Simply IP apt repository has been installed."
echo
echo "You can now install packages, for example:"
echo "  sudo apt install gatekeeper-gateway"