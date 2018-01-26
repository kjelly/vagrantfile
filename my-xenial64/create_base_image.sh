#!/bin/bash
export dir=${PWD##*/}
rm -f package.box;vagrant package ;vagrant box add $dir package.box --force
