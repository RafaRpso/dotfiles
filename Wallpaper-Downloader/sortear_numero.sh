#!/bin/bash

generate_random_number() {
  qtd_imagens_repositorio=388
  echo $((RANDOM % $qtd_imagens_repositorio + 1))
}

format_number_with_zeros() {
  printf "%05d" $1
}

random_number(){ 

	local	random_number=$(generate_random_number)

	local formatted_number=$(format_number_with_zeros $random_number)
	
	echo  $formatted_number 	
} 

