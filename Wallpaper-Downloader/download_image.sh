#!/bin/bash
source $(echo $PWD/sortear_numero.sh)
source $(echo $PWD/installer.sh)

link_repositorio="https://github.com/kitsunebishi/Wallpapers/raw/main/images"

validacao_curl(){
	link="$1"
	echo $(curl -s -o /dev/null -w "%{http_code}" -L "$link")
}

curl_img(){
	rng_number="$1"
	type_img="$2"
	link_download="$link_repositorio/$rng_number.$type_img"
	http_validacao_response=$(validacao_curl $link_download)
	if [ "$http_validacao_response" = "200" ] ; then
		echo "Baixando imagem..."
		curl -O -L  $link_download
		echo 1 
	fi

	echo 0

}

inserir_imagem_wallpaper(){
	img="$PWD/$1"
	pkill swaybg
	nohup swaybg -i $img  >/dev/null 2>&1 &	
}

verificar_deletar_imagem(){
	isImagem=$( ls $PWD | grep -E "jpg|jpeg|png")

	if [ "$isImagem" != "" ] ;then
		deletar_imagens
	fi 

}

deletar_imagens(){
	
	fazer_backup 
	rm -f $PWD/*.jpg $PWD/*.png $PWD/*jpeg
}

fazer_backup(){
	diretorio_backup="$HOME/backup_imagens"

	
	if test -d $diretorio_backup; then 
		rm -f $diretorio_backup/*
		cp -r $PWD/* $diretorio_backup
	else 
		mkdir $diretorio_backup
	fi 
}


verificar_tipos_imagens(){
	local array_tipos=("$@")

	for img in "${array_tipos[@]}"; do
		echo "Tentando verificar se a imagem é $img"
		response=$(curl_img $numero_imagem $img)

		if [ "$response" = "1" ]; then
			break 
		fi 
	done


}


main(){
	instalacao_wallsort
	verificar_deletar_imagem
	numero_imagem=$(random_number)
	tipos_imagens=("jpg" "png" "jpeg")
	
	verificar_tipos_imagens "${tipos_imagens[@]}"
	selecionar_imagem=$(ls | grep -E "jpeg|jpg|png")
	
	inserir_imagem_wallpaper $selecionar_imagem
		
	
}

main
