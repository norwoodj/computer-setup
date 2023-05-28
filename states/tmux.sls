{% set username = pillar["user"]["username"] %}

tmux:
  pkg.installed: []

/home/{{ username }}/.tmux.conf:
  file.managed:
    - source:
      - 'salt://files/tmux.conf'
    - user: {{ username }}
    - group: {{ username }}
    - mode: '0644'

/home/{{ username }}/.tmux.conf.local:
  file.managed:
    - source:
      - 'salt://files/tmux.conf.local'
    - user: {{ username }}
    - group: {{ username }}
    - mode: '0644'
