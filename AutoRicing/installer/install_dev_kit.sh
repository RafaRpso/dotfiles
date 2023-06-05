source $(echo $PWD/installer/config_installer.sh)

install_lunar_vim(){
	echo "Instalando o LunarVim"
	install_command neovim
	LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

}

install_develop_kit(){
	echo "Instalando aplicativos de desenvolvimento"
	install_command intellij-idea-community-edition
	install_command code
	install_command postman-bin
	install_lunar_vim

}
