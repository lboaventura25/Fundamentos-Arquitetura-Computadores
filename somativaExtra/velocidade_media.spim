.data 
	new_line: .asciiz "\n"
	
.text

main:
	li $v0, 6
	syscall
	mov.s $f1, $f0
	
	li $v0, 6
	syscall
	mov.s $f2, $f0

	div.s $f3, $f1, $f2
	
	li $v0, 2
	mov.s $f12, $f3
	syscall

	li $v0, 4
	la $a0, new_line
	syscall

	li $v0, 10
	syscall