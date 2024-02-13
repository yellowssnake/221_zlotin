
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    slli t0, t0, 2

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0

    sub t2, t0, t1
    addi t2, t2, 5
    srai t2, t2, 1

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
