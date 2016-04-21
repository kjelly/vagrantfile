#!/bin/bash
sudo yum install -y fish
sudo -u vagrant cat > /home/vagrant/sync/auto_config/site.yml <<EOL

- name: install
  remote_user: "{{ ansible_user }}"
  hosts: "{{ group }}"
  vars:
      programming: false

  roles:
      - bash-it
      - vim
      - fish
      - byobu
EOL

bash /home/vagrant/sync/auto_config/install-yum-dependency.sh
su vagrant -c ' python /home/vagrant/sync/auto_config/run.py -i /home/vagrant/sync/auto_config/hosts -p /home/vagrant/sync/auto_config/site.yml -a deploy '
su vagrant -c ' python /home/vagrant/sync/auto_config/run.py -i /home/vagrant/sync/auto_config/hosts -p /home/vagrant/sync/auto_config/site.yml -a config'

