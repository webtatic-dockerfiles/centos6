FROM centos:centos6
MAINTAINER "Andy Thompson" <andy@webtatic.com>
ENV container docker

# Update all base packages to keep them fresh, downgrading libselinux to remove
# centosplus repository dependency
RUN yum -y downgrade libselinux libselinux-utils; yum -y update; yum clean all

# Install initscripts, but turn off all services by default
RUN yum -y install initscripts; yum clean all; rm /etc/rc.d/rc*.d/*

# Disable ttys
RUN mv /etc/init/serial.conf /etc/init/serial.conf.disabled; \
mv /etc/init/tty.conf /etc/init/tty.conf.disabled; \
mv /etc/init/start-ttys.conf /etc/init/start-ttys.conf.disabled

# Set the init command to run at boot by default
CMD ["/sbin/init"]
