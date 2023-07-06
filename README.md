Here's what to do in order to setup a new linux machine.

sudo apt-get install git

git config --global user.name "Gilbert Jeiziner"
git config --global user.email "gilbert.jeiziner@gjn.ch"

sudo apt-get install ansible

cd .playbooks

ansible-playbook checkout_home.yml
sudo ansible-playbook installs.yml

Open nvim and execute :PlugInstall

dconf load / < .playbooks/files/dconf_full_dump.conf

Now, guake is ready to be used.

sudo ansible-playbook install-brave.yml

sudo ansible-playbook install-azure-data-remmina.yml

wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg

sudo ansible-playbook install-tfpackgopasssummon.yml


Import the key into gpp (your private and all needed publics for gopass)
gpg --import public.key
gpg --import private.key

gopass init

gopass clone https://gjn@github.com/geoadmin/infra-password-store-swipos infra-password-store-swipos --sync gitcli
gopass clone https://gjn@github.com/geoadmin/infra-password-store-swipos-dev infra-password-store-swipos-dev --sync gitcli


Now you're ready, Fredy.
