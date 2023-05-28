#!/usr/bin/env bash
set -o errexit; set -o nounset; set -o pipefail

curl -L https://bootstrap.saltstack.com | sudo sh
sudo sh -c "echo 'file_client: local' >> /etc/salt/minion"
sudo systemctl restart salt-minion

sudo ln -s $(pwd)/states /srv/salt
sudo ln -s $(pwd)/pillar /srv/pillar
sudo ln -s $(pwd)/files /srv/salt/files
