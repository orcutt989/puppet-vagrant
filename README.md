# puppet-vagrant
Vagrant boxes to get Puppet products up and running.

This only works if you have access to the Puppet internal network via the Tunnelblick VPN client.

# You'll need -
1. Vagrant https://releases.hashicorp.com/vagrant/2.2.4/vagrant_2.2.4_x86_64.dmg
2. Puppet configured Tunnelblick and puppet_corporate_vpn profile

# How-to

1. Clone this repo
1. `cd puppet-vagrant`

### pe-server

1. `cd pe-server`
2. `./provision.sh`
3. Click OK when the Gatekeeper prompt appears.

![Gatekeeper](Gatekeeper.png)

3. `vagrant up`

### puppet-agent
1. `vagrant up`
