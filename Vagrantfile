# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "squidtest"

  config.vm.box_check_update = true

  # config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "384"]
    vb.customize ["modifyvm", :id, "--cpus", "1"]
  end

  locale = <<-EOM
set -e
locale-gen ja_JP.UTF-8
  EOM

  squid = <<-EOM
set -e
http_poxy=#{ENV['http_proxy']} apt-get update
http_poxy=#{ENV['http_proxy']} apt-get install -y squid3
initctl stop squid3
sed -e 's;^start on runlevel;# start on runlevel;' \
    -e 's;^stop on runlevel;# stop on runlevel;' \
    -i.dist /etc/init/squid3.conf
rm -f /var/run/squid3.pid
  EOM

  config.vm.provision :shell, inline: locale+squid

end
