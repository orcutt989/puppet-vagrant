#!/bin/bash

# Connect to VPN
if osascript -e "tell application \"Tunnelblick\"" -e "connect \"puppet_corporate_vpn\"" -e "end tell";
then echo "worked!";
fi

# If no release number variable then...

# Get internal release numbers
curl -s http://enterprise.delivery.puppetlabs.net/archives/releases/ | grep -o '[0-9]\{4\}.[0-9].[[0-9]' | sort -r  --unique

# Ask user what version of PE they want or get from a variable or default to latest

# Based on variable or text input curl to release
# i.e. http://enterprise.delivery.puppetlabs.net/archives/releases/2019.1.0/puppet-enterprise-2019.1.0-el-7-x86_64.tar


