.data
dicts: .space 128
.text
j main
handler:
    csrrw  s1, uepc, zero
    addi s1, s1, 4        
    csrrw  zero, uepc, s1
    la s2, dicts  

    csrr s3, ucause     
    li s4, 5
    li s5, 4
    li s6, 132     
    add s5, s5, s2
    add s6, s6, s2     
    bne s3, s4, store_fault
    mv s0, a0
    li a0, 0
read_cycle:
    beq s5, s6, exception_end
    lw s8, 0(s5)
    beq s0, s8, cyc_end
    addi s5, s5, 8
    j read_cycle
cyc_end:
    addi s5, s5, 4
    lw s8, 0(s5)
    mv t0, s8
    j exception_end     
store_fault:
    mv s0, a0
    mv s7, t1
    j write_cycle
write_cycle:
    beq s5, s6, exception_end
    lw s8, 0(s5)
    beqz s8, write_in_memory
    beq s8, s7, update_memory
    addi s5, s5, 8
    j write_cycle
write_in_memory:
    sw s7, 0(s5)
    mv a0, s5
    addi s5, s5, 4
    sw s0, 0(s5)
    j exception_end
update_memory:
    addi s5, s5, 4
    sw s0, 0(s5)
    j exception_end
exception_end:
    uret