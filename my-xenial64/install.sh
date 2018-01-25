#! /bin/bash
source set-env.sh
rm package.box
sudo vagrant package
vagrant box add my-ubuntu1404-libvirt package.box --force
rm package.box
