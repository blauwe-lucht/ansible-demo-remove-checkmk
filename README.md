# Introduction
This repo is a demo of how to remove the CheckMK agent from multiple Windows and Linux servers.

# Prerequisites
- VirtualBox, version 6.1.28 was used while creating this repo,
- Vagrant, version 2.2.19 was used.
- Ansible installed on Ubuntu 20.04 in WSL, version 2.12.2.

# Setup
1. ```vagrant up```, this will create the VMs that will be used during the demo (you might have to run it multiple times since I ran into consistent but fixable errors on building lnx01)
1. ```vagrant ssh awx```
1. ```sudo su -```
1. ```kubectl get pods -n awx -w``` and wait until all five awx-demo pods are in the Running state.
1. ```kubectl get secret awx-demo-admin-password -o jsonpath="{.data.password}" -n awx | base64 --decode```, this will show the password needed to login AWX.
1. Browse to http://192.168.14.39:30080, login with user 'admin' and the password from the previous step.

# Running Ansible from the command line

Open WSL - Ubuntu 20.04.

For a simple ping to all Windows servers, run ```./win_ping.sh```. The vault password is 'Abcd1234!'.

Install checkmk on Linux:
```
ansible-playbook install-checkmk-lnx.yml --ask-vault-password
```

Install checkmk on Windows:
```
ansible-playbook install-checkmk-win.yml --ask-vault-password
```

Uninstall checkmk on Linux:
```
ansible-playbook uninstall-checkmk-lnx.yml --ask-vault-password
```

Uninstall checkmk on Windows:
```
ansible-playbook uninstall-checkmk-win.yml --ask-vault-password
```

# More information

Tower quickstart (Tower is the stable, supported variant of AWX): https://docs.ansible.com/ansible-tower/latest/html/quickstart/index.html
