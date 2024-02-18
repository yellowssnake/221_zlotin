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
    
    li t2, 4
    li t6, 0
    add t6, t6, t1
    mul t3, t1, t2 
    sub sp, sp, t3
    addi t2, t2, -3
    li t3, 1

    mv t4, sp 
read_in_memory:
    beqz t1, print_from_memory
    read_int(t5)        
    sw t5, 0(t4)        
    addi t4, t4, 4      
    addi t1, t1, -1     
    j read_in_memory
print_from_memory:
    beqz t6, abob
    addi t4, t4, -4         
    lw t5, 0(t4)
    and t1, t5, t2
    beqz t1, condition               
    addi t6, t6, -1  
    j print_from_memory
condition:
    li t3, 0
    print_int(t5)    
    newline           
    addi t6, t6, -1  
    j print_from_memory
abob:
    beqz t3, exit
    newline
exit:

    
