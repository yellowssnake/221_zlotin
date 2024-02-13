
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

    sll t2, t0, t1
    addi t2, t2, -10

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
