.data
	new_line: .asciiz ".\n"
	nao_modulo: .asciiz "O modulo nao eh primo.\n"
	invalido: .asciiz "Entradas invalidas.\n"
	exp: .asciiz "A exponencial modular "
	ele: .asciiz " elevado a "
	mod: .asciiz " (mod "
	final: .asciiz ") eh "

.text
main:
	# Inicializa check = 1
	li $t4, 1
	
	# Inicializa expoente = 1
	li $t5, 1
	
	# Inicializa i = 2
	li $s1, 2
	
	# ------------- Termina as declarações de variáveis
	
	# Ler N1 em $t1
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Ler N2 em $t2
	li $v0, 5
	syscall
	move $t2, $v0
	
	# Ler N3 em $t3
	li $v0, 5
	syscall
	move $t3, $v0
	
	# ------------- Termina leitura das entradas do programa
	
	# -------------  Checa condições das entradas
	li $s7, 1
	slt $s5, $t1, $s7
	beq $s5, 0, continue_1
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_1:
	
	slt $s5, $t2, $s7
	beq $s5, 0, continue_2
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_2:
	
	slt $s5, $t3, $s7
	beq $s5, 0, continue_3
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_3:
	
	sgt $s5, $t1, 65535
	beq $s5, 0, continue_4
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_4:
	
	sgt $s5, $t2, 65535
	beq $s5, 0, continue_5
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_5:
	
	sgt  $s5, $t3, 65535
	beq $s5, 0, continue_6
	
	li, $v0, 4
	la $a0, invalido
	syscall
	
	li $v0, 10
	syscall
	
	continue_6:
	# ------------- Terminar checagem das condições de entrada
	
	beq $t3, 1, nao_primo
	
	addi $s6, $t3, 1
	
	# loop para identificar se N3 é primo
	FOR_PRIMO:
		# Configura FOR_PRIMO
		mul $s5, $s1, $s1
		slt $s2, $s5, $s6 			# $s2 = 1 se $s1 < $t7 (i < N3 + 1), $s2 = 0 se $s1 >= $t7 (i >= N3 + 1)
		beq $s2, $zero, EXIT_PRIMO		# se $s2 = 0 sair do FOR_PRIMO
		
		# Código dentro do FOR
		
		# ---------- Realiza o calculo de N3 % i e coloca em $s3
		div $t3, $s1
		mfhi $s3
		
		# ---------- Checa se as respostas são iguais
		bnez $s3, continue_primo		# se N3 % i != 0 pula pra continue
		
		add $t4, $zero, $zero
		j EXIT_PRIMO
		
		continue_primo:
		
		# Depois de executar o código dentro do FOR_PRIMO
		addi $s1, $s1, 1	# Soma 1 no $s1 (i = i + 1)
		
		j FOR_PRIMO # volta pro FOR_PRIMO
	EXIT_PRIMO:
	
	beq $t4, 1, continue
	
	nao_primo:
	# ---------- Print modulo nao eh primo
	li, $v0, 4
	la $a0, nao_modulo
	syscall
	
	li $v0, 10
	syscall
	
	continue:
	
	# Carrega N1 % N3
	div $t1, $t3
	mfhi $s3
	
	# Carrega N2 em $t7
	add $t7, $zero, $t2
	
	# Carrega $s2 com 2
	li $s2, 2
	
	# loop para calcular o N1 elevado a N2
	FOR_EXP:
		# Configura FOR_EXP
		sgtu $s5, $t7, 0
		beqz $s5, EXIT_EXP
				
		# -------------- Código dentro do FOR
		# Checa se o n2 é par
		divu $t7, $s2
		mfhi $t4
		
		# Se for ímpar pula pra continue_10 
		beqz $t4, continue_10
		
		# Realiza o produto de $t5 por $s3 (N1 % N3) e armazena no próprio $t5
		multu $t5, $s3
		mflo $t5
		
		# Tira o modulo do resultado do produto acima pelo N3 e armazena em $t5
		divu $t5, $t3
		mfhi $t5
		
		continue_10:
		
		# Divide o n2 por 2 para o próximo laço
		divu $t7, $s2
		mflo $t7
		
		# Realiza o produto de n1 por n1
		multu $s3, $s3
		mflo $s3
		
		# Tira o modulo de n1 por N3
		divu $s3, $t3
		mfhi $s3
		
		# -------------- Termina código do FOR
		j FOR_EXP # volta pro FOR_EXP
	EXIT_EXP:
	# --------------- Termina for 

	# ----------- Prints da questão
	
	# ---------- Print exp
	li, $v0, 4
	la $a0, exp
	syscall
	
	# Print $t1
	li $v0, 1
	move $a0, $t1
	syscall
	
	# ---------- Print ele
	li, $v0, 4
	la $a0, ele
	syscall
	
	# Print $t2
	li $v0, 1
	move $a0, $t2
	syscall
	
	# ---------- Print mod
	li, $v0, 4
	la $a0, mod
	syscall
	
	# Print $t3
	li $v0, 1
	move $a0, $t3
	syscall

	# ---------- Print final
	li, $v0, 4
	la $a0, final
	syscall
	
	# Print $t5
	li $v0, 1
	move $a0, $t5
	syscall
	
	# ------------ Printa quebra de linha
	li, $v0, 4
	la $a0, new_line
	syscall
	
	li $v0, 10
	syscall
	
