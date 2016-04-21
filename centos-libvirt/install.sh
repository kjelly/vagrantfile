#! /bin/bash
source set-env.sh
rm package.box
vagrant package
vagrant box add my-centos7-libvirt package.box --force
rm package.box
