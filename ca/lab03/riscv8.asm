
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    addi t0, t0, 5

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    div t3, t0, t1
    addi t1, t1, -1
    addi t4, zero, 10
    div t5, t4, t1
    add t2, t3, t5


    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
