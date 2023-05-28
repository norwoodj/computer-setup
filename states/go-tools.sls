{% set username = pillar["user"]["username"] %}

go-tools:
  cmd.run:
    - name: /usr/local/go/bin/go install github.com/monochromegane/the_platinum_searcher/cmd/pt@latest
    - runas: {{ username }}
    - creates: /home/{{ username }}/go/bin/pt
