#!/bin/sh

set -x
YUM_PATH=$(whereis yum | awk '{print $2}')
sed -i '1s/python$/python2.4/' ${YUM_PATH}

