dotfiles
========
```
sudo apt update
sudo apt install -y --no-install-recommends apt-transport-https curl software-properties-common
sudo apt install -y --no-install-recommends linux-image-extra-$(uname -r) linux-image-extra-virtual
curl -fsSL 'https://sks-keyservers.net/pks/lookup?op=get&search=0xee6d536cf7dc86e2d7d56f59a178ac6c6238f52e' | sudo apt-key add -
sudo add-repository "deb https://packages.docker.com/1.13/apt/repo/ ubuntu-$(lsb_release -cs) main"
sudo apt update
sudo apt -y install docker-engine
sudo docker info
sudo usermod -a -G docker $USER
```
