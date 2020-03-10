#!/bin/bash
onesider="/home/onesider"

echo "** apt setting!!"
add-apt-repository ppa:x4121/ripgrep -y

apt -y update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove

echo "** install app!!"
apt install -y git
apt install -y curl
apt install -y net-tools
apt install -y openssh-server
apt install -y zsh
apt install -y vim
apt install -y python
apt install -y python3 python3-pip
apt install -y zip
apt install -y unzip
apt install -y gcc
apt install -y gdb
apt install -y cscope
apt install -y ctags
apt install -y tig
apt install -y ripgrep
apt install -y jq
apt install -y neofetch
apt install -y gawk
apt install -y hexyl 
apt install -y speedtest-cli
apt install -y htop

(echo "Y")|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sed -i "s/auth       required   pam_shells.so/#auth       required   pam_shells.so/g" /etc/pam.d/chsh

echo "** set zsh !!"
chsh -s `which zsh`

#echo "** set vim !!"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

git clone https://github.com/tomasr/molokai.git
mv ./molokai/colors ~/.vim/colors
rm -rf ./molokai

mv .vimrc ~/.vimrc
mv .zshrc ~/.zshrc

#Util
#64bit
wget https://github.com/knqyf263/pet/releases/download/v0.3.6/pet_0.3.6_linux_amd64.deb
dpkg -i pet_0.3.6_linux_amd64.deb
#32bit
#wget https://github.com/knqyf263/pet/releases/download/v0.3.6/pet_0.3.6_linux_386.deb
#dpkg -i pet_0.3.6_linux_386.deb

#64bit
wget https://github.com/Peltoche/lsd/releases/download/0.16.0/lsd-musl_0.16.0_amd64.deb
dpkg -i lsd-musl_0.16.0_amd64.deb
#32bit
#wget https://github.com/Peltoche/lsd/releases/download/0.16.0/lsd-musl_0.16.0_i386.deb
#dpkg -i lsd-musl_0.16.0_i386.deb

#64bit
wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
dpkg -i bat_0.12.1_amd64.deb
#32bit
#wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_i386.deb
#dpkg -i bat_0.12.1_i386.deb

#64bit
wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
dpkg -i fd_7.4.0_amd64.deb
#32bit
#wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_i386.deb
#dpkg -i fd_7.4.0_i386.deb

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

rm -rf *.deb

#echo "** set font !!"
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

#echo "**nerd font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip ~/.local/share/fonts/
unzip ~/.local/share/fonts/Ubuntu.zip
rm -rf ~/.local/share/fonts/Ubuntu.zip

rm -rf ~/linux

#path 편집
if [ "${HOME}" == "${onesider}" ]; then
	echo "exec zsh" >> ~/.bashrc
	chown onesider:onesider -R ~/
	echo "finished!"
else
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.zshrc
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.vimrc
	echo "finished!"
fi

cd ~
