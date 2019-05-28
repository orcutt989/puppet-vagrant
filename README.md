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
4. Pick a version of PE by number [1],[2], etc.
```
[1]: 2019.1.0
[2]: 2019.0.3
[3]: 2019.0.2
[4]: 2019.0.1
[5]: 2019.0.0
[6]: 2018.1.8
[7]: 2018.1.7
[8]: 2018.1.5
[9]: 2018.1.4
[10]: 2018.1.3
[11]: 2018.1.2
[12]: 2018.1.1
[13]: 2018.1.0
[14]: 2017.3.9
[15]: 2017.3.8
[16]: 2017.3.7
[17]: 2017.3.6
[18]: 2017.3.5
[19]: 2017.3.4
[20]: 2017.3.3
[21]: 2017.3.2
[22]: 2017.3.1
[23]: 2017.3.0
[24]: 2017.2.5
[25]: 2017.2.4
[26]: 2017.2.3
[27]: 2017.2.2
[28]: 2017.2.1
[29]: 2017.2.0
[30]: 2017.1.1
[31]: 2017.1.0
[32]: 2016.5.2
[33]: 2016.5.1
[34]: 2016.4.9
[35]: 2016.4.8
[36]: 2016.4.7
[37]: 2016.4.6
[38]: 2016.4.5
[39]: 2016.4.4
[40]: 2016.4.3
[41]: 2016.4.2
[42]: 2016.4.1
[43]: 2016.4.0
What version of Puppet Enterprise would you like? [2019.1.0]:```

3. `vagrant ssh`

### puppet-agent
Starts up a Centos 7 box with the Puppet 6 Agent only. This is done with only a Vagrantfile at this time.

#### How to use
1. `vagrant up`
