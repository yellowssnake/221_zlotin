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
    mv t0, a0
    mv t1, a1
    mv t2, a2
    mv t3, a3
    boab:
    	sub t4, t3, t2
    	#Получили сдвиг
    	srli t4, t4, 1
    	slli t4, t4, 2
    	li t5, 0
    	add t5, t5, t0
    	li s10, 0
    	add s10, s10, t2
    	slli s10, s10, 2
    	add t5, t5, s10
    	add t5, t5, t4
    	#Если старт больше начала
    	bgt t2, t3, if_shit
    	#Загружаем число из памяти
    	lw s6, 0(t5)
    	#Проверка на равенство
    	beq t1, s6, if_equal
    	#Проверка на больше
    	bgt s6, t1, if_great
    	#Проверка на меньше
    	ble s6, t1, if_less
if_less:
    srli t4, t4, 2
    addi t4, t4, 1
    add t6, t2, t4
    mv t2, t6
    j boab
if_great:
    srli t4, t4, 2
    addi t4, t4, -1
    add t6, t2, t4
    mv t3, t6
    j boab
if_equal:
    srli t4, t4, 2
    li t6, 0
    add t6, t4, t2
    mv a0, t6
    jr ra
if_shit:
    li t1, -1
    mv a0, t1
    jr ra
