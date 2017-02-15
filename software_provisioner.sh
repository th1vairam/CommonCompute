#!/bin/bash -x

# Provisioner for software

mkdir /home/centos/src/
cd /home/centos/src/

yum remove -y R-core R-core-devel R-java R-java-devel
yum update -y
yum install -y curl curl-devel libcurl libcurl-devel readline readline-devel readline-static

cd /home/centos/src

## Newer version of git from source
yum remove -y git
yum groupinstall -y "Development Tools"
yum install -y gettext-devel openssl-devel perl-CPAN perl-devel zlib-devel expat-devel
yum install -y gcc perl-ExtUtils-MakeMaker

wget https://github.com/git/git/archive/master.tar.gz
tar -xzf master.tar.gz
cd git-master
make configure
./configure --prefix=/usr/local --with-curl
make all && make install && make clean
