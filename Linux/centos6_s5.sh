#!/bin/bash
yum -y install gcc automake make

yum -y install pam-devel openldap-devel cyrus-sasl-devel openssl-devel

wget http://sourceforge.net/projects/ss5/files/ss5/3.8.9-6/ss5-3.8.9-6.tar.gz
tar zxf ss5-3.8.9-6.tar.gz
cd ss5-3.8.9
./configure
make
make install

mv /usr/lib/ss5/mod_socks4.so /usr/lib/ss5/mod_socks4.so.bk

cat >/etc/opt/ss5/ss5.passwd <<EOF
surf yelang_s5.7761
EOF

chmod 755 /etc/init.d/ss5

chkconfig ss5 on