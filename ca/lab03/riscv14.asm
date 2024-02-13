#
# Inputs two integers and prints their sum.
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

    slt t3, t1, t0
    addi t4, zero, 1
    xor t2, t3, t4

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
