j main
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
handler:
     csrrw  t0, uepc, zero
     addi   t0, t0, 28
     csrrw  zero, uepc, t0
     uret
main:
     la     t0, handler
     csrrw  zero, utvec, t0
     csrrsi zero, ustatus, 1

     li t1, 10
     li t2, 0
loopi:
    beq t1, t2, end
    li a7, 5
    ecall
    addi t2, t2, 1
    li a7, 1
    ecall
    newline
    j loopi
end: