#WIP

#Base
sudo apt-get install -y curl wget git emacs-nox build-essential cmake autojump
git clone https://github.com/rubenrua/Notes.git ~/Documents/Notes
git clone https://github.com/rubenrua/dotfiles.git ~/Documents/dotfiles

echo "#RUBENRUA conf" >> ~/.bashrc
echo ". ~/.bash_rubenrua" >> ~/.bashrc
ln ~/Documents/dotfiles/.bashrc ~/.bash_rubenrua

sudo ln -s ~/Documents/dotfiles/scripts/preview.sh /usr/local/bin/preview.sh


#Docker https://docs.docker.com/install/linux/docker-ce/ubuntu/
sudo apt-get install -f \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -f docker-ce docker-ce-cli containerd.io
sudo groupadd docker
sudo usermod -aG docker $USER
docker run hello-world

#Google Chrome
sudo tee /etc/apt/sources.list.d/google-chrome.list <<EOF
### THIS FILE IS AUTOMATICALLY CONFIGURED ###
# You may comment out this entry, but any other modifications may be lost.
deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
EOF
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
sudo apt-get install google-chrome-beta

#Mulimedia
sudo apt-get install -y ffmpeg vlc \
     libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
     gstreamer1.0-libav libgstrtspserver-1.0-dev gstreamer1.0-plugins-base-apps gstreamer1.0-alsa gstreamer1.0-pulseaudio \
     python python-pip python-setuptools python-dev python-pycurl python-bottle python-glade2 python-icalendar python-gi python-dbus python-simplejson python-ldap python-serial \
     gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-gst-plugins-base-1.0


#Rust
curl https://sh.rustup.rs -sSf | sh
echo "source $HOME/.cargo/env" >> ~/.bashrc
cargo install --force ripgrep bat exa skim

