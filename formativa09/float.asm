.data
	new_line: .asciiz "\n"
	negative_signal: .asciiz "-"
	positive_signal: .asciiz "+"
	zero_float: .float 0.0

.text

main:
	
	# Recebe o float em $t0
	li $v0, 6
	syscall
	
	jal print
	
	# Compara se o numero é menor que zero e printa o sinal positivo ou negativo
	lwc1 $f1, zero_float
	c.lt.s $f0, $f1
	bc1t print_signal
	
	jal print_positive
	
	#print sinal negativo$f1, zergative
	
	mfc1 $t0, $f0
	srl $t0, $t0, 23
	
	andi $t0, $t0, 0xFF
	addi $t0, $t0, -127
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra
	
	# Sai do programa
	li $v0, 10
	syscall
	
# Printa o conteúdo em $f0
print:
	li $v0, 2
	mov.s $f12, $f0
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra

# Print sinal negativo
print_negative:
	li $v0, 4
	la $a0, negative_signal
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra

# Print sinal positivo
print_positive:
	li $v0, 4
	la $a0, positive_signal
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	

	
