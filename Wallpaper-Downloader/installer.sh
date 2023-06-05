#!/bin/bash




instalar(){

echo -e "#!/bin/bash\nbash $PWD/download_image.sh" > $HOME/.local/bin/wallsort

chmod +x $HOME/.local/bin/wallsort
}

instalacao_wallsort(){
	if test -d "$HOME/.local/bin/wallsort"; then
		continue
	else
		instalar
	fi 
	
}
