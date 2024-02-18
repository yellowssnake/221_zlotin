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
    li t2, 1
    li t3, 0
    li t4, 0
loop:
    beq t1, t3, finish
    read_int(t5)
    mul t5, t5, t2
    add t4, t4, t5
    neg t2, t2
    addi t3, t3, 1
    j loop
finish:
    print_int(t4)   
    newline
