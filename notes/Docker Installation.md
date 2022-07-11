## Docker Installation

For the officially supported distributions (CentOS, Debian, Fedora, Raspbian and Ubuntu), it's possible to use the method below:
```
# DOES NOT WORK ON LINUX MINT
sudo apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker meleu

# on CentOS I also had to do this:
sudo systemctl start docker   # start dockerd
sudo systemctl status docker  # check if it's running fine
sudo systemctl enable docker  # make sure it starts at reboot
```

On Linux Mint I used the instructions in <https://docs.docker.com/get-docker/> and <https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository>. And don't forget to follow the [post-install instructions](https://docs.docker.com/engine/install/linux-postinstall/).

