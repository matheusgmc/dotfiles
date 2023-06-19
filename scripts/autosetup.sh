#!/bin/bash

############################################ 
## APENAS PARA UBUNTU OU DISTROS BASEADAS ## 
############################################ 

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update && 

## Instalando pacotes e programas do repositório deb do Ubuntu ##

sudo apt install libfuse2 zsh asdf flatpak alacritty vlc xclip snap dpkg -y &&

## Instalando pacotes Snap ##

sudo snap install postman &&
sudo snap install insomnia &&  

## Adicionando repositório Flathub ##

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && 

## Softwares que precisam de download externo ##

cd ~/Downloads

## Baixando e Instalando o Discord
wget -c https://discord.com/api/download?platform=linux&format=deb &&
sudo dpkg -i *.deb &&

mkdir ~/AppImages &&

cd ~/AppImages &&

wget -c https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage &&

mv ./nvim.appimage ./nvim

chmod u+x nvim &&

git clone https://github.com/matheusgmc/dotfiles ~/Documentos/dotfiles &&

## Adicionando as config para alacritty, nvim e spaceship

cp ~/Documentos/dotfiles/.config/** ~/.config  &&

## Adicionando as config para o zshrc
cp ~/Documentos/dotfiles/.zshrc ~/.zshrc &&

## Instalando as linguagens de programação usando asdf

asdf plugin add nodejs &&
asdf install nodejs latest &&
asdf install nodejs latest:18 &&
asdf install nodejs latest:16 &&
asdf global nodejs latest:18 &&

## Atualização do sistema ##

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

#Fim do Script ##

echo "Finalizado"
