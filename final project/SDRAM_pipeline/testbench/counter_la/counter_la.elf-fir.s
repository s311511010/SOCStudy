	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/soc/final/testbench/counter_la" "fir.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB0:
	.file 1 "fir.c"
	.loc 1 3 61
	.cfi_startproc
	.loc 1 4 2
.LBB6:
	.loc 1 4 6
.LVL0:
	.loc 1 4 16
	lui	a5,%hi(.LANCHOR0)
	addi	a5,a5,%lo(.LANCHOR0)
	addi	a4,a5,44
	mv	a3,a4
.LVL1:
.L2:
	.loc 1 5 3 discriminator 3
	.loc 1 5 18 is_stmt 0 discriminator 3
	sw	zero,0(a5)
	.loc 1 6 3 is_stmt 1 discriminator 3
	.loc 1 6 19 is_stmt 0 discriminator 3
	sw	zero,0(a4)
	.loc 1 4 22 is_stmt 1 discriminator 3
	.loc 1 4 16 discriminator 3
	addi	a5,a5,4
	addi	a4,a4,4
	bne	a5,a3,.L2
.LBE6:
	.loc 1 8 1 is_stmt 0
	ret
	.cfi_endproc
.LFE0:
	.size	initfir, .-initfir
	.globl	__mulsi3
	.align	2
	.globl	firfilter
	.type	firfilter, @function
firfilter:
.LFB1:
	.loc 1 10 76 is_stmt 1
	.cfi_startproc
.LVL2:
	.loc 1 11 2
.LBB9:
	.loc 1 11 6
	.loc 1 11 20
.LBE9:
	.loc 1 10 76 is_stmt 0
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s1,20(sp)
	.cfi_offset 9, -12
	lui	s1,%hi(.LANCHOR0)
	addi	a2,s1,%lo(.LANCHOR0)
	addi	a1,s1,%lo(.LANCHOR0)
	sw	ra,28(sp)
	sw	s0,24(sp)
	sw	s2,16(sp)
	sw	s3,12(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	addi	a5,a2,36
	addi	s1,s1,%lo(.LANCHOR0)
.LVL3:
.L6:
.LBB10:
	.loc 1 12 3 is_stmt 1 discriminator 3
	.loc 1 12 18 is_stmt 0 discriminator 3
	lw	a3,0(a5)
	mv	a4,a5
	.loc 1 11 20 discriminator 3
	addi	a5,a5,-4
	.loc 1 12 18 discriminator 3
	sw	a3,8(a5)
	.loc 1 11 25 is_stmt 1 discriminator 3
	.loc 1 11 20 discriminator 3
	bne	a4,a2,.L6
.LBE10:
	.loc 1 14 2
	lui	s0,%hi(.LANCHOR1)
	addi	s0,s0,%lo(.LANCHOR1)
	.loc 1 14 17 is_stmt 0
	sw	a0,0(a1)
	.loc 1 16 2 is_stmt 1
.LVL4:
	.loc 1 17 2
.LBB11:
	.loc 1 17 6
	.loc 1 17 16
	addi	s3,s0,44
.LBE11:
	.loc 1 16 6 is_stmt 0
	li	s2,0
.LVL5:
.L7:
.LBB12:
	.loc 1 18 3 is_stmt 1 discriminator 3
	.loc 1 18 26 is_stmt 0 discriminator 3
	lw	a1,0(s1)
	lw	a0,0(s0)
	.loc 1 17 16 discriminator 3
	addi	s0,s0,4
	addi	s1,s1,4
	.loc 1 18 26 discriminator 3
	call	__mulsi3
.LVL6:
	.loc 1 18 16 discriminator 3
	add	s2,s2,a0
.LVL7:
	.loc 1 17 22 is_stmt 1 discriminator 3
	.loc 1 17 16 discriminator 3
	bne	s0,s3,.L7
.LBE12:
	.loc 1 20 2
	.loc 1 21 1 is_stmt 0
	lw	ra,28(sp)
	.cfi_restore 1
	lw	s0,24(sp)
	.cfi_restore 8
	lw	s1,20(sp)
	.cfi_restore 9
	lw	s3,12(sp)
	.cfi_restore 19
	mv	a0,s2
	lw	s2,16(sp)
	.cfi_restore 18
.LVL8:
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE1:
	.size	firfilter, .-firfilter
	.align	2
	.globl	fir
	.type	fir, @function
fir:
.LFB2:
	.loc 1 23 56 is_stmt 1
	.cfi_startproc
	.loc 1 24 2
.LBB20:
	.loc 1 4 2
.LBB21:
	.loc 1 4 6
.LVL9:
	.loc 1 4 16
.LBE21:
.LBE20:
	.loc 1 23 56 is_stmt 0
	addi	sp,sp,-64
	.cfi_def_cfa_offset 64
	lui	a5,%hi(.LANCHOR0)
	sw	s2,48(sp)
	.cfi_offset 18, -16
	addi	s2,a5,%lo(.LANCHOR0)
	sw	s7,28(sp)
	.cfi_offset 23, -36
	addi	s7,s2,44
	sw	s5,36(sp)
	sw	s9,20(sp)
	sw	ra,60(sp)
	.cfi_offset 21, -28
	.cfi_offset 25, -44
	.cfi_offset 1, -4
	addi	s9,a5,%lo(.LANCHOR0)
	sw	s0,56(sp)
	sw	s1,52(sp)
	sw	s3,44(sp)
	sw	s4,40(sp)
	sw	s6,32(sp)
	sw	s8,24(sp)
	sw	s10,16(sp)
	sw	s11,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	mv	s5,s7
	.loc 1 23 56
	mv	a4,s7
	addi	a5,a5,%lo(.LANCHOR0)
.LVL10:
.L12:
.LBB23:
.LBB22:
	.loc 1 5 3 is_stmt 1
	.loc 1 5 18 is_stmt 0
	sw	zero,0(a5)
	.loc 1 6 3 is_stmt 1
	.loc 1 6 19 is_stmt 0
	sw	zero,0(a4)
	.loc 1 4 22 is_stmt 1
	.loc 1 4 16
	addi	a5,a5,4
	addi	a4,a4,4
	bne	s7,a5,.L12
	lui	s6,%hi(.LANCHOR1)
	addi	s6,s6,%lo(.LANCHOR1)
	addi	s3,s6,44
	lui	s8,%hi(.LANCHOR0+36)
	mv	s4,s3
	addi	s10,s6,88
	addi	s8,s8,%lo(.LANCHOR0+36)
.L15:
.LBE22:
.LBE23:
.LBB24:
	.loc 1 26 3 discriminator 3
	.loc 1 26 21 is_stmt 0 discriminator 3
	lw	a2,0(s4)
.LVL11:
.LBB25:
.LBB26:
.LBB27:
	.loc 1 11 20 is_stmt 1 discriminator 3
	mv	a5,s8
.LVL12:
.L13:
	.loc 1 12 3
	.loc 1 12 18 is_stmt 0
	lw	a3,0(a5)
	mv	a4,a5
	.loc 1 11 20
	addi	a5,a5,-4
	.loc 1 12 18
	sw	a3,8(a5)
	.loc 1 11 25 is_stmt 1
	.loc 1 11 20
	bne	a4,s2,.L13
.LBE27:
	.loc 1 14 2
	.loc 1 14 17 is_stmt 0
	sw	a2,0(s9)
	.loc 1 16 2 is_stmt 1
.LVL13:
	.loc 1 17 2
.LBB28:
	.loc 1 17 6
	.loc 1 17 16
	mv	s0,s6
.LBE28:
	.loc 1 14 17 is_stmt 0
	mv	s1,s2
	.loc 1 16 6
	li	s11,0
.LVL14:
.L14:
.LBB29:
	.loc 1 18 3 is_stmt 1
	.loc 1 18 26 is_stmt 0
	lw	a1,0(s1)
	lw	a0,0(s0)
	.loc 1 17 16
	addi	s0,s0,4
	addi	s1,s1,4
	.loc 1 18 26
	call	__mulsi3
.LVL15:
	.loc 1 18 16
	add	s11,s11,a0
.LVL16:
	.loc 1 17 22 is_stmt 1
	.loc 1 17 16
	bne	s0,s3,.L14
.LBE29:
	.loc 1 20 2
.LVL17:
.LBE26:
.LBE25:
	.loc 1 26 19 is_stmt 0
	sw	s11,0(s5)
	.loc 1 25 22 is_stmt 1
	.loc 1 25 16
	addi	s4,s4,4
	addi	s5,s5,4
	bne	s4,s10,.L15
.LBE24:
	.loc 1 28 2
	.loc 1 29 1 is_stmt 0
	lw	ra,60(sp)
	.cfi_restore 1
	lw	s0,56(sp)
	.cfi_restore 8
	lw	s1,52(sp)
	.cfi_restore 9
	lw	s2,48(sp)
	.cfi_restore 18
	lw	s3,44(sp)
	.cfi_restore 19
	lw	s4,40(sp)
	.cfi_restore 20
	lw	s5,36(sp)
	.cfi_restore 21
	lw	s6,32(sp)
	.cfi_restore 22
	lw	s8,24(sp)
	.cfi_restore 24
	lw	s9,20(sp)
	.cfi_restore 25
	lw	s10,16(sp)
	.cfi_restore 26
	lw	s11,12(sp)
	.cfi_restore 27
	mv	a0,s7
	lw	s7,28(sp)
	.cfi_restore 23
	addi	sp,sp,64
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	fir, .-fir
	.globl	outputsignal
	.globl	inputsignal
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
	.type	inputsignal, @object
	.size	inputsignal, 44
inputsignal:
	.word	1
	.word	2
	.word	3
	.word	4
	.word	5
	.word	6
	.word	7
	.word	8
	.word	9
	.word	10
	.word	11
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.type	outputsignal, @object
	.size	outputsignal, 44
outputsignal:
	.zero	44
	.text
.Letext0:
	.file 2 "fir.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x21d
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF8
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL14
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0xa
	.4byte	0x3d
	.4byte	0x36
	.byte	0xb
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0xc
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0xd
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x2
	.4byte	.LASF3
	.byte	0x6
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x2
	.4byte	.LASF4
	.byte	0x7
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x2
	.4byte	.LASF5
	.byte	0x8
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	inputsignal
	.byte	0x2
	.4byte	.LASF6
	.byte	0x9
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0xe
	.string	"fir"
	.byte	0x1
	.byte	0x17
	.byte	0x33
	.4byte	0x133
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0x133
	.byte	0xf
	.4byte	.LBB24
	.4byte	.LBE24-.LBB24
	.4byte	0x10e
	.byte	0x3
	.string	"i"
	.byte	0x19
	.4byte	0x3d
	.byte	0x10
	.4byte	0x139
	.4byte	.LBB25
	.4byte	.LBE25-.LBB25
	.byte	0x1
	.byte	0x1a
	.byte	0x15
	.byte	0x5
	.4byte	0x14a
	.4byte	.LLST9
	.byte	0x1
	.4byte	0x156
	.4byte	.LLST10
	.byte	0x11
	.4byte	0x162
	.4byte	.LBB27
	.4byte	.LBE27-.LBB27
	.4byte	0xf0
	.byte	0x1
	.4byte	0x167
	.4byte	.LLST11
	.byte	0
	.byte	0x4
	.4byte	0x170
	.4byte	.LLRL12
	.byte	0x1
	.4byte	0x171
	.4byte	.LLST13
	.byte	0x6
	.4byte	.LVL15
	.4byte	0x217
	.byte	0
	.byte	0
	.byte	0
	.byte	0x12
	.4byte	0x184
	.4byte	.LBB20
	.4byte	.LLRL7
	.byte	0x1
	.byte	0x18
	.byte	0x2
	.byte	0x4
	.4byte	0x191
	.4byte	.LLRL7
	.byte	0x1
	.4byte	0x192
	.4byte	.LLST8
	.byte	0
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0x4
	.4byte	0x3d
	.byte	0x14
	.4byte	.LASF9
	.byte	0x1
	.byte	0xa
	.byte	0x32
	.4byte	0x3d
	.byte	0x1
	.4byte	0x184
	.byte	0x15
	.4byte	.LASF10
	.byte	0x1
	.byte	0xa
	.byte	0x40
	.4byte	0x3d
	.byte	0x16
	.4byte	.LASF7
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.4byte	0x3d
	.byte	0x17
	.4byte	0x170
	.byte	0x3
	.string	"i"
	.byte	0xb
	.4byte	0x3d
	.byte	0
	.byte	0x7
	.byte	0x3
	.string	"i"
	.byte	0x11
	.4byte	0x3d
	.byte	0x6
	.4byte	.LVL6
	.4byte	0x217
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF11
	.byte	0x1
	.byte	0x3
	.byte	0x33
	.byte	0x1
	.4byte	0x19c
	.byte	0x7
	.byte	0x3
	.string	"i"
	.byte	0x4
	.4byte	0x3d
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x184
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x1c7
	.byte	0x19
	.4byte	0x191
	.4byte	.LBB6
	.4byte	.LBE6-.LBB6
	.byte	0x1
	.4byte	0x192
	.4byte	.LLST0
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	0x139
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.4byte	0x217
	.byte	0x5
	.4byte	0x14a
	.4byte	.LLST1
	.byte	0x1
	.4byte	0x156
	.4byte	.LLST2
	.byte	0x1a
	.4byte	0x162
	.4byte	.LLRL3
	.4byte	0x203
	.byte	0x1
	.4byte	0x167
	.4byte	.LLST4
	.byte	0
	.byte	0x4
	.4byte	0x170
	.4byte	.LLRL5
	.byte	0x1
	.4byte	0x171
	.4byte	.LLST6
	.byte	0
	.byte	0
	.byte	0x1b
	.4byte	.LASF12
	.4byte	.LASF12
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x2
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
	.byte	0x3
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
	.byte	0x21
	.byte	0xa
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x4
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x48
	.byte	0
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x8
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
	.byte	0x9
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
	.byte	0xa
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xb
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
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
	.byte	0xe
	.byte	0x2e
	.byte	0x1
	.byte	0x3f
	.byte	0x19
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
	.byte	0xf
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
	.byte	0x10
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x11
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x12
	.byte	0x1d
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x52
	.byte	0x1
	.byte	0x55
	.byte	0x17
	.byte	0x58
	.byte	0xb
	.byte	0x59
	.byte	0xb
	.byte	0x57
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x13
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x14
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
	.byte	0x15
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
	.byte	0
	.byte	0
	.byte	0x16
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
	.byte	0x17
	.byte	0xb
	.byte	0x1
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
	.byte	0x20
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x19
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0x1a
	.byte	0xb
	.byte	0x1
	.byte	0x31
	.byte	0x13
	.byte	0x55
	.byte	0x17
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x1b
	.byte	0x2e
	.byte	0
	.byte	0x3f
	.byte	0x19
	.byte	0x3c
	.byte	0x19
	.byte	0x6e
	.byte	0xe
	.byte	0x3
	.byte	0xe
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
.LLST9:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL14
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL14
	.4byte	.LVL17
	.byte	0x1
	.byte	0x6b
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL11
	.4byte	.LVL12
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL14
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL9
	.4byte	.LVL10
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL1
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LFE1
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL8
	.byte	0x1
	.byte	0x62
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x2
	.byte	0x3a
	.byte	0x9f
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LVL5
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.Ldebug_loc3:
	.section	.debug_aranges,"",@progbits
	.4byte	0x2c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
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
.LLRL3:
	.byte	0x6
	.4byte	.LBB9
	.4byte	.LBE9
	.byte	0x6
	.4byte	.LBB10
	.4byte	.LBE10
	.byte	0
.LLRL5:
	.byte	0x6
	.4byte	.LBB11
	.4byte	.LBE11
	.byte	0x6
	.4byte	.LBB12
	.4byte	.LBE12
	.byte	0
.LLRL7:
	.byte	0x6
	.4byte	.LBB20
	.4byte	.LBE20
	.byte	0x6
	.4byte	.LBB23
	.4byte	.LBE23
	.byte	0
.LLRL12:
	.byte	0x6
	.4byte	.LBB28
	.4byte	.LBE28
	.byte	0x6
	.4byte	.LBB29
	.4byte	.LBE29
	.byte	0
.LLRL14:
	.byte	0x6
	.4byte	.LFB0
	.4byte	.LFE0
	.byte	0x6
	.4byte	.LFB1
	.4byte	.LFE1
	.byte	0x6
	.4byte	.LFB2
	.4byte	.LFE2
	.byte	0
.Ldebug_ranges3:
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF11:
	.string	"initfir"
.LASF8:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O2 -ffreestanding"
.LASF7:
	.string	"outputsample"
.LASF9:
	.string	"firfilter"
.LASF10:
	.string	"inputsample"
.LASF5:
	.string	"inputsignal"
.LASF12:
	.string	"__mulsi3"
.LASF6:
	.string	"outputsignal"
.LASF4:
	.string	"inputbuffer"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/soc/final/testbench/counter_la"
.LASF0:
	.string	"fir.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
