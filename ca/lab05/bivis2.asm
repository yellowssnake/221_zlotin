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
    read_int (t1)
    li t2, 0
    li t3, 0
    li t5, 10
    bgez t1, loop
negate:
    neg t1, t1
loop:
    beq t1, t2, finish
    remu t4, t1, t5
    add t3, t3, t4
    div t1, t1, t5
    j loop
finish:
    print_int(t3)
    newline
    
