# -*- mode: ruby -*-
# vi: set ft=ruby :

$script_awx = <<-SCRIPT
set -euo pipefail

export DEBIAN_FRONTEND=noninteractive
echo "Updating apt info..."
apt-get update
echo "Upgrading apt packages..."
apt-get upgrade -y

echo "Installing k3s..."
curl -sfL https://get.k3s.io | sh -

echo "Waiting for k3s to be ready..."
sleep 60
#TODO: turn the sleep into a loop so we continue as soon as all pods are ready

echo "Installing Kustomize..."
curl -s "https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh"  | bash

cd /vagrant

echo "Installing AWX manifests..."
/home/vagrant/kustomize build . | kubectl apply -f -

echo "Waiting for awx-operator to be ready..."
sleep 60
#TODO: turn the sleep into a loop so we continue as soon as the operator is ready

echo "Installing AWX..."
kubectl apply -f /vagrant/awx-demo.yaml

echo "The installation has started, but it will take a while to finish."
echo "After"
echo "  vagrant ssh awx"
echo "use the command:"
echo "  kubectl get pods -n awx -w"
echo "to monitor the progress."
echo ""
echo "Use:"
echo "  kubectl describe <pod>"
echo "to analyse in case of issues."
echo ""
echo "When everything finishes successfully, you can browse to:"
echo "http://192.168.14.39:30080"
echo "The user name is 'admin', the password can be retrieved using:"
echo "  kubectl get secret awx-demo-admin-password -o jsonpath=\"{.data.password}\" -n awx | base64 --decode"

SCRIPT

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
	  vb.cpus = 1
	end
  end

  config.vm.define "awx" do |awx|
    awx.vm.box = "geerlingguy/ubuntu2004"
	awx.vm.hostname = "awx"
	awx.vm.network "private_network", ip: "192.168.14.39"
	awx.vm.provider "virtualbox" do |vb|
	  vb.memory = 6144
	  vb.cpus = 3
	end
	awx.vm.provision "shell", inline: $script_awx
  end

end
