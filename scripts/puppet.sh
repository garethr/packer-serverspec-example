#!/bin/bash

# Install language locale as without can 
# interfere with package installation
sudo apt-get install language-pack-en -y

# Install Ruby
sudo apt-get update
sudo apt-get install ruby1.9.1 -y

# Install puppet/facter
sudo gem install puppet facter --no-ri --no-rdoc
