#!/usr/bin/expect -f

spawn /vagrant/puppet-discovery start
expect "Please enter the path to your Puppet Discovery license:"
send -- "/vagrant/License-puppet-discovery-trial-2019-06-28.puppet_discovery.json\r"
expect "*"
send -- "y\r"
expect "Please create an admin password:"
send -- "Pupp3t\r"
expect "Verify by entering the same password again:"
send -- "Pupp3t\r"
expect "Please create a viewer password:"
send -- "Pupp3t\r"
expect "Verify by entering the same password again:"
send -- "Pupp3t\r"
expect eof