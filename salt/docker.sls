docker:
  pkgrepo.managed:
    - name: deb [signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu {{ grains.oscodename }} stable
    - humanname: docker
    - key_url: https://download.docker.com/linux/ubuntu/gpg
    - aptkey: false
    - file: /etc/apt/sources.list.d/docker.list
    - require_in:
      - pkg: docker
    - gpgcheck: 1

  pkg.installed:
    - pkgs:
        - containerd.io
        - docker-buildx-plugin
        - docker-ce
        - docker-ce-cli
        - docker-compose-plugin
