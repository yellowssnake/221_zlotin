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
    read_int(t2)
    read_int(t3)
    fcvt.d.w ft1, t1
    fcvt.d.w ft2, t2
    fdiv.d ft3, ft1, ft2
    fmv.d fa0, ft3
    mv a0, t3
    jal func_trunc
    j printer
func_trunc:
    fmv.d ft1, fa0
    mv t3, a0
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
        fmv.d fa0, ft1
        jr ra
printer:
    li a7, 3
    ecall
    newline
