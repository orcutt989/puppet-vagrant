#!/bin/bash

# Connect to VPN
osascript -e "tell application \"Tunnelblick\"" -e "connect \"puppet_corporate_vpn\"" -e "end tell" || $echo \
"VPN Connection failed, check to see you have bot the Tunnelblick VPN Client and the puppet_corporate_vpn profile installed"


# If no release number variable then...

# Get internal release numbers as an array
PE_RELEASES=($(curl -s vag | grep -o '[0-9]\{4\}.[0-9].[[0-9]' | sort -r  --unique))

# Latest version
LATEST=${PE_RELEASES[0]}

# List releases
NUM=1
for RELEASE in "${PE_RELEASES[@]}"
do
    echo -e "[$NUM]: $RELEASE" 
    ((NUM++))
done

# Ask user what version they want
while true; do
    echo -n "What version of Puppet Enterprise would you like? [$LATEST]: "
    read CHOICE
    CHOICE=${CHOICE:-1}
    INDEX=CHOICE-1
    echo "You chose: [$CHOICE]: ${PE_RELEASES[$INDEX]}"
    if [[ -z ${PE_RELEASES[$CHOICE]} ]]
    then 
        echo "You entered an invalid choice. Please enter a number between 1 and ${#PE_RELEASES[@]}"
        continue
    else
        break
    fi
done

# Based on variable or text input curl to release
# i.e. http://enterprise.delivery.puppetlabs.net/archives/releases/2016.4.0/puppet-enterprise-2016.4.0-el-7-x86_64.tar.gz
echo "******************************************"
echo "* Downloading Puppet Enterprise ${PE_RELEASES[$INDEX]} *"
echo "******************************************"

curl -o pe-${PE_RELEASES[$INDEX]}.tar.gz "http://enterprise.delivery.puppetlabs.net/archives/releases/${PE_RELEASES[$INDEX]}/puppet-enterprise-${PE_RELEASES[$INDEX]}-el-7-x86_64.tar.gz"
tar -xzf pe-${PE_RELEASES[$INDEX]}.tar.gz

echo "******************************************"
echo "* Vagrant starting PE Server ${PE_RELEASES[$INDEX]}  *"
echo "******************************************"

vagrant up
