#!/bin/bash
onesider="/home/onesider"

echo "** Using Root!!!"
echo "** Start! Setting Terminal!! "
echo "** apt setting!!"

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


# zsh 설정 (zsh 설치되면 이미 설치됬다고 나오네..) 
(echo "Y")|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "** set zsh !!"
chsh -s `which zsh`

sed -i "s/auth       required   pam_shells.so/#auth       required   pam_shells.so/g" /etc/pam.d/chsh

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

#echo "** set zsh !!"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/joelthelion/autojump.git
python3 ./autojump/install.py 

#echo "** set font !!"
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

#path 편집
if [ "${HOME}" == "${onesider}" ]; then
	echo "user = onesider"
	echo ${onesider}
else
	echo "user = another"
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.zshrc
	sed -i "s|${onesider}|${HOME}|g" ${HOME}/.vimrc
	echo ${HOME}
fi


:<<'END'
END
