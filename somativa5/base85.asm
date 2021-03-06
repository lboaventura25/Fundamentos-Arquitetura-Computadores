.data
	string: 	.space 		300
	new_line: 	.asciiz 	"\n"
	invalid: 	.asciiz  	"Entrada invalida.\n"
	base85: 	.asciiz    	"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ.-:+=^!/*?&<>()[]{}@%$#"

	# Aloca 4 espaços para um array de inteiros
	rest_array:
			    .align 		2 
			    .space 		16 
.text

main:
	# Lê a string de entrada em string
	la $a0, string 
	la $a1, 300
	li $v0, 8	 
	syscall
	
	# Inicia com index = 0
	add $t1, $zero, $zero
	
	la $a0, string
	
	# FOR_CHECK para checar a quantidade de letras
	FOR_CHECK:
		# Configurações do FOR_CHECK
		# Carrega a string[i] em $t3 e checa se é o o final da entrada
		add $t3, $a0, $t1
		lbu $t3, 0($t3)
		beq $t3, 10, EXIT_CHECK
		
		# Código dentro do FOR_CHECK
		
		# Código depois do FOR_CHECK
		addi $t1, $t1, 1
		j FOR_CHECK
		
	EXIT_CHECK:
	
	# Checa se a entrada é válida
		addi $s7, $zero, 4
		div $t1, $s7
		mfhi $s6
	
		beqz $s6, CHECK
	
		# Imprime mensagem de entrada invalida
		li $v0, 4
		la $a0, invalid
		syscall
	
		li $v0, 10
		syscall
	
	CHECK:

	# Carrega string em $t0
	la $t0, string

	# Inicia com index = 0
	add $t1, $zero, $zero
	
	# Inicia com cont = 0
	add $t2, $zero, $zero

	FOR:
		# Configurações do FOR
		# Carrega a string[i] em $t3 e checa se é o o final da entrada
		la $a0, string
		add $t3, $a0, $t1
		lbu $t3, 0($t3)
		beq $t3, 10, EXIT
		
		# Código dentro do FOR
		beq $t2, 1, SECOND
		beq $t2, 2, THIRD
		beq $t2, 3, FORTH

	#--------------------------------------------------------------# '0'1000001 '0'1101100 '0'1101111 '00'100000
			# Rotina quando é a primeira letra do ciclo
			
			# Joga os 8 bits da primeira letra 24 bits pra esquerda
			sll $t4, $t3, 24
			
			# Soma 1 ao cont e ao index
			addi $t1, $t1, 1
			addi $t2, $t2, 1
			
			# Volta pro FOR
			j FOR

	#--------------------------------------------------------------#
		SECOND: # Rotina quando é a segunda letra do ciclo
			
			# Joga os 8 bits da segunda letra 16 bits pra esquerda e soma no $t4
			sll $t5, $t3, 16
			addu $t4, $t4, $t5

			# Soma 1 ao cont e ao index
			addi $t1, $t1, 1
			addi $t2, $t2, 1

			# Volta pro FOR
			j FOR
	#--------------------------------------------------------------#
		THIRD: # Rotina de print da terceira letra

			# Joga os 8 bits da terceira letra 8 bits pra esquerda e soma no $t4
			sll $t5, $t3, 8
			addu $t4, $t4, $t5 

			# Soma 1 ao cont e ao index
			addi $t1, $t1, 1
			add $t2, $t2, 1

			# Volta pro FOR
			j FOR

	#--------------------------------------------------------------#
		FORTH: # Rotina de print da terceira letra
			
			# Soma os 8 bits da quarta letra no $t4
			addu $t4, $t4, $t3 

			# Soma 1 ao index e 0 cont
			addi $t1, $t1, 1
			add $t2, $zero, $zero

			# Volta pro FOR
			jal REST
			jal PRINT
			j FOR

	#--------------------------------------------------------------#
	EXIT:
	
	j RETURN
	
	#--------------------------------------------------------------#
	REST:
	# Carrega as variáveis para o FOR_REST
	
	# Carrega o índice do array igual a 0
	add $s0, $zero, $zero
	
	# Carrega 85 em $s5
	addi $s5, $zero, 85
	
	FOR_REST:
		# Configurações do FOR
		# Carrega a string[i] em $t3 e checa se é o o final da entrada
		slti $s1, $t4, 1
		beq $s1, 1, EXIT_REST
		
		# Código dentro do FOR
		divu $t4, $s5
		mfhi $s2
		
		# Salva o resto da operação no array[cont] = $s2 (array_rest[$s0] = $s2)
		sw $s2, rest_array($s0)
		
		# Depois de executar o FOR_REST
		addi $s0, $s0, 4
		mflo $t4
		
		j FOR_REST
	
	EXIT_REST:
	jr $ra
	#--------------------------------------------------------------#
	PRINT:
	# Carrega as variáveis para o FOR_PRINT
	
	# Carrega o índice do array igual a $s0
	addi $s0, $s0, -4
	
	FOR_PRINT:
		# Configurações do FOR
		# Carrega a string[i] em $t3 e checa se é o o final da entrada
		slti $s1, $s0, 0
		beq $s1, 1, EXIT_PRINT
		
		# Código dentro do FOR
		
		# Salva o resto da operação no array[cont] = $s2 (array_rest[$s0] = $s2)
		lw $t0, rest_array($s0)
		
		#Imprime o numero correspondente em base85
		
		# Carrega a string base85 em $a2
		la $a2, base85
		
		addu $a2, $a2, $t0
		lbu $a0, ($a2)
		
		# Imprime caracter codificado
		li $v0, 11
		syscall
		
		# Depois de executar o FOR_REST
		addi $s0, $s0, -4
		
		j FOR_PRINT
	
	EXIT_PRINT:
	
	jr $ra
	
	RETURN:
	# Imprime quebra de linha
	li $v0, 4
	la $a0, new_line
	syscall

	li $v0, 10
	syscall
