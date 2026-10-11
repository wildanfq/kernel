ENTRY(_start)

SECTIONS {
    . = 0x80000000;

    .text : {
        *(.text .text.*)
        *(.init)
    }

    .rodata : {
        *(.rodata .rodata.*)
    }

    .data : {
        *(.data .data.*)
    }

    .bss : {
        PROVIDE(bss_start = .);
        *(.bss .bss.*)
        *(COMMON)
        PROVIDE(bss_end = .);
    }
}