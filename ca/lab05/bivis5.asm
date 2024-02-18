   .macro print_int (%x)
   li a7, 1
   mv a0, %x
   ecall
   .end_macro

   .macro print_imm_int (%x)
   li a7, 1
   li a0, %x
   ecall
   .end_macro

   .macro read_int(%x)
   li a7, 5
   ecall
   mv %x, a0
   .end_macro

   .macro print_str (%x)
   .data
str:
   .asciz %x
   .text
   li a7, 4
   la a0, str
   ecall
   .end_macro

   .macro print_char(%x)
   li a7, 11
   li a0, %x
   ecall
   .end_macro

   .macro newline
   print_char('\n')
   .end_macro
main:
    read_int(t1)
    mv t4, sp
    mv t2, sp
    mv s0, sp
read_in_memory:
    beqz t1, print_from_memory
    read_int(t5)        
    sw t5, 0(t4)        
    addi t4, t4, -4      
    addi t1, t1, -1     
    j read_in_memory
print_from_memory:
    beq t2, t4, exit         
    lw t5, 0(t2)
    li t3, 0
    add t3, t3, t2
check_memory_loop:
    beq t3, s0, check_memory_loop_g
    addi t3, t3, 4
    lw t1, 0(t3)
    beq t1, t5, check_memory_loop_b
    j check_memory_loop
check_memory_loop_g:
    print_int(t5)
    newline
    addi t2, t2, -4               
    j print_from_memory
check_memory_loop_b:
    addi t2, t2, -4 
    j print_from_memory
exit:
