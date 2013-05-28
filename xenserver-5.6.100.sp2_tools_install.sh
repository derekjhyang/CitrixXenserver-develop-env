#!/bin/sh

yum --enablerepo=base install -y gcc make automake autoconf vim* \
                                 zlib zlib-devel \
                                 curl curl-devel \
                                 openssl-devel perl cpio expat-devel gettext-devel mlocate
