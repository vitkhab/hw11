#!/bin/bash
set -e

# Install MongoDB
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org
systemctl start mongod
systemctl enable mongod

# Install Ruby and deploy
# VM instance executes startup scripts as root
su - appuser -c '
    cd /home/appuser
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
    curl -sSL https://get.rvm.io | bash -s stable
    source ~/.rvm/scripts/rvm
    rvm requirements
    rvm install 2.4.1
    rvm use 2.4.1 --default
    gem install bundler -V --no-ri --no-rdoc

    git clone https://github.com/Artemmkin/reddit.git
    cd reddit && bundle
    puma -d'
