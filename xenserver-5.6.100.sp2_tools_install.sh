#!/bin/sh

yum --enablerepo=base install -y gcc make automake autoconf vim* \
                                 zlib zlib-devel \
                                 curl curl-devel \
                                 openssl-devel perl cpio expat-devel gettext-devel mlocate

# install EPEL package
rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm

yum --enablerepo=epel install -y htop
