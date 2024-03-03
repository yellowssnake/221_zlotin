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
.macro read_double(%x)
   li a7, 7
   ecall
   fmv.d %x, fa0
   .end_macro
   
   .macro print_double(%x)
   li a7, 3
   fmv.d fa0, %x
   ecall
   .end_macro
main:
    read_int(t0)
    li t1, 30000
    li t2, 0
    li t3, 1
    li s7, -3
    li s8, 4
    li s9, -4
    fcvt.d.w ft0, t2
    li t2, 4
    fcvt.d.w ft2, t2
    fcvt.d.w ft3, t3
    fcvt.d.w fs7, s8
    fcvt.d.w fs8, s7
    fcvt.d.w fs9, s9
calculate_pi:
    beqz t1, func_trunc
    fdiv.d ft4, ft2, ft3
    fdiv.d ft5, ft2, fs8
    fadd.d ft0, ft0, ft4
    fadd.d ft0, ft0, ft5
    fadd.d ft3, ft3, fs7
    fadd.d fs8, fs8, fs9
    addi t1, t1, -1
    j calculate_pi  
func_trunc:
    fmv.d ft1, ft0
    mv t3, t0
    li t4, 10
    li t5, 1
    loop:
      beqz t3, end
      mul t5, t5, t4
      addi t3, t3, -1
      j loop
    end:
        fcvt.d.w ft5, t5
        fmul.d ft1, ft1, ft5
        fcvt.w.d t1, ft1
        fcvt.d.w ft1, t1
        fdiv.d ft1, ft1, ft5
        j ends
ends:
    print_double(ft1)
    newline