	.include "macrolib.s"
main:
    read_int (t1)
    read_int (t2)
    read_int (t3)
    read_int (t4)
    add t1, t1, t4
    add t2, t2, t3
    print_int(t1)
    newline
    print_int(t2)
    