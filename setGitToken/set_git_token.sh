if [ "$1" = "-s" ] ; then 
	token_git=$2
	echo "export TOKEN_GIT=$token_git"  >> $HOME/.bashrc

	echo "Concluído"

else 
	echo "Uso: set_git_token.sh -s <seu token git>"
fi 	
