# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'time'

Vagrant.configure("2") do |config|
  config.vm.box = "generic/alpine312"
  config.vm.hostname = "network-analyzer.local"
  config.vm.network "public_network"

  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "config", "/config", create: true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "smash64-dev network analyzer (" + Time.now.to_i.to_s + ")"
    vb.memory = 512
    vb.cpus = 1
    vb.gui = true
  end

  config.vm.provision "file", source: "provision", destination: "/tmp/"
  config.vm.provision "shell", path: "scripts/bootstrap.sh"
  config.vm.provision "shell", run: "always", inline: "rm /etc/localtime && ln -s " + getTimezone + " /etc/localtime"
end

def getTimezone
  # based on https://stackoverflow.com/a/46778032

  offset = ((Time.zone_offset(Time.now.zone) / 60) / 60)
  suffix = offset >= 0 ? "-#{offset.abs.to_s}" : "+#{offset.abs.to_s}"

  return '/usr/share/zoneinfo/Etc/GMT' + suffix
end
