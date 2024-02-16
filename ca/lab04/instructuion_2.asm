.text

main:
	li a7, 5
	ecall
	mv t1, a0
	li a7, 5
	ecall
	mv t2, a0
	mul t0, t1, t2
	mv a0, t0
	li a7, 1
	ecall