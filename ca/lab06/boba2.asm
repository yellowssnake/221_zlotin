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
    
loop:
    read_int(t0)
    read_int(t1)
    read_int(t2)
    li s3, 2
    mul t4, t0, t0
    mul t5, t1, t1
    mul t6, t2, t2
    add t4, t4, t5
    add t4, t4, t6
    beqz t4, end
    li s0, 0
    add s0, s0, t0
    add s0, s0, t1
    add s0, s0, t2
    mul t0, t0, s3
    mul t1, t1, s3
    mul t2, t2, s3
    bgt t0, s0, bad
    bgt t1, s0, bad
    bgt t2, s0, bad
    print_char('Y')
    newline
    j loop
bad:
    print_char('N')
    newline
    j loop
end:
    newline
    