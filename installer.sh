#!/bin/bash

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "Updating package list..."
apt-get update

echo "Installing MySQL server..."
apt-get install -y mysql-server

echo "Starting MySQL service..."
systemctl start mysql

echo "Enabling MySQL service to start on boot..."
systemctl enable mysql

echo "Securing MySQL installation..."
mysql_secure_installation <<EOF

y
root_password
root_password
y
y
y
y
EOF

echo "MySQL installation and setup complete!"
