#!/bin/bash

# Update package lists
sudo apt update 
sudo apt-get upgrade -y

# Install necessary packages
sudo apt install wget unzip apache2 -y

# Download the wedding template
wget https://www.tooplate.com/zip-templates/2131_wedding_lite.zip

# Unzip the template
unzip -o 2131_wedding_lite.zip

# Copy the extracted files to Apache's document root
cp -r 2131_wedding_lite/* /var/www/html/

# Start and enable Apache2 service
sudo systemctl start apache2
sudo systemctl enable apache2