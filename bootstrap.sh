#!/usr/bin/env bash
set -o errexit; set -o nounset; set -o pipefail

# Install the salt-minion binary if it doesn't already exist
if ! hash salt-minion; then
	curl -L https://bootstrap.saltstack.com | sudo sh
fi

# In masterless mode we don't need the salt-minion service running
if ! systemctl is-enabled salt-minion; then
	systemctl disable salt-minion
fi

# Setup the salt-minion to run masterless
sed -i 's|#file_client: remote|file_client: local|g' /etc/salt/minion

# Symlink the state tree into place
ln -svf $(pwd)/states /srv/salt
ln -svf $(pwd)/pillar /srv/pillar
ln -svf $(pwd)/files /srv/salt/files
