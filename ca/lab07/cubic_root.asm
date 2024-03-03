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
    read_double(ft0)
    read_double(ft1)
    li t0, 1
    fcvt.d.w ft2, t0
    li t0, 101
    fcvt.d.w ft3, t0
    li t0, 2
    fcvt.d.w ft4, t0
bin_search:
    fadd.d ft5, ft2, ft3
    fdiv.d ft5, ft5, ft4
    fmul.d ft6, ft5, ft5
    fmul.d ft6, ft6, ft5
    fsub.d fs0, ft6, ft0
    fabs.d fs1, fs0
    fle.d t1, ft1, fs1
    beqz t1, ends
    fle.d t1, ft6, ft0
    beqz t1, store_max
    j store_min
store_min:
    fmv.d ft2, ft5
    j bin_search
store_max:
    fmv.d ft3, ft5
    j bin_search
ends:
    print_double(ft5)
    newline