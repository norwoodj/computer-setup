{% set username = pillar["user"]["username"] %}

install-oh-my-zsh:
  cmd.run:
    - name: sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    - creates: /home/{{ username }}/.oh-my-zsh
    - runas: {{ username }}
    - env:
      - HOME: /home/{{ username }}

{{ username }}:
  user.present:
    - shell: /usr/bin/zsh
