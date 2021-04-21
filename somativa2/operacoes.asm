.data
	new_line: .asciiz "\n"
	add_text: .asciiz "ADD: "
	sub_text: .asciiz "SUB: "
	and_text: .asciiz "AND: "
	or_text: .asciiz "OR: "
	xor_text: .asciiz "XOR: "
	mask_text: .asciiz "MASK: "
	sll_text: .asciiz "SLL("
	srl_text: .asciiz "SRL("
	final_text: .asciiz "): "

.text

main:
	# Recebe o inteiro A
	li $v0, 5
	syscall
	move $t0, $v0
	
	# Recebe o inteiro B
	li $v0, 5
	syscall
	move $t1, $v0
	
	# Recebe o inteiro C
	li $v0, 5
	syscall
	move $t2, $v0
	
	# -------------------- ADD
	add $t4, $t0, $t1
	la $t3, add_text
	jal print
	
	# -------------------- SUB
	sub $t4, $t0, $t1
	la $t3, sub_text
	jal print
	
	# -------------------- AND
	and $t4, $t0, $t1
	la $t3, and_text
	jal print
	
	# -------------------- OR
	or $t4, $t0, $t1
	la $t3, or_text
	jal print
	
	# -------------------- XOR
	xor $t4, $t0, $t1
	la $t3, xor_text
	jal print
	
	# -------------------- MASK
	and $t4, $t2, 31
	la $t3, mask_text
	jal print
	
	move $t2, $t4
	
	# -------------------- SLL($t2)
	sllv $t4, $t0, $t2
	la $t3, sll_text
	jal print_srl_sll
	
	# -------------------- SRL($t2)
	srlv $t4, $t1, $t2
	la $t3, srl_text
	jal print_srl_sll
	
	# Sai do programa
	li $v0, 10
	syscall
	
# Printa o inteiro em $v0
print:
	li $v0, 4
	move $a0, $t3
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra
	
# Printa o inteiro em $v0 para srl e sll
print_srl_sll:
	li $v0, 4
	move $a0, $t3
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
	li $v0, 4
	la $a0, final_text
	syscall
	
	li $v0, 1
	move $a0, $t4
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	jr $ra
	