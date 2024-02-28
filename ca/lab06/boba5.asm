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
binary_search:
    sub t4, a3, a2
    #Получили сдвиг
    srli t4, t4, 1
    slli t4, t4, 2
    li t5, 0
    add t5, t5, a0
    li s10, 0
    add s10, s10, a2
    slli s10, s10, 2
    add t5, t5, s10
    add t5, t5, t4
    #Если старт больше начала
    bgt a2, a3, if_shit
    #Загружаем число из памяти
    lw s6, 0(t5)
    #Проверка на равенство
    beq a1, s6, if_equal
    #Проверка на больше
    bgt s6, a1, if_great
    #Проверка на меньше
    ble s6, a1, if_less
if_less:
    srli t4, t4, 2
    addi t4, t4, 1
    add t6, a2, t4
    mv a2, t6
    j binary_search
if_great:
    srli t4, t4, 2
    addi t4, t4, -1
    add t6, a2, t4
    mv a3, t6
    j binary_search
if_equal:
    srli t4, t4, 2
    li t6, 0
    add t6, t4, a2
    mv a0, t6
    jr ra
if_shit:
    li t1, -1
    mv a0, t1
    jr ra
