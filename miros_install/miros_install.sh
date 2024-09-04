sudo apt-get update
sudo apt-get install -y ca-certificates curl tmux git
sudo service xrdp stop
sudo apt-get install dbus-x11
sudo service xrdp start
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y ./docker-desktop-amd64.deb ./miros_1.0-1.deb
sudo gsettings set org.gnome.shell favorite-apps "$(gsettings get org.gnome.shell favorite-apps | sed s/.$//), 'miros.desktop']"
sudo groupadd docker 
sudo usermod -aG docker $USER
#newgrp docker
echo Please restart your pc to complete the installation
