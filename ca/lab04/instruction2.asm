.text

main:
	addi x17, x0, 5
	ecall
	add x6, x0, x10
	srli x5, x10, 31
	ecall
	add x29, x0, x10
	srli x28, x10, 31
	beq x6, x0, bob5
	beq x29, x0, bob8
	beq x5, x0, bob6
	xori x6, x6, -1
	addi x6, x6, 1
	bob6:beq x28, x0, bob4
	xori x29, x29, -1
	addi x29, x29, 1
	bob4:bge x6, x29, bob7
	xor x29, x29, x6
	xor x6, x29, x6
	xor x29, x29, x6
	bob7:add x7, x0, x0
	bob9:add x7, x7, x6
	addi x29, x29, -1
	blt x0, x29, bob9
	xor x31, x5, x28
	beq x31, x0, bob3
	xori x7, x7, -1
	addi x7, x7, 1
	bob3:addi x17, x0, 1
	add x10, x0, x7
	ecall
	addi x17, x0, 10
	bob8:ecall
	bob5:addi x17, x0, 1
	add x10, x0, x0
	ecall
	addi x17, x0, 10
	ecall