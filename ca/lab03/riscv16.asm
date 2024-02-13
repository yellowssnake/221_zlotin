#
# Inputs two integers and prints their sum.

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

    addi t3, zero, -5
    slt t4, t0, t3
    addi t5, zero, 10
    slt t6, t5, t1
    and t2, t4, t6

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
