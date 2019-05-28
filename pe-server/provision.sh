#!/bin/bash

# Connect to VPN
osascript -e "tell application \"Tunnelblick\"" -e "connect \"puppet_corporate_vpn\"" -e "end tell" || $echo \
"VPN Connection failed, check to see you have bot the Tunnelblick VPN Client and the puppet_corporate_vpn profile installed"


# If no release number variable then...

# Get internal release numbers as an array
PE_RELEASES=($(curl -s http://enterprise.delivery.puppetlabs.net/archives/releases/ | grep -o '[0-9]\{4\}.[0-9].[[0-9]' | sort -r  --unique))

# Ask user what version of PE they want or get from a variable or default to latest
LATEST={PE_RELEASES[0]}

while true; do
    echo
    read -p "What version of Puppet Enterprise would you like?: " -i LATEST -e answer
    echo "you answered: $answer"
    [[ -z ${PE_RELEASES[0]} ]] && echo "Release choice does not exist"
    break
done

# Based on variable or text input curl to release
# i.e. http://enterprise.delivery.puppetlabs.net/archives/releases/2019.1.0/puppet-enterprise-2019.1.0-el-7-x86_64.tar

