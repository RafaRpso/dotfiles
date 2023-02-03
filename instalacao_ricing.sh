#!/bin/bash 

echo 
"Começando instalação do meu SETUP de Ricing.
Qualquer problema pode me mandar no e-mail (rafael.raposo@sptech.school)"
sleep 5 
#baixando os aplicativos
sudo apt update 
sudo apt upgrade
sudo apt install i3 neofetch nvim ranger vlc polybar alacritty npm picom feh lxappearance htop ranger  

#baixando configuracao pro pc (minha configuracao)
curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/alacritty/alacritty.yml > ~/.config/alacritty/alacritty.yml
curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/i3/config > ~/.config/i3/config 
curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/polybar/config.ini > ~/.config/polybar/config.ini 
curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/picom/picom.conf > ~/.config/picom/picom.conf  


#instalando o terminal bonito (ZSH + OH-MY-ZSH )
sudo apt install zsh 
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/zsh/.zshrc > ~/.zshrc 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



#ferramentas que vão facilitar sua vida xD 
npm i -g alacritty-themes

echo "Você quer instalar os wallpapers e o aplicativo wallpy?"
echo "Digite 1 para sim"
echo "Qualquer outro caractere para não"
read resposta

if [ "$resposta" == "1" ]; then
  # Instruções para instalar os wallpapers e o aplicativo wallpy
  echo "Instalando wallpapers e o aplicativo wallpy..."
  mkdir ~/wallpy
  curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/wallpy/trocarWall.py > ~/wallpy/trocarWall.py 
  curl https://raw.githubusercontent.com/RafaRpso/my-ricing/main/wallpy/slider.py > ~/wallpy/slider.py 
  touch ~/wallpy/logs.txt 
  touch ~/wallpy/history.txt 
  git clone https://github.com/kitsunebishi/Wallpapers  ~/ 

else
  # Instruções para não instalar os wallpapers e o aplicativo wallpy
  echo "Não instalando wallpapers e o aplicativo wallpy..."
fi



echo "Para que tudo funcione perfeitamente, precisamos reiniciar a máquina.
Digite 1 para SIM "
read resposta 

if [ "$resposta" == "1"]; then
  systemctl reboot 
else 
  echo "OK! Instalação encerrada. Reinicie a máquina mais tarde. "
fi 
