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
    mv s2, t1
read_in_memory:
    beqz t1, bubble_sort_loop
    read_int(t5)        
    sw t5, 0(t4)        
    addi t4, t4, -4      
    addi t1, t1, -1     
    j read_in_memory
bubble_sort_loop:
    beqz, s2, print_from_memory
    mv s3, t2
    mv s4, t4
    addi s4, s4, 4
    addi s2, s2, -1
bubble_logic:
    beq s3, s4, bubble_sort_loop
    li s5, 0
    addi s5, s5, -4
    add s5, s5, s3
    lw s6, 0(s3)
    lw s7, 0(s5)
    bge s6, s7, swap
    addi s3, s3, -4
    j bubble_logic
swap:
    sw s6, 0(s5)
    sw s7, 0(s3)
    addi s3, s3, -4
    j bubble_logic
print_from_memory:
     beq t4, t2, exit
     lw s0, 0(t2)
     print_int(s0)
     addi t2, t2, -4
     beq t4, t2, exit
     print_char(' ')
     j print_from_memory
exit:
    newline
    