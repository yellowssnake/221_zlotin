#

    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    addi t1, t1, 3

    slt t3, t1, t0
    slt t4, t0, t1
    or t2, t3, t4

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
