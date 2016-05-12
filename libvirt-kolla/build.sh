#!/bin/bash
rm -rf /vagrant/kolla/docker/gnocchi
time sudo /vagrant/kolla/tools/build.py -t source -b ubuntu -i /vagrant/header -I /vagrant/footer --registry 192.168.1.49:4000
