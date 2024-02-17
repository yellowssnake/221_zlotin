	.include "macrolib.s"
main:
    read_int(t1)
    li t2, 1
    li t3, 0
    li t4, 0
loop:
    beq t1, t3, finish
    read_int(t5)
    mul t5, t5, t2
    add t4, t4, t5
    neg t2, t2
    addi t3, t3, 1
    j loop
finish:
    print_int(t4)   