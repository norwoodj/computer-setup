{% set username = pillar["user"]["username"] %}
{% set lunarvim_branch = pillar["lunarvim"]["branch"] %}
{% set neovim_version = pillar["lunarvim"]["neovim_version"] %}

packages:
  pkg.installed:
    - pkgs:
        - fuse
        - libfuse2
        - xclip

neovim:
  cmd.run:
    - name: |
        curl -sL https://github.com/neovim/neovim/releases/download/v{{ neovim_version }}/nvim.appimage -o /usr/local/bin/nvim
        chmod +x /usr/local/bin/nvim
    - creates: /usr/local/bin/nvim

lunarvim:
  cmd.run:
    - name: |
        curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/{{ lunarvim_branch }}/utils/installer/install.sh -o /tmp/lunarvim.sh
        chmod +x /tmp/lunarvim.sh
        /tmp/lunarvim.sh -y
    - runas: {{ username }}
    - creates: /home/{{ username }}/.local/bin/lvim
    - env:
        - LV_BRANCH: {{ lunarvim_branch }}

/home/{{ username }}/.config/lvim/config.lua:
  file.managed:
    - source:
      - "salt://files/config.lua"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"
    - makedirs: true

/usr/local/bin/vim:
  file.symlink:
    - target: /home/{{ username }}/.local/bin/lvim
