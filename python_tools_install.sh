#!/bin/sh

set -x

SETUPTOOLS_SRC=https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea
PIP_SRC=https://pypi.python.org/packages/source/p/pip/pip-1.3.1.tar.gz#md5=cbb27a191cebc58997c4da8513863153
SETUPTOOLS_EGG=$(mktemp)
PIP_TARBALL=$(mktemp)
WORK_DIR=$(mktemp -d)
# setuptools install
wget --no-check-certificate -qO ${SETUPTOOLS_EGG} ${SETUPTOOLS_SRC}
sh ${SETUPTOOLS_EGG}

# pip install
wget --no-check-certificate -qO ${PIP_TARBALL} ${PIP_SRC}
tar zxvf ${PIP_TARBALL} -C ${WORK_DIR}
cd ${WORK_DIR}
PIP_DIR=$(find -maxdepth 1 -iname 'pip-*' -type d)
cd ${PIP_DIR}
python setup.py install
