#!/usr/bin/env bash
# SOURCE: https://eligiblestore.com/blog/2017/05/02/how-to-install-mosh-on-centos/
# SOURCE: https://gist.github.com/pythoninthegrass/f7f880f38c4d50d98c540231290ecf8f

# ensure running as root
if [[ "$(id -u)" != "0" ]]; then
  exec sudo "$0" "$@"
fi

# install mosh
yum install -y epel-release
yum install -y mosh

# add firewall rules
firewall-cmd --zone=public --permanent --add-port=60000-61000/udp
firewall-cmd --reload