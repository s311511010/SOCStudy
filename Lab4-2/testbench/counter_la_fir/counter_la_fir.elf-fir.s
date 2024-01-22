	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/soc/Lab4/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB316:
	.file 1 "fir.c"
	.loc 1 4 61
	.cfi_startproc
	.loc 1 6 2
.LBB2:
	.loc 1 6 7
.LVL0:
	.loc 1 6 20
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	.loc 1 6 11 is_stmt 0
	li	a5,0
	.loc 1 6 20
	li	a3,15
.LVL1:
.L2:
	.loc 1 7 3 is_stmt 1 discriminator 3
	.loc 1 7 8 is_stmt 0 discriminator 3
	sw	a5,0(a4)
	.loc 1 6 27 is_stmt 1 discriminator 3
	addi	a5,a5,1
.LVL2:
	.loc 1 6 20 discriminator 3
	addi	a4,a4,4
	bne	a5,a3,.L2
	lui	a4,%hi(.LANCHOR0)
	addi	a4,a4,%lo(.LANCHOR0)
	addi	a5,a4,60
.LVL3:
	addi	a4,a4,120
.L3:
.LBE2:
.LBB3:
	.loc 1 10 3 discriminator 3
	.loc 1 10 19 is_stmt 0 discriminator 3
	sw	zero,0(a5)
	.loc 1 9 27 is_stmt 1 discriminator 3
	.loc 1 9 20 discriminator 3
	addi	a5,a5,4
	bne	a5,a4,.L3
.LBE3:
	.loc 1 12 1 is_stmt 0
	ret
	.cfi_endproc
.LFE316:
	.size	initfir, .-initfir
	.align	2
	.globl	WB_read
	.type	WB_read, @function
WB_read:
.LFB317:
	.loc 1 15 74 is_stmt 1
	.cfi_startproc
.LVL4:
	.loc 1 16 2
	.loc 1 17 1 is_stmt 0
	lw	a0,0(a0)
.LVL5:
	ret
	.cfi_endproc
.LFE317:
	.size	WB_read, .-WB_read
	.align	2
	.globl	WB_write
	.type	WB_write, @function
WB_write:
.LFB318:
	.loc 1 19 92 is_stmt 1
	.cfi_startproc
.LVL6:
	.loc 1 20 2
	.loc 1 20 15 is_stmt 0
	sw	a1,0(a0)
	.loc 1 21 1
	ret
	.cfi_endproc
.LFE318:
	.size	WB_write, .-WB_write
	.align	2
	.globl	fir_HW
	.type	fir_HW, @function
fir_HW:
.LFB319:
	.loc 1 24 72 is_stmt 1
	.cfi_startproc
.LVL7:
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	ra,12(sp)
	.cfi_offset 1, -4
	.loc 1 25 2
	call	initfir
.LVL8:
	.loc 1 27 2
	.loc 1 28 2
	.loc 1 31 2
	.loc 1 32 2
	.loc 1 32 17 is_stmt 0
	li	a5,805306368
	lw	a5,0(a5)
.LVL9:
	.loc 1 33 2 is_stmt 1
	.loc 1 33 36 is_stmt 0
	andi	a5,a5,4
.LVL10:
.L9:
	.loc 1 33 36 is_stmt 1
	beq	a5,zero,.L9
	.loc 1 45 37
	.loc 1 51 2
.LVL11:
.LBB22:
.LBB23:
	.loc 1 20 2
	.loc 1 20 15 is_stmt 0
	li	a5,805306368
.LVL12:
	li	a4,15
	sw	a4,16(a5)
.LVL13:
.LBE23:
.LBE22:
	.loc 1 52 12 is_stmt 1
	lui	a5,%hi(.LANCHOR1)
.LVL14:
	addi	a2,a5,%lo(.LANCHOR1)
	addi	a0,a2,44
.LBB25:
.LBB24:
	.loc 1 20 15 is_stmt 0
	addi	a5,a5,%lo(.LANCHOR1)
	li	a1,805306368
.LVL15:
	addi	a1,a1,32
.LVL16:
	sub	a1,a1,a2
.LVL17:
.L10:
.LBE24:
.LBE25:
	.loc 1 53 3 is_stmt 1 discriminator 3
	lw	a3,0(a5)
.LVL18:
.LBB26:
.LBB27:
	.loc 1 20 2 discriminator 3
	.loc 1 20 15 is_stmt 0 discriminator 3
	add	a4,a1,a5
.LVL19:
	sw	a3,0(a4)
.LVL20:
.LBE27:
.LBE26:
	.loc 1 52 18 is_stmt 1 discriminator 3
	.loc 1 52 12 discriminator 3
	addi	a5,a5,4
	bne	a5,a0,.L10
	.loc 1 58 2
.LVL21:
.LBB28:
.LBB29:
	.loc 1 16 2
.LBE29:
.LBE28:
	.loc 1 59 2
.LBB31:
.LBB30:
	.loc 1 16 9 is_stmt 0
	li	a5,805306368
.LBE30:
.LBE31:
	.loc 1 59 4
	lw	a4,16(a5)
	li	a5,15
	beq	a4,a5,.L11
	.loc 1 60 3 is_stmt 1
	.loc 1 60 18 is_stmt 0
	lui	a5,%hi(.LANCHOR0+60)
	li	a4,-2
	sw	a4,%lo(.LANCHOR0+60)(a5)
	.loc 1 61 3 is_stmt 1
.LVL22:
.L12:
	.loc 1 100 1 is_stmt 0
	lui	a0,%hi(.LANCHOR0+60)
	addi	a0,a0,%lo(.LANCHOR0+60)
	lw	ra,12(sp)
	.cfi_remember_state
	.cfi_restore 1
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
.L11:
	.cfi_restore_state
	.loc 1 65 3 is_stmt 1
.LVL23:
.LBB32:
.LBB33:
	.loc 1 16 2
.LBE33:
.LBE32:
	.loc 1 66 3
.LBB35:
.LBB34:
	.loc 1 16 9 is_stmt 0
	add	a5,a1,a2
.LVL24:
.LBE34:
.LBE35:
	.loc 1 66 5
	lw	a4,0(a2)
	lw	a5,0(a5)
.LVL25:
	bne	a4,a5,.L21
	.loc 1 64 18 is_stmt 1 discriminator 2
	.loc 1 64 12 discriminator 2
	addi	a2,a2,4
	bne	a2,a0,.L11
	.loc 1 73 2
.LVL26:
.LBB36:
.LBB37:
	.loc 1 20 2
	.loc 1 20 15 is_stmt 0
	li	a5,805306368
.LVL27:
	li	a4,1
	sw	a4,0(a5)
.LVL28:
.LBE37:
.LBE36:
	.loc 1 74 2 is_stmt 1
	.loc 1 74 36 is_stmt 0
	li	a5,637534208
	li	a4,10813440
	sw	a4,12(a5)
	.loc 1 77 5 is_stmt 1
.LVL29:
	.loc 1 77 28
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a4,a5,60
	mv	a1,a4
.LBB38:
.LBB39:
	.loc 1 20 15 is_stmt 0
	li	a3,805306368
.LVL30:
.L14:
.LBE39:
.LBE38:
	.loc 1 79 3 is_stmt 1
	.loc 1 83 3
	lw	a2,0(a5)
.LVL31:
.LBB41:
.LBB40:
	.loc 1 20 2
	.loc 1 20 15 is_stmt 0
	sw	a2,128(a3)
.LVL32:
.LBE40:
.LBE41:
	.loc 1 84 3 is_stmt 1
	.loc 1 87 3
.LBB42:
.LBB43:
	.loc 1 16 2
	.loc 1 16 9 is_stmt 0
	lw	a2,132(a3)
.LVL33:
.LBE43:
.LBE42:
	.loc 1 88 3 is_stmt 1
	.loc 1 88 35 is_stmt 0
	sw	a2,0(a4)
	.loc 1 89 3 is_stmt 1
	.loc 1 77 28
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a1,a5,.L14
	.loc 1 93 2
.LVL34:
.LBB44:
.LBB45:
	.loc 1 16 2
.LBE45:
.LBE44:
	.loc 1 94 2
.LBB47:
.LBB46:
	.loc 1 16 9 is_stmt 0
	li	a5,805306368
.LBE46:
.LBE47:
	.loc 1 94 22
	lw	a5,0(a5)
	srai	a5,a5,1
	.loc 1 94 28
	andi	a5,a5,3
	.loc 1 94 4
	li	a4,3
	beq	a5,a4,.L12
	.loc 1 95 3 is_stmt 1
	.loc 1 95 19 is_stmt 0
	lui	a5,%hi(.LANCHOR0+60)
	li	a4,-3
	sw	a4,%lo(.LANCHOR0+60)(a5)
	.loc 1 96 3 is_stmt 1
	.loc 1 96 10 is_stmt 0
	j	.L12
.LVL35:
.L21:
	.loc 1 67 4 is_stmt 1
	.loc 1 67 19 is_stmt 0
	lui	a5,%hi(.LANCHOR0+60)
.LVL36:
	li	a4,-2
	sw	a4,%lo(.LANCHOR0+60)(a5)
.LVL37:
	.loc 1 68 4 is_stmt 1
	.loc 1 68 11 is_stmt 0
	j	.L12
	.cfi_endproc
.LFE319:
	.size	fir_HW, .-fir_HW
	.globl	x
	.globl	outputsignal
	.globl	inputbuffer
	.globl	taps
	.data
	.align	2
	.set	.LANCHOR1,. + 0
	.type	taps, @object
	.size	taps, 44
taps:
	.word	0
	.word	-10
	.word	-9
	.word	23
	.word	56
	.word	63
	.word	56
	.word	23
	.word	-9
	.word	-10
	.word	0
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	x, @object
	.size	x, 60
x:
	.zero	60
	.type	outputsignal, @object
	.size	outputsignal, 60
outputsignal:
	.zero	60
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.text
.Letext0:
	.file 2 "fir.h"
	.file 3 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x324
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xd
	.4byte	.LASF20
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL21
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x9
	.4byte	0x3d
	.4byte	0x36
	.byte	0xa
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0xe
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x4
	.4byte	.LASF3
	.byte	0x9
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x4
	.4byte	.LASF4
	.byte	0xa
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x9
	.4byte	0x3d
	.4byte	0x74
	.byte	0xa
	.4byte	0x36
	.byte	0xe
	.byte	0
	.byte	0x4
	.4byte	.LASF5
	.byte	0xb
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0xf
	.string	"x"
	.byte	0x2
	.byte	0xc
	.byte	0x5
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	x
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0x10
	.4byte	.LASF21
	.byte	0x3
	.byte	0x34
	.byte	0x1b
	.4byte	0xca
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0x11
	.4byte	.LASF22
	.byte	0x1
	.byte	0x18
	.byte	0x33
	.4byte	0x25f
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.byte	0x1
	.byte	0x9c
	.4byte	0x25f
	.byte	0x12
	.4byte	.LASF23
	.byte	0x1
	.byte	0x18
	.byte	0x3e
	.4byte	0x3d
	.4byte	.LLST2
	.byte	0x13
	.4byte	.LASF14
	.byte	0x1
	.byte	0x1b
	.byte	0x7
	.4byte	0x25f
	.4byte	0x30000000
	.byte	0x5
	.4byte	.LASF15
	.byte	0x1c
	.4byte	0x3d
	.4byte	.LLST3
	.byte	0x14
	.4byte	.LASF19
	.byte	0x1
	.byte	0x26
	.byte	0x6
	.4byte	0x3d
	.byte	0xb
	.string	"i"
	.byte	0x27
	.byte	0x6
	.4byte	0x3d
	.4byte	.LLST4
	.byte	0x5
	.4byte	.LASF16
	.byte	0x28
	.4byte	0x3d
	.4byte	.LLST5
	.byte	0x5
	.4byte	.LASF17
	.byte	0x29
	.4byte	0x3d
	.4byte	.LLST5
	.byte	0x3
	.4byte	0x265
	.4byte	.LBB22
	.4byte	.LLRL7
	.byte	0x33
	.byte	0x2
	.4byte	0x17b
	.byte	0x1
	.4byte	0x27d
	.4byte	.LLST8
	.byte	0x1
	.4byte	0x272
	.4byte	.LLST9
	.byte	0
	.byte	0x6
	.4byte	0x265
	.4byte	.LBB26
	.4byte	.LBE26-.LBB26
	.byte	0x35
	.byte	0x3
	.4byte	0x1a1
	.byte	0x1
	.4byte	0x27d
	.4byte	.LLST10
	.byte	0x1
	.4byte	0x272
	.4byte	.LLST11
	.byte	0
	.byte	0x3
	.4byte	0x289
	.4byte	.LBB28
	.4byte	.LLRL12
	.byte	0x3a
	.byte	0x13
	.4byte	0x1ba
	.byte	0x7
	.4byte	0x29a
	.byte	0
	.byte	0x3
	.4byte	0x289
	.4byte	.LBB32
	.4byte	.LLRL13
	.byte	0x41
	.byte	0x14
	.4byte	0x1d3
	.byte	0x7
	.4byte	0x29a
	.byte	0
	.byte	0x6
	.4byte	0x265
	.4byte	.LBB36
	.4byte	.LBE36-.LBB36
	.byte	0x49
	.byte	0x2
	.4byte	0x1f9
	.byte	0x1
	.4byte	0x27d
	.4byte	.LLST14
	.byte	0x1
	.4byte	0x272
	.4byte	.LLST15
	.byte	0
	.byte	0x3
	.4byte	0x265
	.4byte	.LBB38
	.4byte	.LLRL16
	.byte	0x53
	.byte	0x3
	.4byte	0x21f
	.byte	0x1
	.4byte	0x27d
	.4byte	.LLST17
	.byte	0x1
	.4byte	0x272
	.4byte	.LLST18
	.byte	0
	.byte	0x6
	.4byte	0x289
	.4byte	.LBB42
	.4byte	.LBE42-.LBB42
	.byte	0x57
	.byte	0x14
	.4byte	0x23c
	.byte	0x1
	.4byte	0x29a
	.4byte	.LLST19
	.byte	0
	.byte	0x3
	.4byte	0x289
	.4byte	.LBB44
	.4byte	.LLRL20
	.byte	0x5d
	.byte	0x13
	.4byte	0x255
	.byte	0x7
	.4byte	0x29a
	.byte	0
	.byte	0x15
	.4byte	.LVL8
	.4byte	0x2a6
	.byte	0
	.byte	0x16
	.byte	0x4
	.4byte	0x3d
	.byte	0x17
	.4byte	.LASF24
	.byte	0x1
	.byte	0x13
	.byte	0x33
	.byte	0x1
	.4byte	0x289
	.byte	0x8
	.4byte	.LASF14
	.byte	0x13
	.byte	0x41
	.4byte	0x25f
	.byte	0x8
	.4byte	.LASF18
	.byte	0x13
	.byte	0x51
	.4byte	0x3d
	.byte	0
	.byte	0x18
	.4byte	.LASF25
	.byte	0x1
	.byte	0xf
	.byte	0x32
	.4byte	0x3d
	.byte	0x1
	.4byte	0x2a6
	.byte	0x8
	.4byte	.LASF14
	.byte	0xf
	.byte	0x3f
	.4byte	0x25f
	.byte	0
	.byte	0x19
	.4byte	.LASF26
	.byte	0x1
	.byte	0x4
	.byte	0x33
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x2ec
	.byte	0x1a
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x2d7
	.byte	0xb
	.string	"i"
	.byte	0x6
	.byte	0xb
	.4byte	0x3d
	.4byte	.LLST0
	.byte	0
	.byte	0x1b
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x1c
	.string	"i"
	.byte	0x1
	.byte	0x9
	.byte	0xb
	.4byte	0x3d
	.byte	0
	.byte	0
	.byte	0x1d
	.4byte	0x289
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x309
	.byte	0x1
	.4byte	0x29a
	.4byte	.LLST1
	.byte	0
	.byte	0x1e
	.4byte	0x265
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.byte	0xc
	.4byte	0x272
	.byte	0x1
	.byte	0x5a
	.byte	0xc
	.4byte	0x27d
	.byte	0x1
	.byte	0x5b
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0xe
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0x21
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0x21
	.byte	0x1
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xa
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xc
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0xd
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0xe
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x1f
	.byte	0x1b
	.byte	0x1f
	.byte	0x55
	.byte	0x17
	.byte	0x11
	.byte	0x1
	.byte	0x10
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x24
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0
	.byte	0
	.byte	0xf
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0x19
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x10
	.byte	0x16
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x1c
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x16
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x17
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x18
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x27
	.byte	0x19
	.byte	0x49
	.byte	0x13
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1c
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1d
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1e
	.byte	0x2e
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x40
	.byte	0x18
	.byte	0x7a
	.byte	0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST2:
	.byte	0x7
	.4byte	.LVL7
	.4byte	.LVL8-1
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL8-1
	.4byte	.LFE319
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL12
	.byte	0x3
	.byte	0x48
	.byte	0x49
	.byte	0x24
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL14
	.byte	0x2
	.byte	0x7f
	.byte	0
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL15
	.byte	0x3
	.byte	0x48
	.byte	0x49
	.byte	0x24
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL16
	.byte	0x2
	.byte	0x7b
	.byte	0
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x3
	.byte	0x48
	.byte	0x49
	.byte	0x24
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL22
	.byte	0x5
	.byte	0xc
	.4byte	0x30000010
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL24
	.byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x7c
	.byte	0
	.byte	0x22
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x2
	.byte	0x7f
	.byte	0
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL27
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL28
	.byte	0x7
	.byte	0x7b
	.byte	0
	.byte	0x7c
	.byte	0
	.byte	0x22
	.byte	0x34
	.byte	0x1c
	.byte	0x7
	.4byte	.LVL33
	.4byte	.LVL34
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x2
	.byte	0x7d
	.byte	0
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL36
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL36
	.4byte	.LVL37
	.byte	0x5
	.byte	0x7b
	.byte	0
	.byte	0x7c
	.byte	0
	.byte	0x22
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL17
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL30
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x2
	.byte	0x3f
	.byte	0x9f
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL13
	.byte	0x6
	.byte	0xc
	.4byte	0x30000010
	.byte	0x9f
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL20
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL18
	.4byte	.LVL19
	.byte	0x6
	.byte	0x7b
	.byte	0
	.byte	0x7f
	.byte	0
	.byte	0x22
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL20
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL28
	.byte	0x2
	.byte	0x31
	.byte	0x9f
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL26
	.4byte	.LVL28
	.byte	0x4
	.byte	0x48
	.byte	0x49
	.byte	0x24
	.byte	0x9f
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST18:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x6
	.byte	0xc
	.4byte	0x30000080
	.byte	0x9f
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL32
	.4byte	.LVL33
	.byte	0x6
	.byte	0xc
	.4byte	0x30000084
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LFE317
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x34
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.4byte	0
	.4byte	0
	.section	.debug_rnglists,"",@progbits
.Ldebug_ranges0:
	.4byte	.Ldebug_ranges3-.Ldebug_ranges2
.Ldebug_ranges2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.LLRL7:
	.byte	0x6
	.4byte	.LBB22
	.4byte	.LBE22
	.byte	0x6
	.4byte	.LBB25
	.4byte	.LBE25
	.byte	0
.LLRL12:
	.byte	0x6
	.4byte	.LBB28
	.4byte	.LBE28
	.byte	0x6
	.4byte	.LBB31
	.4byte	.LBE31
	.byte	0
.LLRL13:
	.byte	0x6
	.4byte	.LBB32
	.4byte	.LBE32
	.byte	0x6
	.4byte	.LBB35
	.4byte	.LBE35
	.byte	0
.LLRL16:
	.byte	0x6
	.4byte	.LBB38
	.4byte	.LBE38
	.byte	0x6
	.4byte	.LBB41
	.4byte	.LBE41
	.byte	0
.LLRL20:
	.byte	0x6
	.4byte	.LBB44
	.4byte	.LBE44
	.byte	0x6
	.4byte	.LBB47
	.4byte	.LBE47
	.byte	0
.LLRL21:
	.byte	0x6
	.4byte	.LFB316
	.4byte	.LFE316
	.byte	0x6
	.4byte	.LFB317
	.4byte	.LFE317
	.byte	0x6
	.4byte	.LFB318
	.4byte	.LFE318
	.byte	0x6
	.4byte	.LFB319
	.4byte	.LFE319
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF15:
	.string	"WB_return_data"
.LASF26:
	.string	"initfir"
.LASF20:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O1 -ffreestanding"
.LASF25:
	.string	"WB_read"
.LASF17:
	.string	"input_data_count"
.LASF19:
	.string	"WB_return_data_last_one"
.LASF10:
	.string	"unsigned char"
.LASF12:
	.string	"long unsigned int"
.LASF11:
	.string	"short unsigned int"
.LASF21:
	.string	"uint32_t"
.LASF18:
	.string	"write_data"
.LASF14:
	.string	"WB_address"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF24:
	.string	"WB_write"
.LASF13:
	.string	"long long unsigned int"
.LASF22:
	.string	"fir_HW"
.LASF23:
	.string	"iteration"
.LASF16:
	.string	"output_data_count"
.LASF5:
	.string	"outputsignal"
.LASF9:
	.string	"long long int"
.LASF7:
	.string	"short int"
.LASF4:
	.string	"inputbuffer"
.LASF8:
	.string	"long int"
.LASF6:
	.string	"signed char"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/soc/Lab4/lab-caravel_fir/testbench/counter_la_fir"
.LASF0:
	.string	"fir.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
