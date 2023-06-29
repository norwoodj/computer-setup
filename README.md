# computer-setup

This repo houses [salt](https://github.com/saltstack/salt) configuration for
configuring the software development environment on my computers. This has
only been tested on linux.

You will need to install `git` and `curl` manually before using this repo.

To bootstrap the salt-masterless setup and symlink the files here where
they need to be to run the salt states contained here, run:
```
sudo ./bootstrap.sh
```

Then to apply all of the salt states:
```
sudo salt-call --local state.apply
```

Once you're done, if you want to clean up so that you can delete this repo
without leaving any symlinks around, and disable the salt-minion service,
run:
```
sudo ./teardown.sh
```
