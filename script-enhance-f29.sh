#https://www.dedoimedo.com/computers/fedora-ultimate-customization-guide.html
#https://opensource.com/article/17/8/customize-linux
# https://itsfoss.com/best-gnome-extensions/
#Install script for enhance fedora
USUARIO=ricardo.carrillo
dnf update --refresh
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
# Enable SSH Service
systemctl start sshd
systemctl enable sshd

# Media Writer images called etcher-electron
wget https://bintray.com/resin-io/redhat/rpm -O /etc/yum.repos.d/bintray-resin-io-redhat.repo


### Install chrome
#https://www.if-not-true-then-false.com/2010/install-google-chrome-with-yum-on-fedora-red-hat-rhel/
dnf install -y fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome
dnf install -y google-chrome-stable

### Adobe Repository 64-bit x86_64 ## - it is necessary?
#https://www.if-not-true-then-false.com/2010/install-adobe-flash-player-10-on-fedora-centos-red-hat-rhel/
#rpm -ivh http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm
#rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux
#dnf install -y flash-plugin alsa-plugins-pulseaudio libcurl

### VirtualBox Fedora 28/27/26 users
cd /etc/yum.repos.d/
wget http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo
dnf install -y https://kojipkgs.fedoraproject.org//packages/compat-libvpx4/1.6.1/1.fc28/x86_64/compat-libvpx4-1.6.1-1.fc28.x86_64.rpm
dnf install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms qt5-qtx11extras libxkbcommon
dnf install -y http://download.virtualbox.org/virtualbox/rpm/fedora/26/x86_64/VirtualBox-5.2-5.2.22_126460_fedora26-1.x86_64.rpm
/usr/lib/virtualbox/vboxdrv.sh setup
usermod -a -G vboxusers $USUARIO


#music players,codecs & video
dnf config-manager --add-repo=http://negativo17.org/repos/fedora-spotify.repo
dnf install -y quodlibet spotify-client vlc youtube-dl gnome-music smplayer smplayer-themes smtube soundconverter
dnf install -y gstreamer-plugins-base gstreamer1-plugins-base gstreamer-plugins-bad gstreamer-plugins-ugly gstreamer1-plugins-ugly gstreamer-plugins-good-extras gstreamer1-plugins-good gstreamer1-plugins-good-extras gstreamer1-plugins-bad-freeworld ffmpeg gstreamer-ffmpeg gstreamer1-libav

# Customization, graphics & Themes
dnf install -y gnome-tweak-tool
dnf install -y numix\*
dnf install -y gimp

# Install Java plugins
dnf install -y icedtea-web java-openjdk

# Communications
dnf install -y pidgin pidgin-sipe pidgin-logviewer
dnf install -y remmina-plugins-rdp remmina
# Bittorrent download
dnf install -y qbittorrent transmission
# Screenshots
dnf install -y flameshot shutter

## Utilities
dnf install -y lshw rsyslog lsscsi screen
dnf install -y hddtemp udisks2
dnf install -y mediawriter etcher-electron
dnf install -y terminator clusterssh
dnf install -y axel
systemctl restart rsyslog
systemctl enable  rsyslog
# Network monitor
dnf install -y iptraf nmap gnu-netcat

#Performance and monitoring
dnf install -y sysstat psacct htop glances
# Monitoreo de hardware (temperature fans,cpus and video cards)
# para powertop para calibrar la bateria
dnf install -y lm_sensors powertop
systemctl start powertop.service
systemctl enable powertop.service
#Tuned is a dynamic adaptive system-tuning daemon that tunes system settings dynamically depending on usage
#https://opensource.com/article/17/8/customize-linux
#dnf install -y tuned-gtk.noarch  tuned.noarch  tuned-utils.noarch
#systemctl enable tuned
#systemctl start tuned

# Password manager
dnf install -y keepass
#Compression
dnf install -y unzip p7zip

#software control version
dnf install -y git

# Virtualization
dnf group -y install --with-optional virtualization
systemctl start libvirtd
systemctl enable libvirtd

### - revision #Vim customization
#https://robbinespu.github.io/eng/2018/05/17/My_Personal_Fedora28_setup.html
#cd /tmp/; git clone https://github.com/tomasr/molokai.git
#sudo dnf -y install vim vim-plugin-powerline
#cp molokai/colors/molokai.vim /usr/share/vim/vim81/colors/
#mkdir -pv ~/.vim/bundle
#cd ~/.vim/bundle
##git clone https://github.com/VundleVim/Vundle.vim.git
#git clone https://github.com/Valloric/YouCompleteMe.git
#dnf install -y automake gcc gcc-c++ kernel-devel cmake python-devel
#cd ~/.vim/bundle/YouCompleteMe
#git submodule update --init --recursive
#/usr/bin/python ./install.py --clang-completer --go-completer --java-completer
#vim +PluginInstall +qall
#sudo dnf -y install ncurses-compat-libs


#Activar extensiones gnome-extensions
#descargar extensiones para navegador (firefox gnome-extensions)
dnf install -y chrome-gnome-shell
#Extensiones recomendadas
#Dash to Dock ok
#System Monitor ok
#Appfolders Management extensions ok
#User Themes ok
#Media Player Indicator ok
#Refresh Wifi-Connections ok
#Screenshot Tool
#fenor
#Hide top bar
#Apt Update Indicator
#OpenWeather gnome extensions
#EasyScreenCast
#Battery Percentage
dnf install -y gnome-shell-extension-dash-to-dock.noarch
dnf install -y gnome-shell-extension-screenshot-window-sizer.noarch
dnf install -y gnome-shell-extension-media-player-indicator.noarch
dnf install -y gnome-shell-extension-refresh-wifi.noarch
dnf install -y gnome-shell-extension-apps-menu.noarch
dnf install -y gnome-shell-extension-user-theme.noarch
dnf install -y gnome-shell-extension-pidgin.noarch
dnf install -y gnome-shell-extension-places-menu.noarch
dnf install -y gnome-shell-extension-remove-bluetooth-icon.noarch
dnf install -y gnome-shell-extension-panel-osd.noarch
dnf install -y gnome-shell-extension-do-not-disturb-button.noarch
dnf install -y gnome-shell-extension-system-monitor-applet.noarch


#Investigar flathub|Flathub repositories
#https://dl.flathub.org/repo/flathub.flatpakrepo
# Herramienta como ccleaner - herramientas
# Stacer
#flatpak install flathub org.baedert.corebird
# Instalacion de fuentes
#sudo cp <Ubuntu fonts>.ttf /usr/share/fonts/
#fc-cache -v -f
