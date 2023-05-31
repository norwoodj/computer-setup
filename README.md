# computer-setup

This repo houses [salt](https://github.com/saltstack/salt) configuration for
configuring the software development environment on my computers. This has
only been tested on linux.

You will need to install `git` and `curl` manually before using this repo.

To bootstrap the salt-masterless setup and symlink the files here where
they need to be to run the salt states contained here, run the `bootstrap.sh`
script.

Then to run:
```
salt-call --local state.apply
```
