#!/bin/bash
source $(echo $PWD/installer/config_installer.sh)

install_ricing_bullshit(){
	echo "Instalando aplicativos padrões para Ricing"
	sleep 1 
	install_command neofetch
	install_command htop
	install_command ranger
	install_command ansiweather
	install_command afetch
	install_command cbonsai
	install_command zsh
	install_command cava

}

get_wallpapers(){
	
	git clone https://github.com/kitsunebishi/Wallpapers.git $HOME/Images

}


install_terminal(){
	install_command alacritty
	install_command kitty
}

install_wm() {
	if [ "$1" = "-wm" ]; then

		install_command i3
		install_command hyprland
		install_command bspwm
		install_command ragnar
	fi

}

install_rofi(){
	install_command rofi
	install_rofi_config
}

install_rofi_config(){
	config_dir="$HOME/config/rofi"
	config_file_link="https://raw.githubusercontent.com/dikiaap/dotfiles/master/.rofi/config.rasi"
	mkdir -p $config_dir
	curl -o "$config_dir/config.rasi" "$config_file_link"

} 
