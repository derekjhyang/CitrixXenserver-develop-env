#!/bin/sh

GIT_SRC=http://www.codemonkey.org.uk/projects/git-snapshots/git/git-latest.tar.gz
GIT_TARBALL=$(mktemp)
WORK_DIR=$(mktemp -d)
wget --no-check-certificate -qO ${GIT_TARBALL} ${GIT_SRC}
tar zxvf ${GIT_TARBALL} -C ${WORK_DIR}

cd ${WORK_DIR}
GIT_DIR=$(find -maxdepth 1 -iname 'git*' -type d)
cd ${GIT_DIR}

autoconf
./configure
make && make install


git --version


