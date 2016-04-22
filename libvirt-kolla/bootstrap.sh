export LC_ALL=C
cd /vagrant/kolla
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list
sudo apt-get update
sudo apt-get install -y --force-yes python-setuptools git docker-engine
sudo easy_install pip
python setup.py install
pip install -r requirements.txt
pip install ansible==1.9.2
pip install tox
