{% set go_version = pillar["go"]["version"] %}
{% set username = pillar["user"]["username"] %}

install-go:
  cmd.run:
    - name: |
        curl -sL https://go.dev/dl/go{{ go_version }}.linux-amd64.tar.gz -o /tmp/go.tar.gz
        tar -C /usr/local -xzf /tmp/go.tar.gz
    - creates: /usr/local/go

/usr/bin/go:
  file.symlink:
    - target: /usr/local/go/bin/go
