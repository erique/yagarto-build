SECTIONS
{
    . = 0x00000000;
    .text : { reset.o(.text) *(.text) }
    .rodata : { *(.rodata) }
    . = 0x00200000;
    .data : { *(.data) }
    __bss_start__ = .;
    .bss : { *(.bss) }
    __bss_end__ = .;
    . = 0x00200000 + 0x00010000;
    __top_stack__ = .;
}
