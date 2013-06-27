#!/bin/sh

###pip install -U pip
# the following pkg is for OpenStack support
pip install XenAPI
pip install sqlalchemy

# python version >= 2.7
pip install pbr


# XenAPIPlugin install
ZIPBALL=$(mktemp)
TMPDIR=$(mktemp -d)
XENAPIPLUGIN_REPO=https://github.com/hswayne77/XenAPIPlugin/archive/master.zip
wget -qO ${ZIPBALL} ${XENAPIPLUGIN_REPO}
unzip ${ZIPBALL} -d ${TMPDIR}
python ${TMPDIR}/setup.py install
