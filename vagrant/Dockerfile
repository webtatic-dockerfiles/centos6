FROM webtatic/centos6:latest
MAINTAINER "Andy Thompson" <andy@webtatic.com>

# Set up and enable sshd server
RUN yum -y install openssh-server; yum clean all; \
chkconfig sshd on; \
echo "UseDNS no" >> /etc/ssh/sshd_config; \
echo "GSSAPIAuthentication no" >> /etc/ssh/sshd_config

# Set up tools used by standard in vagrant
RUN yum -y install wget nfs-utils which sudo; yum clean all

# Set up the vagrant user
RUN echo "NETWORKING=yes" > /etc/sysconfig/network; \
useradd vagrant; \
echo vagrant:vagrant | chpasswd; \
mkdir /home/vagrant/.ssh; \
wget --no-check-certificate \
    'https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub' \
    -O /home/vagrant/.ssh/authorized_keys; \
chown -R vagrant /home/vagrant/.ssh; \
chmod -R go-rwsx /home/vagrant/.ssh; \
echo "%vagrant ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/vagrant; \
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
