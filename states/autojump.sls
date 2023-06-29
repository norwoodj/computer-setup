{% set username = pillar["user"]["username"] %}

autojump:
  pkg.installed: []

/home/{{ username }}/.zshrc.d/autojump:
  file.managed:
    - source:
      - "salt://files/autojump"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"
    - makedirs: true
