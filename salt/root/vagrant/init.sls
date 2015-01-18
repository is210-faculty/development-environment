#!jinja|yaml

localhost-present:
  host.present:
    - ip: 127.0.1.1
    - names:
      - {{ salt['grains.get']('localhost') }}
      - {{ salt['grains.get']('fqdn') }}
