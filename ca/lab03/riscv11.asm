
    .text
main:
    # x: t0 = readInt()
    addi a7, zero, 5
    ecall
    add t0, zero, a0
    addi t1, zero, -1
    srli t4, t1, 27
    or t2, t4, t0
    

    # printInt(t2)    
    add a0, zero, t2
    addi a7, zero, 1
    ecall
