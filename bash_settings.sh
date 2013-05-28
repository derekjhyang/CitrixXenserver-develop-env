#!/bin/sh

set -x

VIM_CFG=https://github.com/hswayne77/vim-config/zipball/master/
BASHRC_CFG=https://github.com/hswayne77/bash-config/zipball/master/
VIM_ZIPBALL=$(mktemp)
BASHRC_ZIPBALL=$(mktemp)
WORK_DIR=$(mktemp -d)
wget -qO ${VIM_ZIPBALL} ${VIM_CFG}
wget -qO ${BASHRC_ZIPBALL} ${BASHRC_CFG}
unzip ${VIM_ZIPBALL} -d ${WORK_DIR}
unzip ${BASHRC_ZIPBALL} -d ${WORK_DIR}

cd ${WORK_DIR}
VIM_DIR=$(find -maxdepth 1 -iname '*vim*' -type d)
BASHRC_DIR=$(find -maxdepth 1 -iname '*bash*' -type d)
chmod +x ${VIM_DIR}/*.sh
chmod +x ${BASHRC_DIR}/*.sh
cd ${VIM_DIR}
./install.sh

cd ${WORK_DIR}
cd ${BASHRC_DIR}
./install.sh


