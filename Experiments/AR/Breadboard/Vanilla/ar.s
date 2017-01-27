	.file	"ar.bc"
	.text
	.globl	getOneSample
	.align	2
	.type	getOneSample,@function
getOneSample:                           ; @getOneSample
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#20, r1
	;DEBUG_VALUE: getOneSample:tr <- undef
	mov.w	r15, -2(r4)
	mov.w	r15, -18(r4)            ; 2-byte Folded Spill
	call	#ACCEL_getX
	mov.w	r15, -8(r4)
	mov.w	#0, -6(r4)
	call	#ACCEL_getY
	mov.w	r15, -12(r4)
	mov.w	#0, -10(r4)
	call	#ACCEL_getZ
	mov.w	r15, -16(r4)
	mov.w	#0, -14(r4)
	mov.w	-8(r4), r15
	mov.w	-6(r4), r12
	mov.w	-2(r4), r13
	mov.w	r12, 2(r13)
	mov.w	r15, 0(r13)
	mov.w	-12(r4), r12
	mov.w	-10(r4), r13
	mov.w	-2(r4), r15
	mov.w	r13, 6(r15)
	mov.w	r12, 4(r15)
	mov.w	-16(r4), r12
	mov.w	-14(r4), r13
	mov.w	-2(r4), r15
	mov.w	r13, 10(r15)
	mov.w	r12, 8(r15)
	mov.w	-18(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	add.w	#20, r1
	pop.w	r4
	ret
.Ltmp0:
	.size	getOneSample, .Ltmp0-getOneSample

	.globl	getNextSample
	.align	2
	.type	getNextSample,@function
getNextSample:                          ; @getNextSample
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	&currSamp, r15
	mov.w	#12, r14
	call	#__mulhi3
	add.w	#aWin, r15
	call	#getOneSample
	mov.w	&currSamp, r14
	add.w	#1, r14
	mov.w	r14, &currSamp
	cmp.w	#4, r14
	jl	.LBB1_2
	jmp	.LBB1_1
.LBB1_1:
	mov.w	#0, &currSamp
.LBB1_2:
	pop.w	r4
	ret
.Ltmp1:
	.size	getNextSample, .Ltmp1-getNextSample

	.globl	featurize
	.align	2
	.type	featurize,@function
featurize:                              ; @featurize
; BB#0:
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#100, r1
	mov.w	#0, &mean+10
	mov.w	#0, &mean+8
	mov.w	#0, &mean+6
	mov.w	#0, &mean+4
	mov.w	#0, &mean+2
	mov.w	#0, &mean
	mov.w	#0, &stddev+10
	mov.w	#0, &stddev+8
	mov.w	#0, &stddev+6
	mov.w	#0, &stddev+4
	mov.w	#0, &stddev+2
	mov.w	#0, &stddev
	mov.w	#0, -6(r4)
.LBB2_1:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#4, r12
	jge	.LBB2_4
	jmp	.LBB2_2
.LBB2_2:                                ;   in Loop: Header=BB2_1 Depth=1
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	mov.w	-6(r4), r15
	mov.w	#12, r14
	mov.w	r14, -8(r4)             ; 2-byte Folded Spill
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	mov.w	r13, -12(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin(r15), r12
	mov.w	aWin+2(r15), r13
	mov.w	-10(r4), r14            ; 2-byte Folded Reload
	add.w	r12, r14
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	addc.w	r13, r12
	mov.w	r12, &mean+2
	mov.w	r14, &mean
	mov.w	&mean+4, r12
	mov.w	&mean+6, r13
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14             ; 2-byte Folded Reload
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	mov.w	r13, -16(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	aWin+6(r15), r13
	mov.w	-14(r4), r14            ; 2-byte Folded Reload
	add.w	r12, r14
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	addc.w	r13, r12
	mov.w	r12, &mean+6
	mov.w	r14, &mean+4
	mov.w	&mean+8, r12
	mov.w	&mean+10, r13
	mov.w	-6(r4), r15
	mov.w	-8(r4), r14             ; 2-byte Folded Reload
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	mov.w	r13, -20(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+8(r15), r12
	mov.w	aWin+10(r15), r13
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	add.w	r12, r14
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	addc.w	r13, r12
	mov.w	r12, &mean+10
	mov.w	r14, &mean+8
; BB#3:                                 ;   in Loop: Header=BB2_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	jmp	.LBB2_1
.LBB2_4:
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	mov.w	r13, r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	add.w	r14, r12
	addc.w	#0, r13
	clrc
	rrc.w	r12
	rra.w	r12
	mov.w	r13, r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r12
	rra.w	r13
	rra.w	r13
	mov.w	r13, &mean+2
	mov.w	r12, &mean
	mov.w	&mean+4, r12
	mov.w	&mean+6, r13
	mov.w	r13, r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	add.w	r14, r12
	addc.w	#0, r13
	clrc
	rrc.w	r12
	rra.w	r12
	mov.w	r13, r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r12
	rra.w	r13
	rra.w	r13
	mov.w	r13, &mean+6
	mov.w	r12, &mean+4
	mov.w	&mean+8, r12
	mov.w	&mean+10, r13
	mov.w	r13, r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	add.w	r14, r12
	addc.w	#0, r13
	clrc
	rrc.w	r12
	rra.w	r12
	mov.w	r13, r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	rla.w	r14
	bis.w	r14, r12
	rra.w	r13
	rra.w	r13
	mov.w	r13, &mean+10
	mov.w	r12, &mean+8
	mov.w	#0, -6(r4)
.LBB2_5:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-6(r4), r12
	cmp.w	#4, r12
	jl	4
	br	#.LBB2_29
	jmp	.LBB2_6
.LBB2_6:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin(r15), r14
	mov.w	aWin+2(r15), r15
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r14, -22(r4)            ; 2-byte Folded Spill
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	mov.w	r13, -28(r4)            ; 2-byte Folded Spill
	mov.w	r11, -30(r4)            ; 2-byte Folded Spill
	mov.w	r10, -32(r4)            ; 2-byte Folded Spill
	jge	.LBB2_8
; BB#7:                                 ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
.LBB2_8:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	mov.w	-28(r4), r15            ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	mov.w	r13, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB2_10
; BB#9:                                 ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
.LBB2_10:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB2_12
	jmp	.LBB2_11
.LBB2_11:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin(r15), r14
	mov.w	aWin+2(r15), r15
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	sub.w	r12, r14
	subc.w	r13, r15
	mov.w	r14, -38(r4)            ; 2-byte Folded Spill
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_13
.LBB2_12:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	mov.w	-6(r4), r15
	mov.w	#12, r14
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	mov.w	r13, -44(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin(r15), r12
	mov.w	aWin+2(r15), r13
	mov.w	-42(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	subc.w	r13, r12
	mov.w	r14, -38(r4)            ; 2-byte Folded Spill
	mov.w	r12, -40(r4)            ; 2-byte Folded Spill
.LBB2_13:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	mov.w	&stddev, r14
	mov.w	&stddev+2, r15
	add.w	r13, r14
	addc.w	r12, r15
	mov.w	r15, &stddev+2
	mov.w	r14, &stddev
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	aWin+6(r15), r13
	mov.w	&mean+4, r14
	mov.w	&mean+6, r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r13, r15
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
	mov.w	r13, -48(r4)            ; 2-byte Folded Spill
	mov.w	r14, -50(r4)            ; 2-byte Folded Spill
	mov.w	r15, -52(r4)            ; 2-byte Folded Spill
	mov.w	r11, -54(r4)            ; 2-byte Folded Spill
	mov.w	r10, -56(r4)            ; 2-byte Folded Spill
	jge	.LBB2_15
; BB#14:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
.LBB2_15:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-56(r4), r12            ; 2-byte Folded Reload
	mov.w	-50(r4), r13            ; 2-byte Folded Reload
	mov.w	-46(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-48(r4), r14            ; 2-byte Folded Reload
	mov.w	-52(r4), r15            ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -58(r4)            ; 2-byte Folded Spill
	mov.w	r13, -60(r4)            ; 2-byte Folded Spill
	jeq	.LBB2_17
; BB#16:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-58(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -60(r4)            ; 2-byte Folded Spill
.LBB2_17:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-60(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB2_19
	jmp	.LBB2_18
.LBB2_18:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin+4(r15), r14
	mov.w	aWin+6(r15), r15
	mov.w	&mean+4, r12
	mov.w	&mean+6, r13
	sub.w	r12, r14
	subc.w	r13, r15
	mov.w	r14, -62(r4)            ; 2-byte Folded Spill
	mov.w	r15, -64(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_20
.LBB2_19:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	&mean+4, r12
	mov.w	&mean+6, r13
	mov.w	-6(r4), r15
	mov.w	#12, r14
	mov.w	r12, -66(r4)            ; 2-byte Folded Spill
	mov.w	r13, -68(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	aWin+6(r15), r13
	mov.w	-66(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	-68(r4), r12            ; 2-byte Folded Reload
	subc.w	r13, r12
	mov.w	r14, -62(r4)            ; 2-byte Folded Spill
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
.LBB2_20:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-64(r4), r12            ; 2-byte Folded Reload
	mov.w	-62(r4), r13            ; 2-byte Folded Reload
	mov.w	&stddev+4, r14
	mov.w	&stddev+6, r15
	add.w	r13, r14
	addc.w	r12, r15
	mov.w	r15, &stddev+6
	mov.w	r14, &stddev+4
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin+8(r15), r12
	mov.w	aWin+10(r15), r13
	mov.w	&mean+8, r14
	mov.w	&mean+10, r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r13, r15
	mov.w	r12, -70(r4)            ; 2-byte Folded Spill
	mov.w	r13, -72(r4)            ; 2-byte Folded Spill
	mov.w	r14, -74(r4)            ; 2-byte Folded Spill
	mov.w	r15, -76(r4)            ; 2-byte Folded Spill
	mov.w	r11, -78(r4)            ; 2-byte Folded Spill
	mov.w	r10, -80(r4)            ; 2-byte Folded Spill
	jge	.LBB2_22
; BB#21:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-78(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -80(r4)            ; 2-byte Folded Spill
.LBB2_22:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	-74(r4), r13            ; 2-byte Folded Reload
	mov.w	-70(r4), r14            ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-72(r4), r14            ; 2-byte Folded Reload
	mov.w	-76(r4), r15            ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -82(r4)            ; 2-byte Folded Spill
	mov.w	r13, -84(r4)            ; 2-byte Folded Spill
	jeq	.LBB2_24
; BB#23:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-82(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -84(r4)            ; 2-byte Folded Spill
.LBB2_24:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-84(r4), r12            ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB2_26
	jmp	.LBB2_25
.LBB2_25:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-6(r4), r15
	mov.w	#12, r14
	call	#__mulhi3
	mov.w	aWin+8(r15), r14
	mov.w	aWin+10(r15), r15
	mov.w	&mean+8, r12
	mov.w	&mean+10, r13
	sub.w	r12, r14
	subc.w	r13, r15
	mov.w	r14, -86(r4)            ; 2-byte Folded Spill
	mov.w	r15, -88(r4)            ; 2-byte Folded Spill
	jmp	.LBB2_27
.LBB2_26:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	&mean+8, r12
	mov.w	&mean+10, r13
	mov.w	-6(r4), r15
	mov.w	#12, r14
	mov.w	r12, -90(r4)            ; 2-byte Folded Spill
	mov.w	r13, -92(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+8(r15), r12
	mov.w	aWin+10(r15), r13
	mov.w	-90(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	-92(r4), r12            ; 2-byte Folded Reload
	subc.w	r13, r12
	mov.w	r14, -86(r4)            ; 2-byte Folded Spill
	mov.w	r12, -88(r4)            ; 2-byte Folded Spill
.LBB2_27:                               ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-88(r4), r12            ; 2-byte Folded Reload
	mov.w	-86(r4), r13            ; 2-byte Folded Reload
	mov.w	&stddev+8, r14
	mov.w	&stddev+10, r15
	add.w	r13, r14
	addc.w	r12, r15
	mov.w	r15, &stddev+10
	mov.w	r14, &stddev+8
; BB#28:                                ;   in Loop: Header=BB2_5 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
	br	#.LBB2_5
.LBB2_29:
	mov.w	&stddev, r14
	mov.w	&stddev+2, r15
	mov.w	#3, r12
	mov.w	#0, r13
	mov.w	r12, -94(r4)            ; 2-byte Folded Spill
	mov.w	r13, -96(r4)            ; 2-byte Folded Spill
	call	#__divsi3
	mov.w	r15, &stddev+2
	mov.w	r14, &stddev
	mov.w	&stddev+4, r14
	mov.w	&stddev+6, r15
	mov.w	-94(r4), r12            ; 2-byte Folded Reload
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	call	#__divsi3
	mov.w	r15, &stddev+6
	mov.w	r14, &stddev+4
	mov.w	&stddev+8, r14
	mov.w	&stddev+10, r15
	mov.w	-94(r4), r12            ; 2-byte Folded Reload
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	call	#__divsi3
	mov.w	r15, &stddev+10
	mov.w	r14, &stddev+8
	mov.w	&mean, r12
	mov.w	&mean+2, r13
	mov.w	&mean+4, r14
	mov.w	&mean+6, r15
	add.w	r14, r12
	addc.w	r15, r13
	mov.w	&mean+8, r14
	mov.w	&mean+10, r15
	mov.w	-94(r4), r11            ; 2-byte Folded Reload
	mov.w	r12, -98(r4)            ; 2-byte Folded Spill
	mov.w	r11, r12
	mov.w	-96(r4), r10            ; 2-byte Folded Reload
	mov.w	r13, -100(r4)           ; 2-byte Folded Spill
	mov.w	r10, r13
	call	#__divsi3
	mov.w	-98(r4), r12            ; 2-byte Folded Reload
	add.w	r14, r12
	mov.w	-100(r4), r13           ; 2-byte Folded Reload
	addc.w	r15, r13
	mov.w	r13, &meanmag+2
	mov.w	r12, &meanmag
	mov.w	&stddev, r12
	mov.w	&stddev+2, r13
	mov.w	&stddev+4, r14
	mov.w	&stddev+6, r15
	add.w	r14, r12
	addc.w	r15, r13
	mov.w	&stddev+8, r14
	mov.w	&stddev+10, r15
	mov.w	-94(r4), r11            ; 2-byte Folded Reload
	mov.w	r12, -102(r4)           ; 2-byte Folded Spill
	mov.w	r11, r12
	mov.w	-96(r4), r10            ; 2-byte Folded Reload
	mov.w	r13, -104(r4)           ; 2-byte Folded Spill
	mov.w	r10, r13
	call	#__divsi3
	mov.w	-102(r4), r12           ; 2-byte Folded Reload
	add.w	r14, r12
	mov.w	-104(r4), r13           ; 2-byte Folded Reload
	addc.w	r15, r13
	mov.w	r13, &stddevmag+2
	mov.w	r12, &stddevmag
	add.w	#100, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Ltmp2:
	.size	featurize, .Ltmp2-featurize

	.globl	classify
	.align	2
	.type	classify,@function
classify:                               ; @classify
; BB#0:
	push.w	r4
	mov.w	r1, r4
	push.w	r11
	push.w	r10
	sub.w	#200, r1
	mov.w	#0, -8(r4)
	mov.w	#0, -10(r4)
	mov.w	#0, -12(r4)
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#10, r12
	jl	4
	br	#.LBB3_46
	jmp	.LBB3_2
.LBB3_2:                                ;   in Loop: Header=BB3_1 Depth=1
	;DEBUG_VALUE: stat_mean_err <- [FPW+-12]
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r13
	mov.w	stationary+2(r12), r12
	mov.w	&meanmag, r14
	mov.w	&meanmag+2, r15
	mov.w	r13, -30(r4)            ; 2-byte Folded Spill
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -34(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-32(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -36(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	-36(r4), r13            ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -38(r4)            ; 2-byte Folded Spill
	mov.w	r15, -40(r4)            ; 2-byte Folded Spill
	mov.w	r12, -42(r4)            ; 2-byte Folded Spill
	mov.w	r13, -44(r4)            ; 2-byte Folded Spill
	jl	.LBB3_4
; BB#3:                                 ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-42(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -44(r4)            ; 2-byte Folded Spill
.LBB3_4:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-40(r4), r15            ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -46(r4)            ; 2-byte Folded Spill
	mov.w	r14, -48(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_6
; BB#5:                                 ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-46(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -48(r4)            ; 2-byte Folded Spill
.LBB3_6:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-48(r4), r12            ; 2-byte Folded Reload
	mov.w	-30(r4), r14            ; 2-byte Folded Reload
	mov.w	-32(r4), r15            ; 2-byte Folded Reload
	mov.w	-34(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -50(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-36(r4), r13            ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-50(r4), r13            ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB3_8
	jmp	.LBB3_7
.LBB3_7:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r14
	mov.w	stationary+2(r12), r15
	mov.w	&meanmag, r12
	mov.w	&meanmag+2, r13
	mov.w	r14, -52(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -54(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-52(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -56(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-54(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -58(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-56(r4), r12            ; 2-byte Folded Reload
	mov.w	-58(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -60(r4)            ; 2-byte Folded Spill
	mov.w	r15, -62(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_9
.LBB3_8:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	&meanmag, r14
	mov.w	&meanmag+2, r15
	call	#__floatsisf
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r13
	mov.w	stationary+2(r12), r12
	mov.w	r12, -64(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-64(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -60(r4)            ; 2-byte Folded Spill
	mov.w	r15, -62(r4)            ; 2-byte Folded Spill
.LBB3_9:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-62(r4), r12            ; 2-byte Folded Reload
	mov.w	-60(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfsi
	mov.w	r15, -14(r4)
	mov.w	r14, -16(r4)
	;DEBUG_VALUE: stat_sd_err <- [FPW+-16]
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r13
	mov.w	stationary+6(r12), r12
	mov.w	&stddevmag, r14
	mov.w	&stddevmag+2, r15
	mov.w	r13, -66(r4)            ; 2-byte Folded Spill
	mov.w	r12, -68(r4)            ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-66(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -70(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-68(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -72(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-70(r4), r12            ; 2-byte Folded Reload
	mov.w	-72(r4), r13            ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -74(r4)            ; 2-byte Folded Spill
	mov.w	r15, -76(r4)            ; 2-byte Folded Spill
	mov.w	r12, -78(r4)            ; 2-byte Folded Spill
	mov.w	r13, -80(r4)            ; 2-byte Folded Spill
	jl	.LBB3_11
; BB#10:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-78(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -80(r4)            ; 2-byte Folded Spill
.LBB3_11:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	-74(r4), r13            ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-76(r4), r15            ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -82(r4)            ; 2-byte Folded Spill
	mov.w	r14, -84(r4)            ; 2-byte Folded Spill
	jeq	.LBB3_13
; BB#12:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-82(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -84(r4)            ; 2-byte Folded Spill
.LBB3_13:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-84(r4), r12            ; 2-byte Folded Reload
	mov.w	-66(r4), r14            ; 2-byte Folded Reload
	mov.w	-68(r4), r15            ; 2-byte Folded Reload
	mov.w	-70(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -86(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-72(r4), r13            ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-86(r4), r13            ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB3_15
	jmp	.LBB3_14
.LBB3_14:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r14
	mov.w	stationary+6(r12), r15
	mov.w	&stddevmag, r12
	mov.w	&stddevmag+2, r13
	mov.w	r14, -88(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -90(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-88(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -92(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-90(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -94(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-92(r4), r12            ; 2-byte Folded Reload
	mov.w	-94(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -96(r4)            ; 2-byte Folded Spill
	mov.w	r15, -98(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_16
.LBB3_15:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	&stddevmag, r14
	mov.w	&stddevmag+2, r15
	call	#__floatsisf
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r13
	mov.w	stationary+6(r12), r12
	mov.w	r12, -100(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-100(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -96(r4)            ; 2-byte Folded Spill
	mov.w	r15, -98(r4)            ; 2-byte Folded Spill
.LBB3_16:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-98(r4), r12            ; 2-byte Folded Reload
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfsi
	mov.w	r15, -18(r4)
	mov.w	r14, -20(r4)
	;DEBUG_VALUE: walk_mean_err <- [FPW+-20]
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r13
	mov.w	walking+2(r12), r12
	mov.w	&meanmag, r14
	mov.w	&meanmag+2, r15
	mov.w	r13, -102(r4)           ; 2-byte Folded Spill
	mov.w	r12, -104(r4)           ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-102(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -106(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-104(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -108(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-106(r4), r12           ; 2-byte Folded Reload
	mov.w	-108(r4), r13           ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -110(r4)           ; 2-byte Folded Spill
	mov.w	r15, -112(r4)           ; 2-byte Folded Spill
	mov.w	r12, -114(r4)           ; 2-byte Folded Spill
	mov.w	r13, -116(r4)           ; 2-byte Folded Spill
	jl	.LBB3_18
; BB#17:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-114(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -116(r4)           ; 2-byte Folded Spill
.LBB3_18:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-116(r4), r12           ; 2-byte Folded Reload
	mov.w	-110(r4), r13           ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-112(r4), r15           ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -118(r4)           ; 2-byte Folded Spill
	mov.w	r14, -120(r4)           ; 2-byte Folded Spill
	jeq	.LBB3_20
; BB#19:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-118(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -120(r4)           ; 2-byte Folded Spill
.LBB3_20:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-120(r4), r12           ; 2-byte Folded Reload
	mov.w	-102(r4), r14           ; 2-byte Folded Reload
	mov.w	-104(r4), r15           ; 2-byte Folded Reload
	mov.w	-106(r4), r13           ; 2-byte Folded Reload
	mov.w	r12, -122(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-108(r4), r13           ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-122(r4), r13           ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB3_22
	jmp	.LBB3_21
.LBB3_21:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r14
	mov.w	walking+2(r12), r15
	mov.w	&meanmag, r12
	mov.w	&meanmag+2, r13
	mov.w	r14, -124(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -126(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-124(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -128(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-126(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -130(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-128(r4), r12           ; 2-byte Folded Reload
	mov.w	-130(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -132(r4)           ; 2-byte Folded Spill
	mov.w	r15, -134(r4)           ; 2-byte Folded Spill
	jmp	.LBB3_23
.LBB3_22:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	&meanmag, r14
	mov.w	&meanmag+2, r15
	call	#__floatsisf
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r13
	mov.w	walking+2(r12), r12
	mov.w	r12, -136(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-136(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -132(r4)           ; 2-byte Folded Spill
	mov.w	r15, -134(r4)           ; 2-byte Folded Spill
.LBB3_23:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-134(r4), r12           ; 2-byte Folded Reload
	mov.w	-132(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfsi
	mov.w	r15, -22(r4)
	mov.w	r14, -24(r4)
	;DEBUG_VALUE: walk_sd_err <- [FPW+-24]
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r13
	mov.w	walking+6(r12), r12
	mov.w	&stddevmag, r14
	mov.w	&stddevmag+2, r15
	mov.w	r13, -138(r4)           ; 2-byte Folded Spill
	mov.w	r12, -140(r4)           ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-138(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -142(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-140(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -144(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-142(r4), r12           ; 2-byte Folded Reload
	mov.w	-144(r4), r13           ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -146(r4)           ; 2-byte Folded Spill
	mov.w	r15, -148(r4)           ; 2-byte Folded Spill
	mov.w	r12, -150(r4)           ; 2-byte Folded Spill
	mov.w	r13, -152(r4)           ; 2-byte Folded Spill
	jl	.LBB3_25
; BB#24:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-150(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -152(r4)           ; 2-byte Folded Spill
.LBB3_25:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-152(r4), r12           ; 2-byte Folded Reload
	mov.w	-146(r4), r13           ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-148(r4), r15           ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -154(r4)           ; 2-byte Folded Spill
	mov.w	r14, -156(r4)           ; 2-byte Folded Spill
	jeq	.LBB3_27
; BB#26:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-154(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -156(r4)           ; 2-byte Folded Spill
.LBB3_27:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-156(r4), r12           ; 2-byte Folded Reload
	mov.w	-138(r4), r14           ; 2-byte Folded Reload
	mov.w	-140(r4), r15           ; 2-byte Folded Reload
	mov.w	-142(r4), r13           ; 2-byte Folded Reload
	mov.w	r12, -158(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-144(r4), r13           ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-158(r4), r13           ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB3_29
	jmp	.LBB3_28
.LBB3_28:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r14
	mov.w	walking+6(r12), r15
	mov.w	&stddevmag, r12
	mov.w	&stddevmag+2, r13
	mov.w	r14, -160(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -162(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-160(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -164(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-162(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -166(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-164(r4), r12           ; 2-byte Folded Reload
	mov.w	-166(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -168(r4)           ; 2-byte Folded Spill
	mov.w	r15, -170(r4)           ; 2-byte Folded Spill
	jmp	.LBB3_30
.LBB3_29:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	&stddevmag, r14
	mov.w	&stddevmag+2, r15
	call	#__floatsisf
	mov.w	-12(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r13
	mov.w	walking+6(r12), r12
	mov.w	r12, -172(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-172(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -168(r4)           ; 2-byte Folded Spill
	mov.w	r15, -170(r4)           ; 2-byte Folded Spill
.LBB3_30:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-170(r4), r12           ; 2-byte Folded Reload
	mov.w	-168(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfsi
	mov.w	r15, -26(r4)
	mov.w	r14, -28(r4)
	mov.w	-24(r4), r12
	mov.w	-22(r4), r13
	mov.w	-16(r4), r14
	mov.w	-14(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -174(r4)           ; 2-byte Folded Spill
	mov.w	r13, -176(r4)           ; 2-byte Folded Spill
	mov.w	r14, -178(r4)           ; 2-byte Folded Spill
	mov.w	r15, -180(r4)           ; 2-byte Folded Spill
	mov.w	r11, -182(r4)           ; 2-byte Folded Spill
	mov.w	r10, -184(r4)           ; 2-byte Folded Spill
	jge	.LBB3_32
; BB#31:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-182(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -184(r4)           ; 2-byte Folded Spill
.LBB3_32:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-184(r4), r12           ; 2-byte Folded Reload
	mov.w	-174(r4), r13           ; 2-byte Folded Reload
	mov.w	-178(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-176(r4), r14           ; 2-byte Folded Reload
	mov.w	-180(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -186(r4)           ; 2-byte Folded Spill
	mov.w	r13, -188(r4)           ; 2-byte Folded Spill
	jeq	.LBB3_34
; BB#33:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-186(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -188(r4)           ; 2-byte Folded Spill
.LBB3_34:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-188(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_36
	jmp	.LBB3_35
.LBB3_35:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB3_37
.LBB3_36:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
.LBB3_37:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-28(r4), r12
	mov.w	-26(r4), r13
	mov.w	-20(r4), r14
	mov.w	-18(r4), r15
	mov.w	#0, r11
	mov.w	#1, r10
	cmp.w	r15, r13
	mov.w	r12, -190(r4)           ; 2-byte Folded Spill
	mov.w	r13, -192(r4)           ; 2-byte Folded Spill
	mov.w	r14, -194(r4)           ; 2-byte Folded Spill
	mov.w	r15, -196(r4)           ; 2-byte Folded Spill
	mov.w	r11, -198(r4)           ; 2-byte Folded Spill
	mov.w	r10, -200(r4)           ; 2-byte Folded Spill
	jge	.LBB3_39
; BB#38:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-198(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -200(r4)           ; 2-byte Folded Spill
.LBB3_39:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-200(r4), r12           ; 2-byte Folded Reload
	mov.w	-190(r4), r13           ; 2-byte Folded Reload
	mov.w	-194(r4), r14           ; 2-byte Folded Reload
	cmp.w	r14, r13
	mov.w	r2, r13
	and.w	#1, r13
	mov.w	-192(r4), r14           ; 2-byte Folded Reload
	mov.w	-196(r4), r15           ; 2-byte Folded Reload
	cmp.w	r15, r14
	mov.w	r12, -202(r4)           ; 2-byte Folded Spill
	mov.w	r13, -204(r4)           ; 2-byte Folded Spill
	jeq	.LBB3_41
; BB#40:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-202(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -204(r4)           ; 2-byte Folded Spill
.LBB3_41:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-204(r4), r12           ; 2-byte Folded Reload
	bit.w	#1, r12
	jne	.LBB3_43
	jmp	.LBB3_42
.LBB3_42:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#1, r12
	mov.w	r12, -8(r4)
	jmp	.LBB3_44
.LBB3_43:                               ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
.LBB3_44:                               ;   in Loop: Header=BB3_1 Depth=1
; BB#45:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-12(r4), r12
	add.w	#2, r12
	mov.w	r12, -12(r4)
	br	#.LBB3_1
.LBB3_46:
	mov.w	-8(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r12, r13
	jge	.LBB3_48
	jmp	.LBB3_47
.LBB3_47:
	mov.w	#1, -6(r4)
	jmp	.LBB3_49
.LBB3_48:
	mov.w	#0, -6(r4)
.LBB3_49:
	mov.w	-6(r4), r15
	add.w	#200, r1
	pop.w	r10
	pop.w	r11
	pop.w	r4
	ret
.Ltmp3:
	.size	classify, .Ltmp3-classify

	.globl	initializeNVData
	.align	2
	.type	initializeNVData,@function
initializeNVData:                       ; @initializeNVData
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	&0xD000, r12
	cmp.w	#-1, r12
	jne	.LBB4_4
	jmp	.LBB4_1
.LBB4_1:
	mov.w	&0xD002, r12
	cmp.w	#-1, r12
	jne	.LBB4_4
	jmp	.LBB4_2
.LBB4_2:
	mov.w	&0xD004, r12
	cmp.w	#-1, r12
	jne	.LBB4_4
	jmp	.LBB4_3
.LBB4_3:
	mov.w	#0, &0xD000
	mov.w	#0, &0xD002
	mov.w	#0, &0xD004
.LBB4_4:
	pop.w	r4
	ret
.Ltmp4:
	.size	initializeNVData, .Ltmp4-initializeNVData

	.globl	initializeHardware
	.align	2
	.type	initializeHardware,@function
initializeHardware:                     ; @initializeHardware
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.b	&__PADIR_L, r12
	bis.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &__PADIR_L
	call	#ACCEL_setup
	mov.w	#45, r15
	mov.w	#2, r14
	call	#ACCEL_SetReg
	pop.w	r4
	ret
.Ltmp5:
	.size	initializeHardware, .Ltmp5-initializeHardware

	.globl	clearExperimentalData
	.align	2
	.type	clearExperimentalData,@function
clearExperimentalData:                  ; @clearExperimentalData
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	#0, &0xD000
	mov.w	#0, &0xD002
	mov.w	#0, &0xD004
	pop.w	r4
	ret
.Ltmp6:
	.size	clearExperimentalData, .Ltmp6-clearExperimentalData

	.section	.init9,"ax",@progbits
	.globl	main
	.align	1
	.type	main,@function
main:                                   ; @main
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	;DEBUG_VALUE: main:argc <- undef
	;DEBUG_VALUE: main:argv <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	#0, -2(r4)
	mov.w	r15, -4(r4)
	mov.w	r14, -6(r4)
	mov.w	#23168, &__WDTCTL
	mov.w	&__PM5CTL0, r14
	and.w	#-2, r14
	mov.w	r14, &__PM5CTL0
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	call	#initializeHardware
	call	#initializeNVData
.LBB7_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_2 Depth 2
                                        ;     Child Loop BB7_9 Depth 2
.LBB7_2:                                ;   Parent Loop BB7_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	&0xD004, r12
	cmp.w	#100, r12
	jlo	.LBB7_6
	jmp	.LBB7_3
.LBB7_3:                                ;   in Loop: Header=BB7_2 Depth=2
	mov.b	&__PBIN_H, r12
	bit.w	#64, r12
	jeq	.LBB7_5
	jmp	.LBB7_4
.LBB7_4:                                ;   in Loop: Header=BB7_2 Depth=2
	call	#clearExperimentalData
.LBB7_5:                                ;   in Loop: Header=BB7_2 Depth=2
	jmp	.LBB7_2
.LBB7_6:                                ;   in Loop: Header=BB7_1 Depth=1
	mov.b	&__PBIN_H, r12
	bit.w	#64, r12
	jeq	.LBB7_8
	jmp	.LBB7_7
.LBB7_7:                                ;   in Loop: Header=BB7_1 Depth=1
	call	#clearExperimentalData
.LBB7_8:                                ;   in Loop: Header=BB7_1 Depth=1
	call	#getNextSample
	mov.b	&__PAOUT_L, r12
	xor.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &__PAOUT_L
	call	#featurize
	;DEBUG_VALUE: class <- [FPW+-8]
	call	#classify
	mov.w	r15, -8(r4)
	mov.w	&0xD004, r12
	add.w	#1, r12
	mov.w	r12, &0xD004
	;DEBUG_VALUE: q <- [FPW+-10]
	mov.w	#0, -10(r4)
.LBB7_9:                                ;   Parent Loop BB7_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-10(r4), r12
	cmp.w	#255, r12
	jge	.LBB7_12
	jmp	.LBB7_10
.LBB7_10:                               ;   in Loop: Header=BB7_9 Depth=2
; BB#11:                                ;   in Loop: Header=BB7_9 Depth=2
	mov.w	-10(r4), r12
	add.w	#1, r12
	mov.w	r12, -10(r4)
	jmp	.LBB7_9
.LBB7_12:                               ;   in Loop: Header=BB7_1 Depth=1
	mov.w	-8(r4), r12
	cmp.w	#0, r12
	jeq	.LBB7_14
	jmp	.LBB7_13
.LBB7_13:                               ;   in Loop: Header=BB7_1 Depth=1
	mov.w	&0xD000, r12
	add.w	#1, r12
	mov.w	r12, &0xD000
	jmp	.LBB7_15
.LBB7_14:                               ;   in Loop: Header=BB7_1 Depth=1
	mov.w	&0xD002, r12
	add.w	#1, r12
	mov.w	r12, &0xD002
.LBB7_15:                               ;   in Loop: Header=BB7_1 Depth=1
	jmp	.LBB7_1
.Ltmp7:
	.size	main, .Ltmp7-main

	.type	currSamp,@object        ; @currSamp
	.local	currSamp
	.comm	currSamp,2,2
	.type	aWin,@object            ; @aWin
	.local	aWin
	.comm	aWin,48,2
	.type	mean,@object            ; @mean
	.local	mean
	.comm	mean,12,2
	.type	stddev,@object          ; @stddev
	.local	stddev
	.comm	stddev,12,2
	.type	meanmag,@object         ; @meanmag
	.local	meanmag
	.comm	meanmag,4,2
	.type	stddevmag,@object       ; @stddevmag
	.local	stddevmag
	.comm	stddevmag,4,2
	.type	stationary,@object      ; @stationary
	.data
	.align	2
stationary:
	.long	1150271488              ; float 1.150000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1077936128              ; float 3.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150255104              ; float 1.148000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150263296              ; float 1.149000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150271488              ; float 1.150000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150279680              ; float 1.151000e+03
	.long	1084227584              ; float 5.000000e+00
	.long	1150279680              ; float 1.151000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150279680              ; float 1.151000e+03
	.long	1082130432              ; float 4.000000e+00
	.long	1150279680              ; float 1.151000e+03
	.long	1112276992              ; float 5.100000e+01
	.long	1150279680              ; float 1.151000e+03
	.long	1113587712              ; float 5.600000e+01
	.long	1150271488              ; float 1.150000e+03
	.long	1115684864              ; float 6.400000e+01
	.long	1150263296              ; float 1.149000e+03
	.long	1115815936              ; float 6.500000e+01
	.long	1150263296              ; float 1.149000e+03
	.long	1115815936              ; float 6.500000e+01
	.long	1150255104              ; float 1.148000e+03
	.long	1121320960              ; float 1.070000e+02
	.long	1150255104              ; float 1.148000e+03
	.long	1121976320              ; float 1.120000e+02
	.long	1150246912              ; float 1.147000e+03
	.long	1121976320              ; float 1.120000e+02
	.long	1150255104              ; float 1.148000e+03
	.long	1121976320              ; float 1.120000e+02
	.size	stationary, 400

	.type	walking,@object         ; @walking
	.align	2
walking:
	.long	1150164992              ; float 1.137000e+03
	.long	1119223808              ; float 9.100000e+01
	.long	1150115840              ; float 1.131000e+03
	.long	1120141312              ; float 9.800000e+01
	.long	1150156800              ; float 1.136000e+03
	.long	1120927744              ; float 1.040000e+02
	.long	1150279680              ; float 1.151000e+03
	.long	1122500608              ; float 1.160000e+02
	.long	1150246912              ; float 1.147000e+03
	.long	1122107392              ; float 1.130000e+02
	.long	1150296064              ; float 1.153000e+03
	.long	1122238464              ; float 1.140000e+02
	.long	1150296064              ; float 1.153000e+03
	.long	1121976320              ; float 1.120000e+02
	.long	1150197760              ; float 1.141000e+03
	.long	1121714176              ; float 1.100000e+02
	.long	1150238720              ; float 1.146000e+03
	.long	1122107392              ; float 1.130000e+02
	.long	1150255104              ; float 1.148000e+03
	.long	1121320960              ; float 1.070000e+02
	.long	1150312448              ; float 1.155000e+03
	.long	1122238464              ; float 1.140000e+02
	.long	1150427136              ; float 1.169000e+03
	.long	1122893824              ; float 1.190000e+02
	.long	1150271488              ; float 1.150000e+03
	.long	1122500608              ; float 1.160000e+02
	.long	1150099456              ; float 1.129000e+03
	.long	1121058816              ; float 1.050000e+02
	.long	1150238720              ; float 1.146000e+03
	.long	1122238464              ; float 1.140000e+02
	.long	1150386176              ; float 1.164000e+03
	.long	1124139008              ; float 1.290000e+02
	.long	1150345216              ; float 1.159000e+03
	.long	1124925440              ; float 1.410000e+02
	.long	1150205952              ; float 1.142000e+03
	.long	1125908480              ; float 1.560000e+02
	.long	1150132224              ; float 1.133000e+03
	.long	1126236160              ; float 1.610000e+02
	.long	1150066688              ; float 1.125000e+03
	.long	1126301696              ; float 1.620000e+02
	.long	1150197760              ; float 1.141000e+03
	.long	1127088128              ; float 1.740000e+02
	.long	1150328832              ; float 1.157000e+03
	.long	1127874560              ; float 1.860000e+02
	.long	1150337024              ; float 1.158000e+03
	.long	1127677952              ; float 1.830000e+02
	.long	1150246912              ; float 1.147000e+03
	.long	1128136704              ; float 1.900000e+02
	.long	1150099456              ; float 1.129000e+03
	.long	1127284736              ; float 1.770000e+02
	.long	1150001152              ; float 1.117000e+03
	.long	1126432768              ; float 1.640000e+02
	.long	1150107648              ; float 1.130000e+03
	.long	1127022592              ; float 1.730000e+02
	.long	1150394368              ; float 1.165000e+03
	.long	1126563840              ; float 1.660000e+02
	.long	1150296064              ; float 1.153000e+03
	.long	1126957056              ; float 1.720000e+02
	.long	1150205952              ; float 1.142000e+03
	.long	1127809024              ; float 1.850000e+02
	.long	1150042112              ; float 1.122000e+03
	.long	1127219200              ; float 1.760000e+02
	.long	1149952000              ; float 1.111000e+03
	.long	1126825984              ; float 1.700000e+02
	.long	1150189568              ; float 1.140000e+03
	.long	1127612416              ; float 1.820000e+02
	.long	1150353408              ; float 1.160000e+03
	.long	1126694912              ; float 1.680000e+02
	.long	1150205952              ; float 1.142000e+03
	.long	1127743488              ; float 1.840000e+02
	.long	1150083072              ; float 1.127000e+03
	.long	1127809024              ; float 1.850000e+02
	.long	1150148608              ; float 1.135000e+03
	.long	1128136704              ; float 1.900000e+02
	.long	1149976576              ; float 1.114000e+03
	.long	1127677952              ; float 1.830000e+02
	.long	1150189568              ; float 1.140000e+03
	.long	1128005632              ; float 1.880000e+02
	.long	1150337024              ; float 1.158000e+03
	.long	1127088128              ; float 1.740000e+02
	.long	1150255104              ; float 1.148000e+03
	.long	1127874560              ; float 1.860000e+02
	.long	1150009344              ; float 1.118000e+03
	.long	1127153664              ; float 1.750000e+02
	.long	1150042112              ; float 1.122000e+03
	.long	1127153664              ; float 1.750000e+02
	.long	1150115840              ; float 1.131000e+03
	.long	1127677952              ; float 1.830000e+02
	.long	1150279680              ; float 1.151000e+03
	.long	1126432768              ; float 1.640000e+02
	.long	1150115840              ; float 1.131000e+03
	.long	1127677952              ; float 1.830000e+02
	.long	1149861888              ; float 1.100000e+03
	.long	1127284736              ; float 1.770000e+02
	.long	1149960192              ; float 1.112000e+03
	.long	1127350272              ; float 1.780000e+02
	.long	1150058496              ; float 1.124000e+03
	.long	1128202240              ; float 1.910000e+02
	.long	1150017536              ; float 1.119000e+03
	.long	1128857600              ; float 2.010000e+02
	.size	walking, 400


	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
