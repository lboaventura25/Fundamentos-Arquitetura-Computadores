.data
	new_line: .asciiz "\n"
	string: .space 256
.text

main:
	# Inicializa $t3 = inicio em 0
	li $t3, 0 
	# Inicializa $t4 = check em 1
	li $t4, 1
	
	# ------------- Termina as declarações de variáveis
	
	# Ler numero de letras em $t0
	li $v0, 5
	syscall
	move $t0, $v0

	# Ler string em $t1
	la $a0, string
	li $a1, 256
	li $v0, 8
	syscall
	move $t1, $a0
	
	# Carrega $t0 em $t2 (fim = numero de letras - 1)
	add $t2, $t0, -1
	
	# --------------- Termina a leitura das entradas do programa
	FOR:
		# Configura FOR
		slt $t5, $t3, $t2  		# $t5 = 1 se $t3 < $t2 (inicio < fim), $t5 = 1 se $t4 >= $t0 (inicio >= fim)
		beq $t5, $zero, EXIT 		# se $t5 = 0 sair do FOR
		
		# Código dentro do FOR
		
		# ---------- Carrega o valor do vetor string[inicio]
		add $t7, $t1, $t3		# $t7 = &(string + $t30 &($t7 = gabarito + inicio)
		lb $s2, 0($t7)			# $s2 = $t7 ($s2 = string + inicio ou atring[inicio])
		
		# ---------- Carrega o valor do vetor string[fim]
		add $s7, $t1, $t2		# $s7 = &(resposta + $t2) &($s7 = resposta + fim)
		lb $s3, 0($s7)			# $s3 = $s7 ($s3 = string + fim ou string[fim])
		
		# ---------- Checa se as respostas são iguais
		beq  $s2, $s3, continue		# se $s2 == $s3 pula pra continue
		
		add $t4, $zero, $zero		# $t4 = 0 + 0 (check = 0)
		
		continue:
		
		# Depois de executar o código dentro do FOR
		addi $t2, $t2, -1	# Subtrai 1 no $t2 (fim = fim - 1)
		addi $t3, $t3, 1	# Soma 1 no $t3 (inicio = inicio + 1)
		
		j FOR # volta pro FOR
	EXIT:
	
	# ----------- Print 0 se não for palindromo e 1 se for palindromo
	li $v0, 1
	move $a0, $t4
	syscall
	
	li, $v0, 4
	la $a0, new_line
	syscall

	li $v0, 10
	syscall
