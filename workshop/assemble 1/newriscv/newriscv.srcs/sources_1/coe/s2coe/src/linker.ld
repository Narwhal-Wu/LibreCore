OUTPUT_FORMAT("elf32-littleriscv")  /* 指定输出格式为 32 位小端 RISC-V */
OUTPUT_ARCH(riscv)                  /* 指定架构 */
ENTRY(_start)                       /* 指定入口点 */

MEMORY {
    RAM : ORIGIN = 0x00000000, LENGTH = 0x10000  /* RAM 从 0 开始，64KB */
}

SECTIONS {
    . = ORIGIN(RAM);                /* 设置起始地址 */
    
    .text : {                      /* 代码段 */
        *(.text)                   /* 所有 .text 段 */
        *(.text.*)                 /* 支持多段（如 .text.startup） */
    } > RAM

    .rodata : {                    /* 只读数据段 */
        *(.rodata)
        *(.rodata.*)
    } > RAM

    .data : {                      /* 初始化数据段 */
        *(.data)
        *(.data.*)
    } > RAM

    .bss : {                       /* 未初始化数据段 */
        *(.bss)
        *(.bss.*)
        *(COMMON)
    } > RAM

    . = ALIGN(4);                  /* 4 字节对齐 */
    _end = .;                      /* 定义结束地址符号 */
}