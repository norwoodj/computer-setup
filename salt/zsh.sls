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

/home/{{ username }}/.zshrc.d:
  file.recurse:
    - source:
        - "salt://files/zshrc.d"
    - user: {{ username }}
    - group: {{ username }}
    - file_mode: "0644"
    - makedirs: true
    - recurse:
        - user
        - group
        - file_mode

{{ username }}:
  user.present:
    - remove_groups: false    
    - shell: /usr/bin/zsh
