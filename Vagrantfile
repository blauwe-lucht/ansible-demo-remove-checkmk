# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|

  config.vm.define "win2016" do |win2016|
    win2016.vm.box = "gusztavvargadr/windows-server"
	win2016.vm.box_version = "1607.0.2201"
	win2016.vm.hostname = "win2016"
	win2016.vm.network "private_network", ip: "192.168.14.35"
	win2016.vm.communicator = "winrm"
	win2016.winrm.username = "vagrant"
	win2016.winrm.password = "vagrant"
	win2016.vm.provider "virtualbox" do |vb|
	  vb.memory = 2048
	  vb.cpus = 2
	end
  end

  config.vm.define "win2019" do |win2019|
    win2019.vm.box = "gusztavvargadr/windows-server"
	win2019.vm.box_version = "1809.0.2201"
	win2019.vm.hostname = "win2019"
	win2019.vm.network "private_network", ip: "192.168.14.36"
	win2019.vm.communicator = "winrm"
	win2019.winrm.username = "vagrant"
	win2019.winrm.password = "vagrant"
	win2019.vm.provider "virtualbox" do |vb|
	  vb.memory = 2048
	  vb.cpus = 2
	end
  end

  config.vm.define "win2022" do |win2022|
    win2022.vm.box = "gusztavvargadr/windows-server"
	win2022.vm.box_version = "2102.0.2201"
	win2022.vm.hostname = "win2022"
	win2022.vm.network "private_network", ip: "192.168.14.37"
	win2022.vm.communicator = "winrm"
	win2022.winrm.username = "vagrant"
	win2022.winrm.password = "vagrant"
	win2022.vm.provider "virtualbox" do |vb|
	  vb.memory = 2048
	  vb.cpus = 2
	end
  end

  config.vm.define "lnx01" do |lnx01|
    lnx01.vm.box = "boxomatic/debian-10"
	lnx01.vm.hostname = "lnx01"
	lnx01.vm.network "private_network", ip: "192.168.14.38"
	lnx01.vm.provider "virtualbox" do |vb|
	  vb.memory = 2048
	  vb.cpus = 2
	end
  end

end
