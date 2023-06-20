#!/bin/bash

############################################ 
## APENAS PARA UBUNTU OU DISTROS BASEADAS ## 
############################################ 

## Removendo travas eventuais do apt ##

sudo rm /var/lib/dpkg/lock-frontend ; sudo rm /var/cache/apt/archives/lock ;

## Atualizando o repositório ##

sudo apt update && 

## Instalando pacotes e programas do repositório deb do Ubuntu ##

sudo apt install libfuse2 zsh flatpak alacritty vlc xclip snapd dpkg build-essential libssl-dev discord -y &&

## Instalando pacotes Snap ##

sudo snap install postman &&
sudo snap install insomnia &&  

## Adicionando repositório Flathub ##

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && 

## Softwares que precisam de download externo ##


mkdir ~/AppImages &&

cd ~/AppImages &&

wget -c https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage &&

mv ~/AppImages/nvim.appimage ~/AppImages/nvim &&

chmod u+x ~/AppImages/nvim &&

git clone https://github.com/matheusgmc/dotfiles ~/Documentos/dotfiles &&

## Adicionando as config para alacritty, nvim e spaceship

cp ~/Documentos/dotfiles/.config/** ~/.config  &&

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0 &&

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&

curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh &&

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&

## Adicionando as config para o .zshrc
cp ~/Documentos/dotfiles/.zshrc ~/.zshrc &&
## .tool-versions para o asdf
cp ~/Documentos/dotfiles/.tool-versions ~/.tool-versions &&

## Instalando as linguagens de programação usando asdf
zsh -i -c "zplug install && zplug load && asdf plugin add nodejs && asdf install" &&

## Atualização do sistema ##

sudo apt update && sudo apt dist-upgrade -y && sudo apt autoclean -y && sudo apt autoremove -y &&

#Fim do Script ##

echo "Setup Finalizado"
