.data
output_str: .asciz "Hello, ACOS"

.text
main:
    la a0, output_str
    li a7, 4
    ecall
