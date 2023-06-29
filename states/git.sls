{% set username = pillar["user"]["username"] %}

/home/{{ username }}/.gitconfig:
  file.managed:
    - source:
      - "salt://files/gitconfig"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"
    - template: jinja
    - defaults:
        username: {{ username }}
