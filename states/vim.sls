{% set username = pillar["user"]["username"] %}
{% set lunarvim_branch = pillar["lunarvim"]["branch"] %}
{% set neovim_version = pillar["lunarvim"]["neovim_version"] %}

fuse:
  pkg.installed:
    - pkgs:
        - fuse
        - libfuse2

neovim:
  cmd.run:
    - name: |
        curl -sL https://github.com/neovim/neovim/releases/download/v{{ neovim_version }}/nvim.appimage -o /usr/local/bin/nvim
        chmod +x /usr/local/bin/nvim
    - creates: /usr/local/bin/nvim

tree-sitter:
  cmd.run:
    - name: npm install -g tree-sitter
    - creates: /usr/local/bin/tree-sitter

lunarvim:
  cmd.run:
    - name: |
        curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/{{ lunarvim_branch }}/utils/installer/install.sh -o /tmp/lunarvim.sh
        chmod +x /tmp/lunarvim.sh
        /tmp/lunarvim.sh -y
    - runas: {{ username }}
    - creates: /home/veintitres/.local/bin/lvim
    - env:
        - LV_BRANCH: {{ lunarvim_branch }}

/home/{{ username }}/.zshrc.d/lunarvim:
  file.managed:
    - source:
      - "salt://files/lunarvim"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"

/home/{{ username }}/.config/lvim/config.lua:
  file.managed:
    - source:
      - "salt://files/config.lua"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"

