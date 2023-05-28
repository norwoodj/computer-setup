{% set go_version = pillar["go"]["version"] %}
{% set username = pillar["user"]["username"] %}

install-go:
  cmd.run:
    - name: |
        curl -sL https://go.dev/dl/go{{ go_version }}.linux-amd64.tar.gz -o /tmp/go.tar.gz
        tar -C /usr/local -xzf /tmp/go.tar.gz
    - creates: /usr/local/go

/home/{{ username }}/.zshrc.d/go-path:
  file.managed:
    - source:
        - "salt://files/go-path"
    - user: {{ username }}
    - group: {{ username }}
    - mode: "0644"
    - makedirs: true
    - template: jinja
    - defaults:
        username: {{ username }}
