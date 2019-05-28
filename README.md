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
Starts up a Centos 7 box with a fully functioning and reachable Puppet Enterprise Server of a version of your choice. This is done with a shell script and the Vagrant file at this time.

`provision.sh` will -

1. Connect you to the Puppet corporate network via VPN if Tunnelblick and the puppet-corporate_vpn profile are installed and configured.
2. Scrape http://enterprise.delivery.puppetlabs.net/archives/releases/ for all the versions of Puppet Enterprise that are currently availab.e.
3. Ask you which version you want, but default to the latest version.
4. Downloads and uzips the `tar.gz` of the release.
5. Runs a `vagrant up` and starts the provisioning of the box.

#### How to use

1. `cd pe-server`
2. `./provision.sh`
3. Click OK when the Gatekeeper prompt appears.

![Gatekeeper](Gatekeeper.png)
4. Wait a while

3. `vagrant ssh`

### puppet-agent
Starts up a Centos 7 box with the Puppet 6 Agent only. This is done with only a Vagrantfile at this time.

#### How to use
1. `vagrant up`
