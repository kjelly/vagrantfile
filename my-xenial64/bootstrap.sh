sudo cat > /etc/apt/sources.list <<EOL
deb http://mirror01.idc.hinet.net/ubuntu/ xenial main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial main restricted

deb http://mirror01.idc.hinet.net/ubuntu/ xenial-updates main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-updates main restricted

deb http://mirror01.idc.hinet.net/ubuntu/ xenial universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial universe
deb http://mirror01.idc.hinet.net/ubuntu/ xenial-updates universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-updates universe

deb http://mirror01.idc.hinet.net/ubuntu/ xenial multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial multiverse
deb http://mirror01.idc.hinet.net/ubuntu/ xenial-updates multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-updates multiverse

deb http://mirror01.idc.hinet.net/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-backports main restricted universe multiverse

deb http://mirror01.idc.hinet.net/ubuntu/ xenial-security main restricted
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-security main restricted
deb http://mirror01.idc.hinet.net/ubuntu/ xenial-security universe
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-security universe
deb http://mirror01.idc.hinet.net/ubuntu/ xenial-security multiverse
deb-src http://mirror01.idc.hinet.net/ubuntu/ xenial-security multiverse

deb https://apt.dockerproject.org/repo ubuntu-xenial main

EOL

sudo apt-get update
sudo apt-get install -y curl git python-dev python-setuptools curl
su vagrant
git clone https://github.com/kjelly/auto_config /home/vagrant/auto_config
cat > /home/vagrant/auto_config/site.yml <<EOL
- name: install
  remote_user: "{{ ansible_user }}"
  hosts: "{{ group }}"
  vars:
    programming: false

  roles:
      - zsh
      - vim
      - fish
EOL

sudo cat > /etc/pip.conf <<EOL
[global]
# /etc/pip.conf
EOL
sudo bash /home/vagrant/auto_config/install-deb-dependency.sh
sudo pip install ansible
echo 'start ansible playbook'
python /home/vagrant/auto_config/run.py -i /home/vagrant/auto_config/hosts -p /home/vagrant/auto_config/site.yml -a deploy
echo 'end ansible playbook'
