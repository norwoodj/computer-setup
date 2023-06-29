#!/usr/bin/env bash
set -o errexit; set -o nounset; set -o pipefail

if ! hash salt-minion; then
	curl -L https://bootstrap.saltstack.com | sudo sh
	sh -c "echo 'file_client: local' >> /etc/salt/minion"
fi

if ! systemctl is-enabled salt-minion; then
	systemctl enable salt-minion
	systemctl start salt-minion
fi

ln -svf $(pwd)/states /srv/salt
ln -svf $(pwd)/pillar /srv/pillar
ln -svf $(pwd)/files /srv/salt/files
