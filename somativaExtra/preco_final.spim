.data
	new_line: .asciiz "\n"
	hundred: .double 100.0000000

.text

main:

	li $v0, 7
	syscall
	mov.s $f0, $f0
	
	li $v0, 5
	syscall
	mtc1 $v0, $f2
	cvt.d.w $f2, $f2
	
	li $v0, 5
	syscall
	mtc1 $v0, $f4
	cvt.d.w $f4, $f4
	
	# Carrega 100.0 no $f7
	lwc1 $f6, hundred
	
	# ------- Cálculo lucro = $f8
	div.s $f2, $f2, $f6
	mul.s $f8, $f1, $f2
	
	# ------- Cálculo impostos = $f10
	div.s $f4, $f4, $f6
	mul.s $f10, $f1, $f4
	
	# ------- Cálculo final = $f12
	add.s $f12, $f8, $f10
	add.s $f12, $f12, $f0
	
	li $v0, 2
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall

	li $v0, 10
	syscall