.data
 	message: .asciiz "Ola Mundo\n"		# Mensagem a ser imprimida
 	new_line: .asciiz "\n"			# Quebra de linha
 	
.text

main:
	li $v0, 4				# Carrega código de impressão de uma string
	la $a0, message				# Imprime mensagem em message
	syscall
	
