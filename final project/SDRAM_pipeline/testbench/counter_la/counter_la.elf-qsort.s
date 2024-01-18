	.file	"qsort.c"
	.option nopic
	.attribute arch, "rv32i2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.file 0 "/home/ubuntu/soc/final/testbench/counter_la" "qsort.c"
	.section	.mprjram,"ax",@progbits
	.align	2
	.globl	partition
	.type	partition, @function
partition:
.LFB0:
	.file 1 "qsort.c"
	.loc 1 3 75
	.cfi_startproc
.LVL0:
	.loc 1 4 2
	.loc 1 4 6 is_stmt 0
	lui	a6,%hi(.LANCHOR0)
	addi	a6,a6,%lo(.LANCHOR0)
	slli	t3,a1,2
	add	t1,a6,t3
	lw	a7,0(t1)
.LVL1:
	.loc 1 5 2 is_stmt 1
	.loc 1 5 6 is_stmt 0
	addi	a2,a0,-1
.LVL2:
	.loc 1 6 2 is_stmt 1
	.loc 1 7 2
	.loc 1 7 15
	ble	a1,a0,.L2
	slli	a0,a0,2
.LVL3:
	add	a5,a6,a0
.LVL4:
.L4:
	.loc 1 8 3
	.loc 1 8 7 is_stmt 0
	lw	a3,0(a5)
	.loc 1 8 5
	bge	a3,a7,.L3
	.loc 1 9 6
	addi	a2,a2,1
.LVL5:
	.loc 1 10 9
	slli	a4,a2,2
	add	a4,a6,a4
	lw	a1,0(a4)
	.loc 1 9 4 is_stmt 1
.LVL6:
	.loc 1 10 4
	.loc 1 11 4
	.loc 1 11 9 is_stmt 0
	sw	a3,0(a4)
.LVL7:
	.loc 1 12 4 is_stmt 1
	.loc 1 12 9 is_stmt 0
	sw	a1,0(a5)
.LVL8:
.L3:
	.loc 1 7 20 is_stmt 1 discriminator 2
	.loc 1 7 15 discriminator 2
	addi	a5,a5,4
	bne	t1,a5,.L4
	.loc 1 15 6 is_stmt 0
	add	a5,a6,t3
	lw	a7,0(a5)
.LVL9:
	.loc 1 15 16
	addi	a0,a2,1
.L2:
	.loc 1 15 2 is_stmt 1
	.loc 1 15 14 is_stmt 0
	slli	a5,a0,2
	add	a5,a6,a5
	lw	a4,0(a5)
	.loc 1 15 4
	ble	a4,a7,.L1
	.loc 1 16 3 is_stmt 1
.LVL10:
	.loc 1 17 3
	.loc 1 17 10 is_stmt 0
	sw	a7,0(a5)
	.loc 1 18 3 is_stmt 1
	.loc 1 18 9 is_stmt 0
	add	a6,a6,t3
	sw	a4,0(a6)
	.loc 1 20 2 is_stmt 1
.LVL11:
.L1:
	.loc 1 21 1 is_stmt 0
	ret
	.cfi_endproc
.LFE0:
	.size	partition, .-partition
	.align	2
	.globl	sort
	.type	sort, @function
sort:
.LFB1:
	.loc 1 23 72 is_stmt 1
	.cfi_startproc
.LVL12:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	a1,a0,.L38
	.loc 1 23 72
	addi	sp,sp,-96
	.cfi_def_cfa_offset 96
	sw	s5,68(sp)
	sw	s7,60(sp)
	sw	ra,92(sp)
	sw	s0,88(sp)
	sw	s1,84(sp)
	sw	s2,80(sp)
	sw	s3,76(sp)
	sw	s4,72(sp)
	sw	s6,64(sp)
	sw	s8,56(sp)
	sw	s9,52(sp)
	sw	s10,48(sp)
	sw	s11,44(sp)
	.cfi_offset 21, -28
	.cfi_offset 23, -36
	.cfi_offset 1, -4
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 18, -16
	.cfi_offset 19, -20
	.cfi_offset 20, -24
	.cfi_offset 22, -32
	.cfi_offset 24, -40
	.cfi_offset 25, -44
	.cfi_offset 26, -48
	.cfi_offset 27, -52
	mv	s7,a0
	mv	s5,a1
.LVL13:
.L27:
.LBB28:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s5
	mv	a0,s7
	call	partition
.LVL14:
	sw	a0,8(sp)
.LVL15:
	.loc 1 26 3 is_stmt 1
	addi	s9,a0,-1
.LVL16:
.LBB29:
.LBB30:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s9,s7,.L11
.LVL17:
.L26:
.LBB31:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s9
	mv	a0,s7
	call	partition
.LVL18:
	sw	a0,12(sp)
.LVL19:
	.loc 1 26 3 is_stmt 1
	addi	s10,a0,-1
.LVL20:
.LBB32:
.LBB33:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s10,s7,.L12
.LVL21:
.L25:
.LBB34:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s10
	mv	a0,s7
	call	partition
.LVL22:
	sw	a0,16(sp)
.LVL23:
	.loc 1 26 3 is_stmt 1
	addi	s11,a0,-1
.LVL24:
.LBB35:
.LBB36:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s11,s7,.L13
.LVL25:
.L24:
.LBB37:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s11
	mv	a0,s7
	call	partition
.LVL26:
	sw	a0,20(sp)
.LVL27:
	.loc 1 26 3 is_stmt 1
	addi	s2,a0,-1
.LVL28:
.LBB38:
.LBB39:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s2,s7,.L14
.LVL29:
.L23:
.LBB40:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s2
	mv	a0,s7
	call	partition
.LVL30:
	.loc 1 26 3
	addi	s1,a0,-1
	.loc 1 25 11
	mv	s0,a0
.LVL31:
	.loc 1 26 3 is_stmt 1
.LBB41:
.LBB42:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s1,s7,.L15
.LVL32:
.L22:
.LBB43:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s1
	mv	a0,s7
	call	partition
.LVL33:
	.loc 1 26 3
	addi	s6,a0,-1
	.loc 1 25 11
	mv	s3,a0
.LVL34:
	.loc 1 26 3 is_stmt 1
.LBB44:
.LBB45:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s6,s7,.L16
.LVL35:
.L21:
.LBB46:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s6
	mv	a0,s7
	call	partition
.LVL36:
	.loc 1 26 3
	addi	s4,a0,-1
	.loc 1 25 11
	mv	s8,a0
.LVL37:
	.loc 1 26 3 is_stmt 1
.LBB47:
.LBB48:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s4,s7,.L17
.LVL38:
.L20:
.LBB49:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,s4
	mv	a0,s7
	call	partition
.LVL39:
	.loc 1 26 3
	addi	a3,a0,-1
	.loc 1 25 11
	mv	a4,a0
.LVL40:
	.loc 1 26 3 is_stmt 1
.LBB50:
.LBB51:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	a3,s7,.L18
.LVL41:
.L19:
.LBB52:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	mv	a1,a3
	mv	a0,s7
	sw	a4,28(sp)
	sw	a3,24(sp)
	call	partition
.LVL42:
	mv	a2,a0
.LVL43:
	.loc 1 26 3 is_stmt 1
	addi	a1,a2,-1
	mv	a0,s7
.LVL44:
	.loc 1 27 3 is_stmt 0
	addi	s7,a2,1
	.loc 1 26 3
	call	sort
.LVL45:
	.loc 1 27 3 is_stmt 1
.LBE52:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	lw	a3,24(sp)
	lw	a4,28(sp)
	bgt	a3,s7,.L19
.LVL46:
.L18:
.LBE51:
.LBE50:
	.loc 1 27 3 is_stmt 1
	addi	s7,a4,1
.LBE49:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s4,s7,.L20
.LVL47:
.L17:
.LBE48:
.LBE47:
	.loc 1 27 3 is_stmt 1
	addi	s7,s8,1
.LBE46:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s6,s7,.L21
.LVL48:
.L16:
.LBE45:
.LBE44:
	.loc 1 27 3 is_stmt 1
	addi	s7,s3,1
.LBE43:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s1,s7,.L22
.LVL49:
.L15:
.LBE42:
.LBE41:
	.loc 1 27 3 is_stmt 1
	addi	s7,s0,1
.LBE40:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s2,s7,.L23
.LVL50:
.L14:
.LBE39:
.LBE38:
	.loc 1 27 3 is_stmt 1
	lw	a5,20(sp)
	addi	s7,a5,1
.LBE37:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s11,s7,.L24
.LVL51:
.L13:
.LBE36:
.LBE35:
	.loc 1 27 3 is_stmt 1
	lw	a5,16(sp)
	addi	s7,a5,1
.LBE34:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s10,s7,.L25
.LVL52:
.L12:
.LBE33:
.LBE32:
	.loc 1 27 3 is_stmt 1
	lw	a5,12(sp)
	addi	s7,a5,1
.LBE31:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	bgt	s9,s7,.L26
.LVL53:
.L11:
.LBE30:
.LBE29:
	.loc 1 27 3 is_stmt 1
	lw	a5,8(sp)
	addi	s7,a5,1
.LBE28:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	blt	s7,s5,.L27
	.loc 1 29 1
	lw	ra,92(sp)
	.cfi_restore 1
	lw	s0,88(sp)
	.cfi_restore 8
	lw	s1,84(sp)
	.cfi_restore 9
	lw	s2,80(sp)
	.cfi_restore 18
	lw	s3,76(sp)
	.cfi_restore 19
	lw	s4,72(sp)
	.cfi_restore 20
	lw	s5,68(sp)
	.cfi_restore 21
.LVL54:
	lw	s6,64(sp)
	.cfi_restore 22
	lw	s7,60(sp)
	.cfi_restore 23
	lw	s8,56(sp)
	.cfi_restore 24
	lw	s9,52(sp)
	.cfi_restore 25
	lw	s10,48(sp)
	.cfi_restore 26
	lw	s11,44(sp)
	.cfi_restore 27
	addi	sp,sp,96
	.cfi_def_cfa_offset 0
.LVL55:
	jr	ra
.LVL56:
.L38:
	ret
	.cfi_endproc
.LFE1:
	.size	sort, .-sort
	.align	2
	.globl	qsort
	.type	qsort, @function
qsort:
.LFB2:
	.loc 1 31 58 is_stmt 1
	.cfi_startproc
	.loc 1 32 2
.LVL57:
.LBB56:
.LBB57:
	.loc 1 24 2
.LBE57:
.LBE56:
	.loc 1 31 58 is_stmt 0
	addi	sp,sp,-16
	.cfi_def_cfa_offset 16
	sw	s0,8(sp)
	sw	s1,4(sp)
	sw	ra,12(sp)
	.cfi_offset 8, -8
	.cfi_offset 9, -12
	.cfi_offset 1, -4
	.loc 1 31 58
	li	s0,0
.LBB60:
.LBB59:
	.loc 1 24 4
	li	s1,8
.L42:
.LBB58:
	.loc 1 25 3 is_stmt 1
	.loc 1 25 11 is_stmt 0
	li	a1,9
	mv	a0,s0
	call	partition
.LVL58:
	mv	a5,a0
.LVL59:
	.loc 1 26 3 is_stmt 1
	addi	a1,a5,-1
	mv	a0,s0
.LVL60:
	.loc 1 27 3 is_stmt 0
	addi	s0,a5,1
	.loc 1 26 3
	call	sort
.LVL61:
	.loc 1 27 3 is_stmt 1
.LBE58:
	.loc 1 24 2
	.loc 1 24 4 is_stmt 0
	ble	s0,s1,.L42
.LVL62:
.LBE59:
.LBE60:
	.loc 1 33 2 is_stmt 1
	.loc 1 34 1 is_stmt 0
	lw	ra,12(sp)
	.cfi_restore 1
	lw	s0,8(sp)
	.cfi_restore 8
	.loc 1 33 9
	lui	a0,%hi(.LANCHOR0)
	.loc 1 34 1
	lw	s1,4(sp)
	.cfi_restore 9
	addi	a0,a0,%lo(.LANCHOR0)
	addi	sp,sp,16
	.cfi_def_cfa_offset 0
	jr	ra
	.cfi_endproc
.LFE2:
	.size	qsort, .-qsort
	.globl	Q
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	Q, @object
	.size	Q, 40
Q:
	.word	893
	.word	40
	.word	3233
	.word	4267
	.word	2669
	.word	2541
	.word	9073
	.word	6023
	.word	5681
	.word	4622
	.text
.Letext0:
	.file 2 "qsort.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.4byte	0x458
	.2byte	0x5
	.byte	0x1
	.byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0xc
	.4byte	.LASF5
	.byte	0x1d
	.4byte	.LASF0
	.4byte	.LASF1
	.4byte	.LLRL37
	.4byte	0
	.4byte	.Ldebug_line0
	.byte	0xd
	.4byte	0x3d
	.4byte	0x36
	.byte	0xe
	.4byte	0x36
	.byte	0x9
	.byte	0
	.byte	0xf
	.byte	0x4
	.byte	0x7
	.4byte	.LASF2
	.byte	0x10
	.byte	0x4
	.byte	0x5
	.string	"int"
	.byte	0x11
	.string	"Q"
	.byte	0x2
	.byte	0x5
	.byte	0x5
	.4byte	0x26
	.byte	0x5
	.byte	0x3
	.4byte	Q
	.byte	0x12
	.4byte	.LASF6
	.byte	0x1
	.byte	0x1f
	.byte	0x33
	.4byte	0xd2
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.byte	0x1
	.byte	0x9c
	.4byte	0xd2
	.byte	0x13
	.4byte	0xd8
	.4byte	.LBB56
	.4byte	.LLRL33
	.byte	0x1
	.byte	0x20
	.byte	0x2
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST34
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST35
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB58
	.4byte	.LBE58-.LBB58
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST36
	.byte	0x7
	.4byte	.LVL58
	.4byte	0x11b
	.4byte	0xbf
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x78
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x1
	.byte	0x39
	.byte	0
	.byte	0x5
	.4byte	.LVL61
	.4byte	0xd8
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x78
	.byte	0x7e
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x14
	.byte	0x4
	.4byte	0x3d
	.byte	0x15
	.4byte	.LASF7
	.byte	0x1
	.byte	0x17
	.byte	0x33
	.byte	0x1
	.4byte	0x11b
	.byte	0x8
	.string	"low"
	.byte	0x3c
	.4byte	0x3d
	.byte	0x8
	.string	"hi"
	.byte	0x45
	.4byte	0x3d
	.byte	0x16
	.byte	0x17
	.string	"p"
	.byte	0x1
	.byte	0x19
	.byte	0x7
	.4byte	0x3d
	.byte	0x5
	.4byte	.LVL14
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x85
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x18
	.4byte	.LASF8
	.byte	0x1
	.byte	0x3
	.byte	0x32
	.4byte	0x3d
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.byte	0x1
	.byte	0x9c
	.4byte	0x185
	.byte	0x9
	.string	"low"
	.byte	0x40
	.4byte	0x3d
	.4byte	.LLST0
	.byte	0x9
	.string	"hi"
	.byte	0x48
	.4byte	0x3d
	.4byte	.LLST1
	.byte	0xa
	.4byte	.LASF3
	.byte	0x4
	.4byte	0x3d
	.4byte	.LLST2
	.byte	0xb
	.string	"i"
	.byte	0x6
	.4byte	0x3d
	.4byte	.LLST3
	.byte	0xb
	.string	"j"
	.byte	0x10
	.4byte	0x3d
	.4byte	.LLST4
	.byte	0xa
	.4byte	.LASF4
	.byte	0x6
	.4byte	0x3d
	.4byte	.LLST5
	.byte	0
	.byte	0x19
	.4byte	0xd8
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.byte	0x1
	.byte	0x9c
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST6
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST7
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB28
	.4byte	.LBE28-.LBB28
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST8
	.byte	0x1a
	.4byte	0xd8
	.4byte	.LBB29
	.4byte	.LBE29-.LBB29
	.byte	0x1
	.byte	0x1a
	.byte	0x3
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST9
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST10
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB31
	.4byte	.LBE31-.LBB31
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST11
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB32
	.4byte	.LBE32-.LBB32
	.4byte	0x441
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST12
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST13
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB34
	.4byte	.LBE34-.LBB34
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST14
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB35
	.4byte	.LBE35-.LBB35
	.4byte	0x429
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST15
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST16
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB37
	.4byte	.LBE37-.LBB37
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST17
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB38
	.4byte	.LBE38-.LBB38
	.4byte	0x411
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST18
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST19
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB40
	.4byte	.LBE40-.LBB40
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST20
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB41
	.4byte	.LBE41-.LBB41
	.4byte	0x3f9
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST21
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST22
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB43
	.4byte	.LBE43-.LBB43
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST23
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB44
	.4byte	.LBE44-.LBB44
	.4byte	0x3e1
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST24
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST25
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB46
	.4byte	.LBE46-.LBB46
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST26
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB47
	.4byte	.LBE47-.LBB47
	.4byte	0x3c9
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST27
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST28
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB49
	.4byte	.LBE49-.LBB49
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST29
	.byte	0x6
	.4byte	0xd8
	.4byte	.LBB50
	.4byte	.LBE50-.LBB50
	.4byte	0x3b1
	.byte	0x2
	.4byte	0xef
	.4byte	.LLST30
	.byte	0x2
	.4byte	0xe5
	.4byte	.LLST31
	.byte	0x3
	.4byte	0xf8
	.4byte	.LBB52
	.4byte	.LBE52-.LBB52
	.byte	0x4
	.4byte	0xf9
	.4byte	.LLST32
	.byte	0x7
	.4byte	.LVL42
	.4byte	0x11b
	.4byte	0x39f
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x4
	.byte	0x91
	.byte	0xb8,0x7f
	.byte	0x6
	.byte	0
	.byte	0x5
	.4byte	.LVL45
	.4byte	0xd8
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x87
	.byte	0x7e
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL39
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x84
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL36
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x86
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL33
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x79
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL30
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x82
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL26
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8b
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL22
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x8a
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0x5
	.4byte	.LVL18
	.4byte	0x11b
	.byte	0x1
	.byte	0x1
	.byte	0x5a
	.byte	0x2
	.byte	0x87
	.byte	0
	.byte	0x1
	.byte	0x1
	.byte	0x5b
	.byte	0x2
	.byte	0x89
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.byte	0x1
	.byte	0x49
	.byte	0
	.byte	0x2
	.byte	0x18
	.byte	0x7e
	.byte	0x18
	.byte	0
	.byte	0
	.byte	0x2
	.byte	0x5
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x3
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
	.byte	0x4
	.byte	0x34
	.byte	0
	.byte	0x31
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0x5
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
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
	.byte	0x21
	.byte	0x1a
	.byte	0x57
	.byte	0x21
	.byte	0x3
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x7
	.byte	0x48
	.byte	0x1
	.byte	0x7d
	.byte	0x1
	.byte	0x7f
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x8
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x17
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x9
	.byte	0x5
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x3
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xa
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
	.byte	0xb
	.byte	0x34
	.byte	0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0x21
	.byte	0x1
	.byte	0x3b
	.byte	0x21
	.byte	0x5
	.byte	0x39
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0x17
	.byte	0
	.byte	0
	.byte	0xc
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
	.byte	0xd
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0xe
	.byte	0x21
	.byte	0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0
	.byte	0
	.byte	0xf
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
	.byte	0x10
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
	.byte	0x11
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
	.byte	0x13
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
	.byte	0x14
	.byte	0xf
	.byte	0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0
	.byte	0
	.byte	0x15
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
	.byte	0x16
	.byte	0xb
	.byte	0x1
	.byte	0
	.byte	0
	.byte	0x17
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
	.byte	0x19
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
	.byte	0x1a
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
	.byte	0
	.section	.debug_loclists,"",@progbits
	.4byte	.Ldebug_loc3-.Ldebug_loc2
.Ldebug_loc2:
	.2byte	0x5
	.byte	0x4
	.byte	0
	.4byte	0
.Ldebug_loc0:
.LLST34:
	.byte	0x7
	.4byte	.LVL57
	.4byte	.LVL62
	.byte	0x2
	.byte	0x39
	.byte	0x9f
	.byte	0
.LLST35:
	.byte	0x7
	.4byte	.LVL57
	.4byte	.LVL62
	.byte	0x2
	.byte	0x30
	.byte	0x9f
	.byte	0
.LLST36:
	.byte	0x7
	.4byte	.LVL59
	.4byte	.LVL60
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL60
	.4byte	.LVL61-1
	.byte	0x1
	.byte	0x5f
	.byte	0x7
	.4byte	.LVL61-1
	.4byte	.LVL62
	.byte	0x3
	.byte	0x78
	.byte	0x7f
	.byte	0x9f
	.byte	0
.LLST0:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LFE0
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0
.LLST1:
	.byte	0x7
	.4byte	.LVL0
	.4byte	.LVL4
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL4
	.4byte	.LFE0
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0
.LLST2:
	.byte	0x7
	.4byte	.LVL1
	.4byte	.LVL9
	.byte	0x1
	.byte	0x61
	.byte	0
.LLST3:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL5
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL5
	.4byte	.LVL6
	.byte	0x3
	.byte	0x7c
	.byte	0x7f
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL8
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL8
	.4byte	.LFE0
	.byte	0x1
	.byte	0x5c
	.byte	0
.LLST4:
	.byte	0x7
	.4byte	.LVL2
	.4byte	.LVL3
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL3
	.4byte	.LVL4
	.byte	0x3
	.byte	0x7c
	.byte	0x1
	.byte	0x9f
	.byte	0
.LLST5:
	.byte	0x7
	.4byte	.LVL6
	.4byte	.LVL7
	.byte	0xa
	.byte	0x7c
	.byte	0x1
	.byte	0x32
	.byte	0x24
	.byte	0x3
	.4byte	Q
	.byte	0x22
	.byte	0x7
	.4byte	.LVL10
	.4byte	.LVL11
	.byte	0x1
	.byte	0x5e
	.byte	0
.LLST6:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL56
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5a
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST7:
	.byte	0x7
	.4byte	.LVL12
	.4byte	.LVL13
	.byte	0x1
	.byte	0x5b
	.byte	0x7
	.4byte	.LVL13
	.4byte	.LVL54
	.byte	0x1
	.byte	0x65
	.byte	0x7
	.4byte	.LVL54
	.4byte	.LVL56
	.byte	0x4
	.byte	0xa3
	.byte	0x1
	.byte	0x5b
	.byte	0x9f
	.byte	0x7
	.4byte	.LVL56
	.4byte	.LFE1
	.byte	0x1
	.byte	0x5b
	.byte	0
.LLST8:
	.byte	0x7
	.4byte	.LVL15
	.4byte	.LVL17
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL17
	.4byte	.LVL55
	.byte	0x3
	.byte	0x91
	.byte	0xa8,0x7f
	.byte	0x7
	.4byte	.LVL55
	.4byte	.LVL56
	.byte	0x3
	.byte	0x72
	.byte	0xa8,0x7f
	.byte	0
.LLST9:
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL53
	.byte	0x1
	.byte	0x69
	.byte	0
.LLST10:
	.byte	0x7
	.4byte	.LVL16
	.4byte	.LVL17
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST11:
	.byte	0x7
	.4byte	.LVL19
	.4byte	.LVL21
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL21
	.4byte	.LVL53
	.byte	0x3
	.byte	0x91
	.byte	0xac,0x7f
	.byte	0
.LLST12:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL52
	.byte	0x1
	.byte	0x6a
	.byte	0
.LLST13:
	.byte	0x7
	.4byte	.LVL20
	.4byte	.LVL21
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST14:
	.byte	0x7
	.4byte	.LVL23
	.4byte	.LVL25
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL25
	.4byte	.LVL52
	.byte	0x3
	.byte	0x91
	.byte	0xb0,0x7f
	.byte	0
.LLST15:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL51
	.byte	0x1
	.byte	0x6b
	.byte	0
.LLST16:
	.byte	0x7
	.4byte	.LVL24
	.4byte	.LVL25
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST17:
	.byte	0x7
	.4byte	.LVL27
	.4byte	.LVL29
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL29
	.4byte	.LVL51
	.byte	0x3
	.byte	0x91
	.byte	0xb4,0x7f
	.byte	0
.LLST18:
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL50
	.byte	0x1
	.byte	0x62
	.byte	0
.LLST19:
	.byte	0x7
	.4byte	.LVL28
	.4byte	.LVL29
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST20:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL50
	.byte	0x1
	.byte	0x58
	.byte	0
.LLST21:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL49
	.byte	0x1
	.byte	0x59
	.byte	0
.LLST22:
	.byte	0x7
	.4byte	.LVL31
	.4byte	.LVL32
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST23:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL35
	.4byte	.LVL49
	.byte	0x1
	.byte	0x63
	.byte	0
.LLST24:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL48
	.byte	0x1
	.byte	0x66
	.byte	0
.LLST25:
	.byte	0x7
	.4byte	.LVL34
	.4byte	.LVL35
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST26:
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL38
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL38
	.4byte	.LVL48
	.byte	0x1
	.byte	0x68
	.byte	0
.LLST27:
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL47
	.byte	0x1
	.byte	0x64
	.byte	0
.LLST28:
	.byte	0x7
	.4byte	.LVL37
	.4byte	.LVL38
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST29:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL41
	.byte	0x1
	.byte	0x5a
	.byte	0
.LLST30:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL41
	.byte	0x1
	.byte	0x5d
	.byte	0
.LLST31:
	.byte	0x7
	.4byte	.LVL40
	.4byte	.LVL41
	.byte	0x1
	.byte	0x67
	.byte	0
.LLST32:
	.byte	0x7
	.4byte	.LVL43
	.4byte	.LVL44
	.byte	0x1
	.byte	0x5a
	.byte	0x7
	.4byte	.LVL44
	.4byte	.LVL45-1
	.byte	0x1
	.byte	0x5c
	.byte	0x7
	.4byte	.LVL45-1
	.4byte	.LVL46
	.byte	0x3
	.byte	0x87
	.byte	0x7f
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
.LLRL33:
	.byte	0x6
	.4byte	.LBB56
	.4byte	.LBE56
	.byte	0x6
	.4byte	.LBB60
	.4byte	.LBE60
	.byte	0
.LLRL37:
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
.LASF5:
	.string	"GNU C17 12.1.0 -mabi=ilp32 -mtune=rocket -misa-spec=2.2 -march=rv32i -g -O2 -ffreestanding"
.LASF3:
	.string	"pivot"
.LASF6:
	.string	"qsort"
.LASF4:
	.string	"temp"
.LASF8:
	.string	"partition"
.LASF7:
	.string	"sort"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/ubuntu/soc/final/testbench/counter_la"
.LASF0:
	.string	"qsort.c"
	.ident	"GCC: (g1ea978e3066) 12.1.0"
