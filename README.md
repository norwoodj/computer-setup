# personal-computer-setup

```
cd /tmp
curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh
sudo sh -c "echo 'file_client: local' >> /etc/salt/minion"
sudo systemctl restart salt-minion
```

Then coming back to this directory:
```
sudo ln -s $(pwd)/states /srv/salt
sudo ln -s $(pwd)/pillar /srv/pillar
```

Then to run:
```
salt-call --local state.apply
```
