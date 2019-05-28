#!/bin/bash

# Connect to VPN
osascript -e "tell application \"Tunnelblick\"" -e "connect \"puppet_corporate_vpn\"" -e "end tell" || $echo \
"VPN Connection failed, check to see you have bot the Tunnelblick VPN Client and the puppet_corporate_vpn profile installed"


# If no release number variable then...

# Get internal release numbers as an array
PE_RELEASES=($(curl -s http://enterprise.delivery.puppetlabs.net/archives/releases/ | grep -o '[0-9]\{4\}.[0-9].[[0-9]' | sort -r  --unique))

# Latest version
LATEST=${PE_RELEASES[0]}

# Ask user what version they want
while true; do
    NUM=1
    for RELEASE in "${PE_RELEASES[@]}"
    do
        echo -e "[$NUM]: $RELEASE" 
        ((NUM++))
    done
    echo -n "What version of Puppet Enterprise would you like? [$LATEST]: "
    read CHOICE
    CHOICE=${CHOICE:-1}
    INDEX=CHOICE-1
    echo "You chose: [$CHOICE]: ${PE_RELEASES[$INDEX]}"
    [[ -z ${PE_RELEASES[$CHOICE]} ]] && echo "Release does not exist, try again."
    break
done

# Based on variable or text input curl to release
# i.e. http://enterprise.delivery.puppetlabs.net/archives/releases/2019.1.0/puppet-enterprise-2019.1.0-el-7-x86_64.tar

