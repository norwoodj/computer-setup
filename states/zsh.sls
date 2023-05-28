{% set username = pillar["user"]["username"] %}

zsh:
  pkg.installed: []

install-oh-my-zsh:
  cmd.run:
    - name: sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    - creates: /home/{{ username }}/.oh-my-zsh
    - runas: {{ username }}
    - env:
      - HOME: /home/{{ username }}

/home/{{ username }}/.zshrc:
  file.managed:
    - source:
      - "salt://files/zshrc"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"

{{ username }}:
  user.present:
    - remove_groups: false    
    - shell: /usr/bin/zsh
