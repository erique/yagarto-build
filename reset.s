.extern main
    
.text
.code 32
.align 0

.global start
start:
    b       Reset
    b       0x00102008
    b       0x00102010
    b       0x00102018
    b       0x00102020
    b       0x00102028
    b       0x00102030
    b       0x00102038


Reset:
    ldr     sp, .stack_top
    bl      main

.stack_top:  .word  __top_stack__ 
