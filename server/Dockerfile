FROM webtatic/centos6:base
MAINTAINER "Andy Thompson" <andy@webtatic.com>

# Set up standard server packages
RUN yum -y --setopt='group_package_types=mandatory' install @core \
  authconfig file openssh-clients postfix tar which; \
yum clean all;