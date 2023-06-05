#!/bin/bash 




source $(echo $PWD/installer/config_installer.sh)
source $(echo $PWD/installer/install_tools.sh)
source $(echo $PWD/installer/install_dev_kit.sh)
source $(echo $PWD/installer/install_ricing_kit.sh)


main(){ 
	instalador
}

instalador(){

	install_develop_kit
	install_rofi	
	install_ricing_bullshit
	install_wm	
	install_general_tools
	get_wallpapers


}

main
