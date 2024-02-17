	.include "macrolib.s"
main:
    read_int (t1)
    li t2, 0
    li t3, 0
    li t5, 10
    bgez t1, loop
negate:
    neg t1, t1
loop:
    beq t1, t2, finish
    remu t4, t1, t5
    add t3, t3, t4
    div t1, t1, t5
    j loop
finish:
    print_int(t3)
    