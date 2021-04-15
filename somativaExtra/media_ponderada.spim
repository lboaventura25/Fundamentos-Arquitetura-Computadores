.data 
	new_line: .asciiz "\n"
	zero_float: .float 0.0
	
.text

main:
	# ---------- Inicia declaração de variáveis
	lwc1 $f4, zero_float
	
	lwc1 $f7, zero_float
	
	# ---------- Finaliza declaração
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Configura i = 0
	li $t1, 0
	
	FOR:
		#Configura FOR
		slt $t2, $t1, $t0
		beqz $t2, EXIT
		
		# Código dentro do FOR
		li $v0, 6
		syscall
		mov.s $f1, $f0
	
		li $v0, 6
		syscall
		mov.s $f2, $f0
		
		mul.s $f3, $f1, $f2
		add.s $f4, $f4, $f3
		
		add.s $f7, $f7, $f1
		
		# Operações depois d e executar o FOR
		addi $t1, $t1, 1
		
		# Volta pro FOR
		j FOR
	EXIT:
	
	div.s $f4, $f4, $f7
	
	li $v0, 2
	mov.s $f12, $f4
	syscall

	li $v0, 4
	la $a0, new_line
	syscall

	li $v0, 10
	syscall
