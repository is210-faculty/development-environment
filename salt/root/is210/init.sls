#!jinja|yaml

remove_ubuntu:
  user.absent:
    - name: ubuntu

vagrant_user:
  user.present:
    - name: vagrant
    - fullname: Vagrant User
    - shell: /bin/bash
    - uid: 1000
    - gid: 1000
    - groups:
      - adm
      - dialout
      - cdrom
      - floppy
      - sudo
      - audio
      - dip
      - video
      - plugdev
      - netdev

apt:
  pkg.uptodate: []

apt_pkgs:
  pkg.latest:
    - names:
      - apt-transport-https
      - build-essential
      - emacs
      - git
      - htop
      - idle
      - libcurl3-gnutls
      - libxml2-dev
      - lubuntu-desktop
      - nano
      - python
      - python-dev
      - python-pip
      - tree
      - vim
      - virtualenvwrapper
    - require:
      - pkg: apt
      - user: vagrant_user

lightdm_autologin:
  file.managed:
    - name: /etc/lightdm/lightdm.conf.d/19-autologin.conf
    - source: salt://is210/files/lightdm_autologin.conf
    - require:
      - pkg: apt_pkgs

pip_packages:
  pip.installed:
    - requirements: salt://is210/files/pip_requirements.txt
    - require:
      - pkg: apt_pkgs
    - reload_modules: True

# docker_apt:
#   pkgrepo.managed:
#     - name: deb https://get.docker.com/ubuntu docker main
#     - file: /etc/apt/sources.list.d/docker.list
#     - keyserver: hkp://keyserver.ubuntu.com:80
#     - keyid: 36A1D7869245C8950F966E92D8576A8BA88D21E9
#     - require:
#       - pkg: apt_pkgs
#  pkg.latest:
#    - names:
#      - lxc-docker
#    - require:
#      - pkgrepo: docker_apt
#
#docker_running:
#  service.running:
#    - name: docker
#    - enable: True
#    - require:
#      - pkg: docker_apt
