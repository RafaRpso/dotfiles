#!/bin/sh
install_command(){
	app_to_install="$1"
	
	#mude o comando abaixo conforme o seu linux
	sudo pacman -S --noconfirm $app_to_install

}
