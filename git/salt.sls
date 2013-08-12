{% if grains['os'] == 'Arch' %}
  {% set python = 'python2' %}
{% else %}
  {% set python = 'python' %}
{% endif %}

include:
  - git
  - python.salttesting
  - python.virtualenv
  - python.unittest2
  - python.mock
  - python.timelib

/testing:
  file.directory

https://github.com/saltstack/salt.git:
  git.latest:
    - rev: {{ pillar.get('git_commit', 'develop') }}
    - target: /testing
    - require:
      - file: /testing
      - pkg: git
      - pip: SaltTesting
      - pip: virtualenv
      - pip: unittest2
      - pip: mock
      - pip: timelib
