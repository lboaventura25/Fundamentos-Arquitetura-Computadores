.data 
	new_line: .asciiz "\n"
	lo: .asciiz "Lo-> "
	hi: .asciiz "\nHi-> "
.text

main:
	li $v0, 5
	syscall
	move $a0, $v0
	
	li $v0, 5
	syscall
	move $a1, $v0
	
	jal multfac
	
	# --- Prints
	li $v0, 4
	la $a0, lo
	syscall
	
	li $v0, 1
	mflo $a0
	syscall
	
	li $v0, 4
	la $a0, hi
	syscall
	
	li $v0, 1
	mfhi $a0
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	li $v0, 10
	syscall
	
multfac:
	# Converte o operando $a0 para positivo
	slti  $t0, $a0, 0
	beqz $t0, CONTINUE_1
	
	# Nega o $a0 já que é negativo
	nor $a0, $a0, $zero
	addi $a0, $a0, 1
	
	CONTINUE_1:
	
	# Converte o operando $a1 para positivo
	slti  $t1, $a1, 0
	beqz $t1, CONTINUE_2
	
	# Nega o $a1 já que é negativo
	nor $a1, $a1, $zero
	addi $a1, $a1, 1
	
	CONTINUE_2:

	# ----- Inicializano variáveis
	# hi = 0 ($t5)
	add $t5, $zero, $zero
	# lo = multiplicador = $a1 ($t6)
	add $t6, $zero, $a1
	# contador = 1
	addi $s2, $zero, 1
	# ----- Finaliza inicializações
	
	FOR:
		# Configura FOR
		slti $s3, $s2, 33
		beqz $s3, EXIT
		
		# Código dentro do FOR
		
		# Pega o bit menos significativo
		andi $s6, $t6, 1
		
		# Checa se o bit menos significativo do multiplizando é 0, se sim pula pra CONTINUE
		beqz $s6, CONTINUE
		
		# Soma o $a0 no $t5 (Hi = Hi + multiplicando) 
		addu $t5, $t5, $a0
		
		CONTINUE:
		
		# Pega o bit menos significativo de $t5
		andi $s0, $t5, 1
		
		# ------- Desloca 1 bit a direita em P
		# Primeiro o desloca em $t5
		srl $t5, $t5, 1
		
		# Segundo desloca em $t6
		srl $t6, $t6, 1
		
		# Coloca o bit menos significativo do Hi = $t5 no mais significativo de Lo = $t6
		sll $s0, $s0, 31
		addu $t6, $t6, $s0
		
		# Final do FOR
		addi, $s2, $s2, 1	# Adiciona 1 no contador
		j FOR 			# Volta pro FOR
	EXIT:
	
	# Checa se o $a0 era negativo antes do FOR
	beq $t0, $t1 CONTINUE_3
	
	# Nega o produto
	nor $t5, $t5, $zero
	nor $t6, $t6, $zero
	# Soma 1 da parte menos significativa 
	addi $t6, $t6, 1
	
	CONTINUE_3:
	
	mthi $t5
	mtlo $t6

	jr $ra
	
