
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    add t3, zero, t0
    slli, t0, t0, 2
    slli, t3, t3, 1
    add t4, t3, t0

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    add t5, zero, t1
    slli t1, t1, 1
    add t6, t1, t5

    sub t2, t4, t6

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
