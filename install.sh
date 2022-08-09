#!/usr/bin/bash

# Install packages
sudo dnf groupinstall "Development Tools" -y
sudo dnf install zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel xz xz-devel libffi-devel findutils -y