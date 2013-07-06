#!/usr/bin/env bash

PY_VER=$(python -V)

# the following pkg is for OpenStack support
pip install XenAPI

if [ ${PY_VER}=='2.4.3' ]; then
    #pip install "sqlalchemy==0.7"
    yum --enablerepo=epel -y install python-sqlalchemy
else
    pip install sqlalchemy
fi

# python version >= 2.7
if [ ! ${PY_VER}=='2.4.3' ]; then
    pip install pbr
fi

# XenAPIPlugin install
ZIPBALL=$(mktemp)
TMPDIR=$(mktemp -d)
XENAPIPLUGIN_REPO=https://github.com/hswayne77/XenAPIPlugin/archive/master.zip
wget -qO ${ZIPBALL} ${XENAPIPLUGIN_REPO}
unzip ${ZIPBALL} -d ${TMPDIR}
python ${TMPDIR}/XenAPIPlugin-master/setup.py install
