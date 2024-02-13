
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    mul t3, t0, t0
    addi t4, zero, 2
    mul t5, t3, t4

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    addi t6, zero, 3
    mul s0, t6, t1

    sub t2, t5, s0
    addi t2, t2, 4 

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
