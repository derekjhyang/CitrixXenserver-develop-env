#!/bin/sh


yum --enablerepo=base install -y gcc make automake autoconf vim*
yum --enablerepo=base install -y zlib zlib-devel
yum --enablerepo=base install -y curl curl-devel
yum --enablerepo=base install -y openssl-devel perl cpio expat-devel gettext-devel
