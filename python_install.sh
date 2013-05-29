#!/bin/sh

set -x

sh xenserver-5.6.100.sp2_tools_install.sh

PYTHON_SRC=http://www.python.org/ftp/python/2.7.5/Python-2.7.5.tgz
PYTHON_TARBALL=$(mktemp)
WORK_DIR=$(mktemp -d)
wget --no-check-certificate -qO ${PYTHON_TARBALL} ${PYTHON_SRC}
tar zxvf ${PYTHON_TARBALL} -C ${WORK_DIR}

cd ${WORK_DIR}
PYTHON_DIR=$(find -maxdepth 1 -iname 'Python-*' -type d)
cd ${PYTHON_DIR}
# [FIXME, winnie]
# because configure command default install path as '/usr/local',
# so we adjust to '/usr', but we encounter a problem:
# xenapi is developed by  python2.4
#./configure --prefix=/usr
./configure
make && make install

# fix yum's python path
#sh python_upgrade_yum_fix.sh

echo "Complete! Ready to reboot, then you can install python-tools to develop your projects :)"
reboot
