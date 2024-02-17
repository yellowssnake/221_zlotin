	.include "macrolib.s"
main:
    read_int(t1)
    
    li t2, 4
    li t6, 0
    add t6, t6, t1
    mul t3, t1, t2 
    sub sp, sp, t3
    addi t2, t2, -3 

    mv t4, sp 
read_in_memory:
    beqz t1, print_from_memory
    read_int(t5)        
    sw t5, 0(t4)        
    addi t4, t4, 4      
    addi t1, t1, -1     
    j read_in_memory
print_from_memory:
    beqz t6, exit
    addi t4, t4, -4         
    lw t5, 0(t4)
    and t1, t5, t2
    beqz t1, condition               
    addi t6, t6, -1  
    j print_from_memory
condition:
    print_int(t5)    
    newline           
    addi t6, t6, -1  
    j print_from_memory
exit: