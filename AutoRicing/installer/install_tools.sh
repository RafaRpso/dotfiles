#!/bin/sh
source $(echo $PWD/installer/config_installer.sh)

install_general_tools(){
	install_social_tools
	install_video_tools
	install_audio_tools
}

install_video_tools(){
	echo "Instalando aplicativos de vídeo" 
	install_command mpv
	install_command vlc
	
}
install_audio_tools(){
	echo "Instalando aplicativos de áudio"
	install_command mpd


}
install_social_tools(){
	echo "Instalando aplicativos de interação social"
	install_command discord
	install_command telegram-desktop
}

install_utils_tools(){
	echo "Instalando navegadores e aplicativos úteis"
	install_command firefox
	install_command brave
	install_command qbittorrent
	install_command torbrowser-launcher

}
