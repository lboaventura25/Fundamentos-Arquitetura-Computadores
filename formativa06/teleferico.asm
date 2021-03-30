.data
	new_line: .asciiz "\n"
	
.text

main:
	# Recebe a capacidade de alunos na cabine em $t0
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Recebe a quantidade de alunos na turma em $t1
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Subtrai um da capacidade máxima da cabine
	add $t2, $t0, -1
	
	# Faz o cálculo da quantidade de viagens em $a0
	div $a0, $t1, $t2
	
	# Pega o resto da divisão inteira e coloca em $t0
	mfhi $t0
	
	# Se o resto($t0) != 0 soma 1 nas viagens, se não imprime
	beq $t0, $zero, print
	add $a0, $a0, 1
	
	# Imprime a quantidade de viagens
	print: li $v0, 1
	syscall	
	
	# imprime quebra de linha
	li $v0, 4
	la $a0, new_line
	syscall
	
	# Sai do programa
	li $v0, 10
	syscall
	
