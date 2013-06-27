#!/bin/sh

set -x

### setuptools install ###

# for python 2.4
SETUPTOOLS_SRC=https://pypi.python.org/packages/2.4/s/setuptools/setuptools-0.6c11-py2.4.egg#md5=bd639f9b0eac4c42497034dec2ec0c2b

# for python 2.7
#SETUPTOOLS_SRC=https://pypi.python.org/packages/2.7/s/setuptools/setuptools-0.6c11-py2.7.egg#md5=fe1f997bc722265116870bc7919059ea
wget --no-check-certificate ${SETUPTOOLS_SRC}
SETUPTOOLS_EGG=$(find -maxdepth 1 -name 'setuptools*.egg' -type f)
sh ${SETUPTOOLS_EGG}
rm ${SETUPTOOLS_EGG}

# pip install
PIP_SRC=https://pypi.python.org/packages/source/p/pip/pip-1.3.1.tar.gz#md5=cbb27a191cebc58997c4da8513863153
PIP_TARBALL=$(mktemp)
WORK_DIR=$(mktemp -d)
wget --no-check-certificate -qO ${PIP_TARBALL} ${PIP_SRC}
tar zxvf ${PIP_TARBALL} -C ${WORK_DIR}
cd ${WORK_DIR}
PIP_DIR=$(find -maxdepth 1 -iname 'pip-*' -type d)
cd ${PIP_DIR}
python setup.py install
