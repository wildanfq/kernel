.section .text
.global _start

_start:
    la sp, stack_top
    la t5, bss_start
    la t6, bss_end
bss_clear:
    sd zero, (t5)
    addi t5, t5, 8
    bltu t5, t6, bss_clear
    call kmain
1:
    j 1b

.section .bss
.align 4
stack_bottom:
    .skip 4096
stack_top: