
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    srli t0, t0, 2

    # y: t1 = readInt()
    addi a7, zero, 5
    ecall
    add t1, zero, a0
    addi t1, t1, -1
    slli t1, t1, 3

    add t2, t0, t1

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
