	.file	"fir.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/soc/Lab4/lab-caravel_fir/testbench/counter_la_fir" "fir.c"
	.globl	taps
	.data
	.align	2
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
	.globl	inputbuffer
	.bss
	.align	2
	.type	inputbuffer, @object
	.size	inputbuffer, 44
inputbuffer:
	.zero	44
	.globl	outputsignal
	.align	2
	.type	outputsignal, @object
	.size	outputsignal, 60
outputsignal:
	.zero	60
	.globl	x
	.align	2
	.type	x, @object
	.size	x, 60
x:
	.zero	60
	.text
	.align	2
	.type	flush_cpu_icache, @function
flush_cpu_icache:
.LFB21:
	.file 1 "../../firmware/system.h"
	.loc 1 15 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 26 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE21:
	.size	flush_cpu_icache, .-flush_cpu_icache
	.align	2
	.type	flush_cpu_dcache, @function
flush_cpu_dcache:
.LFB22:
	.loc 1 29 1
	.cfi_startproc
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,12(sp)
	.cfi_offset 8, -4
	addi	s0,sp,16
	.cfi_def_cfa 8, 0
	.loc 1 33 1
	nop
	lw	s0,12(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 16
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE22:
	.size	flush_cpu_dcache, .-flush_cpu_dcache
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	initfir
	.type	initfir, @function
initfir:
.LFB316:
	.file 2 "fir.c"
	.loc 2 4 61
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
.LBB2:
	.loc 2 6 11
	sw	zero,-20(s0)
	.loc 2 6 2
	j	.L4
.L5:
	.loc 2 7 8 discriminator 3
	lui	a5,%hi(x)
	addi	a4,a5,%lo(x)
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 6 27 discriminator 3
	lw	a5,-20(s0)
	addi	a5,a5,1
	sw	a5,-20(s0)
.L4:
	.loc 2 6 20 discriminator 1
	lw	a4,-20(s0)
	li	a5,14
	ble	a4,a5,.L5
.LBE2:
.LBB3:
	.loc 2 9 11
	sw	zero,-24(s0)
	.loc 2 9 2
	j	.L6
.L7:
	.loc 2 10 19 discriminator 3
	lui	a5,%hi(outputsignal)
	addi	a4,a5,%lo(outputsignal)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	sw	zero,0(a5)
	.loc 2 9 27 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L6:
	.loc 2 9 20 discriminator 1
	lw	a4,-24(s0)
	li	a5,14
	ble	a4,a5,.L7
.LBE3:
	.loc 2 12 1
	nop
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE316:
	.size	initfir, .-initfir
	.align	2
	.globl	WB_read
	.type	WB_read, @function
WB_read:
.LFB317:
	.loc 2 29 74
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	.loc 2 30 9
	lw	a5,-20(s0)
	lw	a5,0(a5)
	.loc 2 31 1
	mv	a0,a5
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE317:
	.size	WB_read, .-WB_read
	.align	2
	.globl	WB_write
	.type	WB_write, @function
WB_write:
.LFB318:
	.loc 2 33 92
	.cfi_startproc
	addi	sp,sp,-32
	.cfi_def_cfa_offset 32
	sw	s0,28(sp)
	.cfi_offset 8, -4
	addi	s0,sp,32
	.cfi_def_cfa 8, 0
	sw	a0,-20(s0)
	sw	a1,-24(s0)
	.loc 2 34 15
	lw	a5,-20(s0)
	lw	a4,-24(s0)
	sw	a4,0(a5)
	.loc 2 35 1
	nop
	lw	s0,28(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 32
	addi	sp,sp,32
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE318:
	.size	WB_write, .-WB_write
	.align	2
	.globl	fir_HW
	.type	fir_HW, @function
fir_HW:
.LFB319:
	.loc 2 38 72
	.cfi_startproc
	addi	sp,sp,-48
	.cfi_def_cfa_offset 48
	sw	ra,44(sp)
	sw	s0,40(sp)
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	addi	s0,sp,48
	.cfi_def_cfa 8, 0
	sw	a0,-36(s0)
	.loc 2 39 2
	call	initfir
	.loc 2 57 6
	sw	zero,-28(s0)
	.loc 2 58 6
	sw	zero,-32(s0)
	.loc 2 61 19
	li	a0,805306368
	call	WB_read
	sw	a0,-20(s0)
	.loc 2 62 8
	j	.L12
.L13:
	.loc 2 63 20
	li	a0,805306368
	call	WB_read
	sw	a0,-20(s0)
.L12:
	.loc 2 62 37
	lw	a5,-20(s0)
	andi	a5,a5,4
	beq	a5,zero,.L13
	.loc 2 70 2
	li	a1,15
	li	a5,805306368
	addi	a0,a5,16
	call	WB_write
	.loc 2 71 7
	sw	zero,-24(s0)
	.loc 2 71 2
	j	.L14
.L15:
	.loc 2 72 35 discriminator 3
	lw	a4,-24(s0)
	li	a5,201326592
	addi	a5,a5,8
	add	a5,a4,a5
	slli	a5,a5,2
	.loc 2 72 3 discriminator 3
	mv	a3,a5
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	mv	a0,a3
	call	WB_write
	.loc 2 71 18 discriminator 3
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L14:
	.loc 2 71 12 discriminator 1
	lw	a4,-24(s0)
	li	a5,10
	ble	a4,a5,.L15
	.loc 2 77 19
	li	a5,805306368
	addi	a0,a5,16
	call	WB_read
	sw	a0,-20(s0)
	.loc 2 78 4
	lw	a4,-20(s0)
	li	a5,15
	beq	a4,a5,.L16
	.loc 2 79 18
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	li	a4,-2
	sw	a4,0(a5)
	.loc 2 80 10
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	j	.L17
.L16:
	.loc 2 82 7
	sw	zero,-24(s0)
	.loc 2 82 2
	j	.L18
.L20:
	.loc 2 83 51
	lw	a4,-24(s0)
	li	a5,201326592
	addi	a5,a5,8
	add	a5,a4,a5
	slli	a5,a5,2
	.loc 2 83 20
	mv	a0,a5
	call	WB_read
	sw	a0,-20(s0)
	.loc 2 84 28
	lui	a5,%hi(taps)
	addi	a4,a5,%lo(taps)
	lw	a5,-24(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	.loc 2 84 5
	lw	a4,-20(s0)
	beq	a4,a5,.L19
	.loc 2 85 19
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	li	a4,-2
	sw	a4,0(a5)
	.loc 2 86 11
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	j	.L17
.L19:
	.loc 2 82 18 discriminator 2
	lw	a5,-24(s0)
	addi	a5,a5,1
	sw	a5,-24(s0)
.L18:
	.loc 2 82 12 discriminator 1
	lw	a4,-24(s0)
	li	a5,10
	ble	a4,a5,.L20
	.loc 2 95 2
	li	a1,1
	li	a0,805306368
	call	WB_write
	.loc 2 97 3
	li	a5,637534208
	addi	a5,a5,12
	.loc 2 97 36
	li	a4,10813440
	sw	a4,0(a5)
	.loc 2 111 10
	j	.L21
.L23:
	.loc 2 150 5
	lw	a4,-32(s0)
	li	a5,15
	bne	a4,a5,.L22
	.loc 2 151 20
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	li	a4,-3
	sw	a4,0(a5)
	.loc 2 152 11
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	j	.L17
.L22:
	.loc 2 154 3
	lui	a5,%hi(x)
	addi	a4,a5,%lo(x)
	lw	a5,-32(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a5,0(a5)
	mv	a1,a5
	li	a5,805306368
	addi	a0,a5,128
	call	WB_write
	.loc 2 155 20
	lw	a5,-32(s0)
	addi	a5,a5,1
	sw	a5,-32(s0)
	.loc 2 158 20
	li	a5,805306368
	addi	a0,a5,132
	call	WB_read
	sw	a0,-20(s0)
	.loc 2 159 35
	lui	a5,%hi(outputsignal)
	addi	a4,a5,%lo(outputsignal)
	lw	a5,-28(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	lw	a4,-20(s0)
	sw	a4,0(a5)
	.loc 2 160 21
	lw	a5,-28(s0)
	addi	a5,a5,1
	sw	a5,-28(s0)
.L21:
	.loc 2 111 28
	lw	a4,-32(s0)
	li	a5,14
	ble	a4,a5,.L23
	.loc 2 171 19
	li	a0,805306368
	call	WB_read
	sw	a0,-20(s0)
	.loc 2 172 22
	lw	a5,-20(s0)
	srai	a5,a5,1
	.loc 2 172 28
	andi	a4,a5,3
	.loc 2 172 4
	li	a5,3
	beq	a4,a5,.L24
	.loc 2 173 19
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	li	a4,-3
	sw	a4,0(a5)
	.loc 2 174 10
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
	j	.L17
.L24:
	.loc 2 178 9
	lui	a5,%hi(outputsignal)
	addi	a5,a5,%lo(outputsignal)
.L17:
	.loc 2 179 1
	mv	a0,a5
	lw	ra,44(sp)
	.cfi_restore 1
	lw	s0,40(sp)
	.cfi_restore 8
	.cfi_def_cfa 2, 48
	addi	sp,sp,48
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE319:
	.size	fir_HW, .-fir_HW
	.text
.Letext0:
	.file 3 "fir.h"
	.file 4 "/opt/riscv/lib/gcc/riscv32-unknown-elf/12.1.0/include/stdint-gcc.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x206
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x9
	.4byte	.LASF24
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL0
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0x6
	.4byte	0x3d
	.4byte	0x36
	.byte	0x7
	.4byte	0x36
	.byte	0xa
	.byte	0
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0xa
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x3
	.4byte	.LASF3
	.byte	0x9
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	taps
	.byte	0x3
	.4byte	.LASF4
	.byte	0xa
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	inputbuffer
	.byte	0x6
	.4byte	0x3d
	.4byte	0x74
	.byte	0x7
	.4byte	0x36
	.byte	0xe
	.byte	0
	.byte	0x3
	.4byte	.LASF5
	.byte	0xc
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	outputsignal
	.byte	0xb
	.string	"x"
	.byte	0x3
	.byte	0xd
	.byte	0x5
	.4byte	0x64
	.byte	0x5
	.byte	0x3
	.4byte	x
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.4byte	.LASF6
	.byte	0x1
	.byte	0x2
	.byte	0x5
	.4byte	.LASF7
	.byte	0x1
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.byte	0x1
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.4byte	.LASF10
	.byte	0x1
	.byte	0x2
	.byte	0x7
	.4byte	.LASF11
	.byte	0xc
	.4byte	.LASF25
	.byte	0x4
	.byte	0x34
	.byte	0x1b
	.4byte	0xca
	.byte	0x1
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.byte	0x1
	.byte	0x8
	.byte	0x7
	.4byte	.LASF13
	.byte	0xd
	.4byte	.LASF20
	.byte	0x2
	.byte	0x26
	.byte	0x33
	.4byte	0x140
	.4byte	.LFB319
	.4byte	.LFE319-.LFB319
	.byte	0x1
	.byte	0x9c
	.4byte	0x140
	.byte	0x2
	.4byte	.LASF17
	.byte	0x26
	.byte	0x3e
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x4
	.4byte	.LASF14
	.byte	0x36
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0xe
	.4byte	.LASF26
	.byte	0x2
	.byte	0x37
	.byte	0x6
	.4byte	0x3d
	.byte	0x5
	.string	"i"
	.byte	0x38
	.byte	0x6
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x4
	.4byte	.LASF15
	.byte	0x39
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x4
	.4byte	.LASF16
	.byte	0x3a
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x60
	.byte	0
	.byte	0xf
	.byte	0x4
	.4byte	0x3d
	.byte	0x10
	.4byte	.LASF27
	.byte	0x2
	.byte	0x21
	.byte	0x33
	.4byte	.LFB318
	.4byte	.LFE318-.LFB318
	.byte	0x1
	.byte	0x9c
	.4byte	0x179
	.byte	0x2
	.4byte	.LASF18
	.byte	0x21
	.byte	0x41
	.4byte	0x140
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x2
	.4byte	.LASF19
	.byte	0x21
	.byte	0x51
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0x11
	.4byte	.LASF21
	.byte	0x2
	.byte	0x1d
	.byte	0x32
	.4byte	0x3d
	.4byte	.LFB317
	.4byte	.LFE317-.LFB317
	.byte	0x1
	.byte	0x9c
	.4byte	0x1a2
	.byte	0x2
	.4byte	.LASF18
	.byte	0x1d
	.byte	0x3f
	.4byte	0x140
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x12
	.4byte	.LASF28
	.byte	0x2
	.byte	0x4
	.byte	0x33
	.4byte	.LFB316
	.4byte	.LFE316-.LFB316
	.byte	0x1
	.byte	0x9c
	.4byte	0x1e9
	.byte	0x13
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.4byte	0x1d2
	.byte	0x5
	.string	"i"
	.byte	0x6
	.byte	0xb
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0
	.byte	0x14
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.byte	0x5
	.string	"i"
	.byte	0x9
	.byte	0xb
	.4byte	0x3d
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0
	.byte	0
	.byte	0x8
	.4byte	.LASF22
	.byte	0x1c
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.byte	0x1
	.byte	0x9c
	.byte	0x8
	.4byte	.LASF23
	.byte	0xe
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.byte	0x1
	.byte	0x9c
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
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
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x3
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0x21
	.byte	0x3
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
	.byte	0x6
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x2
	.byte	0x3b
	.byte	0xb
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x2e
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
	.byte	0x25
	.byte	0x27
	.byte	0x19
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
	.byte	0xb
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
	.byte	0xc
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
	.byte	0xd
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
	.byte	0x7c
	.byte	0x19
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
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
	.byte	0xf
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x10
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
	.byte	0x13
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
	.byte	0x14
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x6
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.4byte	0x3c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
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
.LLRL0:
	.byte	0x6
	.4byte	.Ltext0
	.4byte	.Letext0
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
.LASF14:
	.string	"WB_return_data"
.LASF28:
	.string	"initfir"
.LASF21:
	.string	"WB_read"
.LASF22:
	.string	"flush_cpu_dcache"
.LASF16:
	.string	"input_data_count"
.LASF26:
	.string	"WB_return_data_last_one"
.LASF10:
	.string	"unsigned char"
.LASF12:
	.string	"long unsigned int"
.LASF11:
	.string	"short unsigned int"
.LASF25:
	.string	"uint32_t"
.LASF19:
	.string	"write_data"
.LASF24:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -ffreestanding"
.LASF18:
	.string	"WB_address"
.LASF2:
	.string	"unsigned int"
.LASF3:
	.string	"taps"
.LASF27:
	.string	"WB_write"
.LASF13:
	.string	"long long unsigned int"
.LASF20:
	.string	"fir_HW"
.LASF17:
	.string	"iteration"
.LASF15:
	.string	"output_data_count"
.LASF23:
	.string	"flush_cpu_icache"
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
