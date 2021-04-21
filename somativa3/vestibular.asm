.data	
	new_line: .asciiz "\n"
	string_gab: .space 256
	string_res: .space 256
	lixo: .space 1
.text

main:
	# Inicializa $t3 = contador em 0
	li $t3, 0 
	# Inicializa $t4 = i em 0
	li $t4, 0 
	
	# ------------- Termina as declarações de variáveis
	
	# Ler numero de itens em $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	#la $a0, lixo
	#li $a1, 1
	#li $v0, 8
	#syscall

	# Ler gabarito em $t1
	la $a0, string_gab
	li $a1, 256
	li $v0, 8
	syscall
	move $t1, $a0
	
	# Ler resposta em $t2
	la $a0, string_res
	li $a1, 256
	li $v0, 8
	syscall
	move $t2, $a0
	
	
	# --------------- Termina a leitura das entradas do programa
	FOR:
		# Configura FOR
		slt $t5, $t4, $t0  		# $t5 = 1 se $t4 < $t0 (i < N), $t5 = 1 se $t4 >= $t0 (i >= N)
		beq $t5, $zero, EXIT 		# se $t5 = 0 sair do FOR
		
		# Código dentro do FOR
		
		# ---------- Carrega o valor do vetor gabarito[i]
		add $t7, $t1, $t4		# $t7 = gabarito + $t4 ($t7 = gabarito + i)
		lb $s2, 0($t7)			# $s2 = $t7 ($s2 = gabarito + i ou gabarito[i])
		
		# ---------- Carrega o valor do vetor resposta[i]
		add $s7, $t2, $t4		# $s7 = &(resposta + $t4) &($s7 = resposta + i)
		lb $s3, 0($s7)			# $s3 = $s7 ($s3 = resposta + i ou resposta[i])
		
		# ---------- Checa se as respostas são iguais
		bne $s2, $s3, continue		# se $s2 != $s3 pula pra continue
		
		addi $t3, $t3, 1		# $t3 = $t3 + 1 (i = i + 1)
		
		continue:
		
		# Depois de executar o código dentro do FOR
		addi $t4, $t4, 1	# Soma 1 no $t4 (i = i + 1)
		
		j FOR # volta pro FOR
	EXIT:
	
	# ----------- Print numero de acertos
	li $v0, 1
	move $a0, $t3
	syscall
	
	li, $v0, 4
	la $a0, new_line
	syscall

	# Sai do programa
	li $v0, 10
	syscall