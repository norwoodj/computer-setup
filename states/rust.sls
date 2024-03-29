{% set username = pillar.user.username %}

install-rust:
  cmd.run:
    - name: |
        curl --proto "=https" --tlsv1.3 https://sh.rustup.rs -sSfo /tmp/rustup.sh
        chmod +x /tmp/rustup.sh
        /tmp/rustup.sh -y
    - creates: /home/{{ username }}/.cargo
    - runas: {{ username }}
