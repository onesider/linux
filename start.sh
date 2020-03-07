#!/bin/bash
onesider="/home/onesider"

echo "** apt setting!!"
add-apt-repository ppa:x4121/ripgrep

apt -y update
apt -y upgrade
apt -y dist-upgrade
apt -y autoremove

echo "** install app!!"
apt install -y git
apt install -y curl
apt install -y zsh
apt install -y vim
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

(echo "Y")|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sed -i "s/auth       required   pam_shells.so/#auth       required   pam_shells.so/g" /etc/pam.d/chsh

echo "** set zsh !!"
chsh -s `which zsh`

echo "#add onesider" >> ~/.bashrc
echo "if [ -t 1 ]; then" >> ~/.bashrc
echo "  exec zsh" >> ~/.bashrc
echo "fi" >> .bashrc

#echo "** set vim !!"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/tomasr/molokai.git
mv ./molokai/colors ./.vim/colors
rm -rf ./molokai
git clone https://github.com/onesider/linux.git
mv ./linux/.vimrc ./.vimrc
mv ./linux/.zshrc ./.zshrc
rm -rf linux

#Util
wget https://github.com/knqyf263/pet/releases/download/v0.3.0/pet_0.3.0_linux_amd64.deb
dpkg -i pet_0.3.0_linux_amd64.deb

wget https://github.com/Peltoche/lsd/releases/download/0.16.0/lsd-musl_0.16.0_amd64.deb
dpkg -i lsd-musl_0.16.0_amd64.deb

wget https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
dpkg -i bat_0.12.1_amd64.deb

wget https://github.com/sharkdp/fd/releases/download/v7.4.0/fd_7.4.0_amd64.deb
dpkg -i fd_7.4.0_amd64.deb

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

rm -rf *.deb

#이유는 모르겠는데 install.py가 잘 안되는 경우가 발생할수도 있다. 셀프로 설치해주면 된다.
python3 ./autojump/install.py

#echo "** set font !!"
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

#path 편집
if [ "${HOME}" == "${onesider}" ]; then
	chown onesider:onesider -R .vim/ .oh-my-zsh/ autojump/
	echo "finished! - onesider"
else
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.zshrc
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.vimrc
	echo "finished! - ${onesider}"
fi
