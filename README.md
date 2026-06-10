# Simply IP Services - Releases

Software packages for supported edge devices and servers.

---

## Overview

This repository provides access to software published by Simply IP Services for deployment on supported edge devices and servers.

Our applications are primarily designed to run on Debian-based Linux systems, including Raspberry Pi devices, and can be installed and updated using the standard APT package manager.

---

## Available Applications

### Site Gateway

The Site Gateway app provides a secure bridge between devices on your local network and our cloud services, enabling two-way communication without compromising security.

The app is used by a number of Simply IP Services solutions, including Gatekeeper, and enables our cloud-based applications to communicate with specific local devices such as cameras, controllers and sensors, which would otherwise be inaccessible from the internet.

Once installed, the gateway can be configured to connect to our services and will automatically receive updates through the Simply IP Services repository.

---

## Installation

To install any of our applications, first add the Simply IP Services repository to your device.

### Quick Install

```bash
curl -fsSL https://releases.simplyip.services/debian/install.sh | sudo bash
```

### Manual Installation

```bash
sudo apt update
sudo apt install -y ca-certificates curl gnupg

curl -fsSL https://releases.simplyip.services/debian/repo.asc \
  | sudo gpg --dearmor -o /usr/share/keyrings/sips.gpg

echo "deb [signed-by=/usr/share/keyrings/sips.gpg] https://releases.simplyip.services/debian stable main" \
  | sudo tee /etc/apt/sources.list.d/sips.list

sudo apt update
```

---

## Installing an Application

Once the repository has been added, you can install individual applications using APT.

```bash
sudo apt install sips-site-gateway
```

---

## Checking the Installed Version

```bash
dpkg -l | grep sips-site-gateway
```

---

## Updating an Application

```bash
sudo apt update
sudo apt install sips-site-gateway
```

If an update has recently been published and is not yet appearing, clear the local package cache and refresh the package lists:

```bash
sudo apt clean
sudo apt update
```

---

© Simply IP Services
