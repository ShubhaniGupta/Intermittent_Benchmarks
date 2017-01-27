	.file	"ar.bc"
	.text
	.globl	__dino_recover
	.align	2
	.type	__dino_recover,@function
__dino_recover:                         ; @__dino_recover
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: __dino_recover:recovery <- undef
	mov.w	4(r4), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r13
	cmp.w	#2, r12
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	mov.w	r13, -10(r4)            ; 2-byte Folded Spill
	jeq	.LBB0_3
	jmp	.LBB0_1
.LBB0_1:
	mov.w	-8(r4), r12             ; 2-byte Folded Reload
	cmp.w	#1, r12
	jne	.LBB0_4
	jmp	.LBB0_2
.LBB0_2:
	;DEBUG_VALUE: a <- [FPW+-4]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -4(r4)
	jmp	.LBB0_5
.LBB0_3:
	;DEBUG_VALUE: a <- [FPW+-6]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -6(r4)
	jmp	.LBB0_5
.LBB0_4:
.LBB0_5:
	add.w	#10, r1
	pop.w	r4
	ret
.Ltmp0:
	.size	__dino_recover, .Ltmp0-__dino_recover

	.globl	getOneSample
	.align	2
	.type	getOneSample,@function
getOneSample:                           ; @getOneSample
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: getOneSample:tr <- undef
	mov.w	r15, r12
	mov.w	r15, -2(r4)
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#ACCEL_getX
	mov.w	r15, -4(r4)
	call	#ACCEL_getY
	mov.w	r15, -6(r4)
	call	#ACCEL_getZ
	mov.w	r15, -8(r4)
	mov.w	-4(r4), r12
	mov.w	-2(r4), r15
	mov.w	r12, 0(r15)
	mov.w	-6(r4), r12
	mov.w	-2(r4), r15
	mov.w	r12, 2(r15)
	mov.w	-8(r4), r12
	mov.w	-2(r4), r15
	mov.w	r12, 4(r15)
	add.w	#10, r1
	pop.w	r4
	ret
.Ltmp1:
	.size	getOneSample, .Ltmp1-getOneSample

	.globl	getNextSample
	.align	2
	.type	getNextSample,@function
getNextSample:                          ; @getNextSample
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	&currSamp, r15
	mov.w	#6, r14
	call	#__mulhi3
	add.w	#aWin, r15
	call	#getOneSample
	mov.w	&currSamp, r14
	add.w	#1, r14
	mov.w	r14, &currSamp
	cmp.w	#4, r14
	jl	.LBB2_2
	jmp	.LBB2_1
.LBB2_1:
	mov.w	#0, &currSamp
.LBB2_2:
	pop.w	r4
	ret
.Ltmp2:
	.size	getNextSample, .Ltmp2-getNextSample

	.globl	featurize
	.align	2
	.type	featurize,@function
featurize:                              ; @featurize
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#28, r1
	mov.w	#0, &mean+4
	mov.w	#0, &mean+2
	mov.w	#0, &mean
	mov.w	#0, &stddev+4
	mov.w	#0, &stddev+2
	mov.w	#0, &stddev
	mov.w	#0, -2(r4)
.LBB3_1:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#4, r12
	jge	.LBB3_4
	jmp	.LBB3_2
.LBB3_2:                                ;   in Loop: Header=BB3_1 Depth=1
	mov.w	&mean, r12
	mov.w	-2(r4), r15
	mov.w	#6, r13
	mov.w	r13, r14
	mov.w	r12, -4(r4)             ; 2-byte Folded Spill
	mov.w	r13, -6(r4)             ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin(r15), r12
	mov.w	-4(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.w	r13, &mean
	mov.w	&mean+2, r12
	mov.w	-2(r4), r15
	mov.w	-6(r4), r14             ; 2-byte Folded Reload
	mov.w	r12, -8(r4)             ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+2(r15), r12
	mov.w	-8(r4), r13             ; 2-byte Folded Reload
	add.w	r12, r13
	mov.w	r13, &mean+2
	mov.w	&mean+4, r12
	mov.w	-2(r4), r15
	mov.w	-6(r4), r14             ; 2-byte Folded Reload
	mov.w	r12, -10(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	-10(r4), r13            ; 2-byte Folded Reload
	add.w	r12, r13
	mov.w	r13, &mean+4
; BB#3:                                 ;   in Loop: Header=BB3_1 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_1
.LBB3_4:
	mov.w	&mean, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	add.w	r13, r12
	rra.w	r12
	rra.w	r12
	mov.w	r12, &mean
	mov.w	&mean+2, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	add.w	r13, r12
	rra.w	r12
	rra.w	r12
	mov.w	r12, &mean+2
	mov.w	&mean+4, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	clrc
	rrc.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	add.w	r13, r12
	rra.w	r12
	rra.w	r12
	mov.w	r12, &mean+4
	mov.w	#0, -2(r4)
.LBB3_5:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#4, r12
	jge	.LBB3_17
	jmp	.LBB3_6
.LBB3_6:                                ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin(r15), r14
	mov.w	&mean, r15
	cmp.w	r14, r15
	jge	.LBB3_8
	jmp	.LBB3_7
.LBB3_7:                                ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin(r15), r14
	mov.w	&mean, r15
	sub.w	r15, r14
	mov.w	r14, -12(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_9
.LBB3_8:                                ;   in Loop: Header=BB3_5 Depth=1
	mov.w	&mean, r12
	mov.w	-2(r4), r15
	mov.w	#6, r14
	mov.w	r12, -14(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin(r15), r12
	mov.w	-14(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	r14, -12(r4)            ; 2-byte Folded Spill
.LBB3_9:                                ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-12(r4), r12            ; 2-byte Folded Reload
	mov.w	&stddev, r13
	add.w	r12, r13
	mov.w	r13, &stddev
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin+2(r15), r12
	mov.w	&mean+2, r13
	cmp.w	r12, r13
	jge	.LBB3_11
	jmp	.LBB3_10
.LBB3_10:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin+2(r15), r14
	mov.w	&mean+2, r15
	sub.w	r15, r14
	mov.w	r14, -16(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_12
.LBB3_11:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	&mean+2, r12
	mov.w	-2(r4), r15
	mov.w	#6, r14
	mov.w	r12, -18(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+2(r15), r12
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	r14, -16(r4)            ; 2-byte Folded Spill
.LBB3_12:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-16(r4), r12            ; 2-byte Folded Reload
	mov.w	&stddev+2, r13
	add.w	r12, r13
	mov.w	r13, &stddev+2
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	&mean+4, r13
	cmp.w	r12, r13
	jge	.LBB3_14
	jmp	.LBB3_13
.LBB3_13:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-2(r4), r15
	mov.w	#6, r14
	call	#__mulhi3
	mov.w	aWin+4(r15), r14
	mov.w	&mean+4, r15
	sub.w	r15, r14
	mov.w	r14, -20(r4)            ; 2-byte Folded Spill
	jmp	.LBB3_15
.LBB3_14:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	&mean+4, r12
	mov.w	-2(r4), r15
	mov.w	#6, r14
	mov.w	r12, -22(r4)            ; 2-byte Folded Spill
	call	#__mulhi3
	mov.w	aWin+4(r15), r12
	mov.w	-22(r4), r14            ; 2-byte Folded Reload
	sub.w	r12, r14
	mov.w	r14, -20(r4)            ; 2-byte Folded Spill
.LBB3_15:                               ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-20(r4), r12            ; 2-byte Folded Reload
	mov.w	&stddev+4, r13
	add.w	r12, r13
	mov.w	r13, &stddev+4
; BB#16:                                ;   in Loop: Header=BB3_5 Depth=1
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB3_5
.LBB3_17:
	mov.w	&stddev, r15
	mov.w	#3, r12
	mov.w	r12, r14
	mov.w	r12, -24(r4)            ; 2-byte Folded Spill
	call	#__divhi3
	mov.w	r15, &stddev
	mov.w	&stddev+2, r15
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	call	#__divhi3
	mov.w	r15, &stddev+2
	mov.w	&stddev+4, r15
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	call	#__divhi3
	mov.w	r15, &stddev+4
	mov.w	&mean, r12
	mov.w	&mean+2, r14
	add.w	r14, r12
	mov.w	&mean+4, r15
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	mov.w	r12, -26(r4)            ; 2-byte Folded Spill
	call	#__divhi3
	mov.w	-26(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, &meanmag
	mov.w	&stddev, r12
	mov.w	&stddev+2, r14
	add.w	r14, r12
	mov.w	&stddev+4, r15
	mov.w	-24(r4), r14            ; 2-byte Folded Reload
	mov.w	r12, -28(r4)            ; 2-byte Folded Spill
	call	#__divhi3
	mov.w	-28(r4), r12            ; 2-byte Folded Reload
	add.w	r15, r12
	mov.w	r12, &stddevmag
	add.w	#28, r1
	pop.w	r4
	ret
.Ltmp3:
	.size	featurize, .Ltmp3-featurize

	.globl	classify
	.align	2
	.type	classify,@function
classify:                               ; @classify
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#160, r1
	mov.w	#0, -4(r4)
	mov.w	#0, -6(r4)
	mov.w	#0, -8(r4)
.LBB4_1:                                ; =>This Inner Loop Header: Depth=1
	mov.w	-8(r4), r12
	cmp.w	#10, r12
	jl	4
	br	#.LBB4_38
	jmp	.LBB4_2
.LBB4_2:                                ;   in Loop: Header=BB4_1 Depth=1
	;DEBUG_VALUE: stat_mean_err <- [FPW+-10]
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r13
	mov.w	stationary+2(r12), r12
	mov.w	&meanmag, r14
	mov.w	r14, r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r13, -18(r4)            ; 2-byte Folded Spill
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-18(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -22(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-20(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -24(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-22(r4), r12            ; 2-byte Folded Reload
	mov.w	-24(r4), r13            ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -26(r4)            ; 2-byte Folded Spill
	mov.w	r15, -28(r4)            ; 2-byte Folded Spill
	mov.w	r12, -30(r4)            ; 2-byte Folded Spill
	mov.w	r13, -32(r4)            ; 2-byte Folded Spill
	jl	.LBB4_4
; BB#3:                                 ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-30(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -32(r4)            ; 2-byte Folded Spill
.LBB4_4:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-32(r4), r12            ; 2-byte Folded Reload
	mov.w	-26(r4), r13            ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-28(r4), r15            ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -34(r4)            ; 2-byte Folded Spill
	mov.w	r14, -36(r4)            ; 2-byte Folded Spill
	jeq	.LBB4_6
; BB#5:                                 ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-34(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -36(r4)            ; 2-byte Folded Spill
.LBB4_6:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-36(r4), r12            ; 2-byte Folded Reload
	mov.w	-18(r4), r14            ; 2-byte Folded Reload
	mov.w	-20(r4), r15            ; 2-byte Folded Reload
	mov.w	-22(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -38(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-24(r4), r13            ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-38(r4), r13            ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB4_8
	jmp	.LBB4_7
.LBB4_7:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r14
	mov.w	stationary+2(r12), r15
	mov.w	&meanmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r14, -40(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -42(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-40(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -44(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-42(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -46(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-44(r4), r12            ; 2-byte Folded Reload
	mov.w	-46(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -48(r4)            ; 2-byte Folded Spill
	mov.w	r15, -50(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_9
.LBB4_8:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	&meanmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r12, r14
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary(r12), r13
	mov.w	stationary+2(r12), r12
	mov.w	r12, -52(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-52(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -48(r4)            ; 2-byte Folded Spill
	mov.w	r15, -50(r4)            ; 2-byte Folded Spill
.LBB4_9:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-50(r4), r12            ; 2-byte Folded Reload
	mov.w	-48(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfhi
	mov.w	r15, -10(r4)
	;DEBUG_VALUE: stat_sd_err <- [FPW+-12]
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r13
	mov.w	stationary+6(r12), r12
	mov.w	&stddevmag, r14
	mov.w	r14, r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r13, -54(r4)            ; 2-byte Folded Spill
	mov.w	r12, -56(r4)            ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-54(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -58(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-56(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -60(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-58(r4), r12            ; 2-byte Folded Reload
	mov.w	-60(r4), r13            ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -62(r4)            ; 2-byte Folded Spill
	mov.w	r15, -64(r4)            ; 2-byte Folded Spill
	mov.w	r12, -66(r4)            ; 2-byte Folded Spill
	mov.w	r13, -68(r4)            ; 2-byte Folded Spill
	jl	.LBB4_11
; BB#10:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-66(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -68(r4)            ; 2-byte Folded Spill
.LBB4_11:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-68(r4), r12            ; 2-byte Folded Reload
	mov.w	-62(r4), r13            ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-64(r4), r15            ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -70(r4)            ; 2-byte Folded Spill
	mov.w	r14, -72(r4)            ; 2-byte Folded Spill
	jeq	.LBB4_13
; BB#12:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-70(r4), r12            ; 2-byte Folded Reload
	mov.w	r12, -72(r4)            ; 2-byte Folded Spill
.LBB4_13:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-72(r4), r12            ; 2-byte Folded Reload
	mov.w	-54(r4), r14            ; 2-byte Folded Reload
	mov.w	-56(r4), r15            ; 2-byte Folded Reload
	mov.w	-58(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -74(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-60(r4), r13            ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-74(r4), r13            ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB4_15
	jmp	.LBB4_14
.LBB4_14:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r14
	mov.w	stationary+6(r12), r15
	mov.w	&stddevmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r14, -76(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -78(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-76(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -80(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-78(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -82(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-80(r4), r12            ; 2-byte Folded Reload
	mov.w	-82(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -84(r4)            ; 2-byte Folded Spill
	mov.w	r15, -86(r4)            ; 2-byte Folded Spill
	jmp	.LBB4_16
.LBB4_15:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	&stddevmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r12, r14
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	stationary+4(r12), r13
	mov.w	stationary+6(r12), r12
	mov.w	r12, -88(r4)            ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-88(r4), r13            ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -84(r4)            ; 2-byte Folded Spill
	mov.w	r15, -86(r4)            ; 2-byte Folded Spill
.LBB4_16:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-86(r4), r12            ; 2-byte Folded Reload
	mov.w	-84(r4), r13            ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfhi
	mov.w	r15, -12(r4)
	;DEBUG_VALUE: walk_mean_err <- [FPW+-14]
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r13
	mov.w	walking+2(r12), r12
	mov.w	&meanmag, r14
	mov.w	r14, r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r13, -90(r4)            ; 2-byte Folded Spill
	mov.w	r12, -92(r4)            ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-90(r4), r12            ; 2-byte Folded Reload
	mov.w	r14, -94(r4)            ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-92(r4), r13            ; 2-byte Folded Reload
	mov.w	r15, -96(r4)            ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-94(r4), r12            ; 2-byte Folded Reload
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -98(r4)            ; 2-byte Folded Spill
	mov.w	r15, -100(r4)           ; 2-byte Folded Spill
	mov.w	r12, -102(r4)           ; 2-byte Folded Spill
	mov.w	r13, -104(r4)           ; 2-byte Folded Spill
	jl	.LBB4_18
; BB#17:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-102(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -104(r4)           ; 2-byte Folded Spill
.LBB4_18:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-104(r4), r12           ; 2-byte Folded Reload
	mov.w	-98(r4), r13            ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-100(r4), r15           ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -106(r4)           ; 2-byte Folded Spill
	mov.w	r14, -108(r4)           ; 2-byte Folded Spill
	jeq	.LBB4_20
; BB#19:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-106(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -108(r4)           ; 2-byte Folded Spill
.LBB4_20:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-108(r4), r12           ; 2-byte Folded Reload
	mov.w	-90(r4), r14            ; 2-byte Folded Reload
	mov.w	-92(r4), r15            ; 2-byte Folded Reload
	mov.w	-94(r4), r13            ; 2-byte Folded Reload
	mov.w	r12, -110(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-96(r4), r13            ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-110(r4), r13           ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB4_22
	jmp	.LBB4_21
.LBB4_21:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r14
	mov.w	walking+2(r12), r15
	mov.w	&meanmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r14, -112(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -114(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-112(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -116(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-114(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -118(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-116(r4), r12           ; 2-byte Folded Reload
	mov.w	-118(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -120(r4)           ; 2-byte Folded Spill
	mov.w	r15, -122(r4)           ; 2-byte Folded Spill
	jmp	.LBB4_23
.LBB4_22:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	&meanmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r12, r14
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking(r12), r13
	mov.w	walking+2(r12), r12
	mov.w	r12, -124(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-124(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -120(r4)           ; 2-byte Folded Spill
	mov.w	r15, -122(r4)           ; 2-byte Folded Spill
.LBB4_23:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-122(r4), r12           ; 2-byte Folded Reload
	mov.w	-120(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfhi
	mov.w	r15, -14(r4)
	;DEBUG_VALUE: walk_sd_err <- [FPW+-16]
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r13
	mov.w	walking+6(r12), r12
	mov.w	&stddevmag, r14
	mov.w	r14, r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	rra.w	r15
	mov.w	r13, -126(r4)           ; 2-byte Folded Spill
	mov.w	r12, -128(r4)           ; 2-byte Folded Spill
	call	#__floatsisf
	mov.w	-126(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -130(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-128(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -132(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-130(r4), r12           ; 2-byte Folded Reload
	mov.w	-132(r4), r13           ; 2-byte Folded Reload
	call	#__lesf2
	mov.w	#0, r12
	mov.w	#1, r13
	cmp.w	#1, r15
	mov.w	r14, -134(r4)           ; 2-byte Folded Spill
	mov.w	r15, -136(r4)           ; 2-byte Folded Spill
	mov.w	r12, -138(r4)           ; 2-byte Folded Spill
	mov.w	r13, -140(r4)           ; 2-byte Folded Spill
	jl	.LBB4_25
; BB#24:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-138(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -140(r4)           ; 2-byte Folded Spill
.LBB4_25:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-140(r4), r12           ; 2-byte Folded Reload
	mov.w	-134(r4), r13           ; 2-byte Folded Reload
	cmp.w	#0, r13
	mov.w	r2, r14
	rra.w	r14
	and.w	#1, r14
	mov.w	-136(r4), r15           ; 2-byte Folded Reload
	cmp.w	#0, r15
	mov.w	r12, -142(r4)           ; 2-byte Folded Spill
	mov.w	r14, -144(r4)           ; 2-byte Folded Spill
	jeq	.LBB4_27
; BB#26:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-142(r4), r12           ; 2-byte Folded Reload
	mov.w	r12, -144(r4)           ; 2-byte Folded Spill
.LBB4_27:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-144(r4), r12           ; 2-byte Folded Reload
	mov.w	-126(r4), r14           ; 2-byte Folded Reload
	mov.w	-128(r4), r15           ; 2-byte Folded Reload
	mov.w	-130(r4), r13           ; 2-byte Folded Reload
	mov.w	r12, -146(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-132(r4), r13           ; 2-byte Folded Reload
	call	#__unordsf2
	bis.w	r15, r14
	cmp.w	#0, r14
	mov.w	r2, r12
	rra.w	r12
	xor.w	#-1, r12
	mov.w	-146(r4), r13           ; 2-byte Folded Reload
	bis.w	r13, r12
	bit.w	#1, r12
	jne	.LBB4_29
	jmp	.LBB4_28
.LBB4_28:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r14
	mov.w	walking+6(r12), r15
	mov.w	&stddevmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r14, -148(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	r15, -150(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-148(r4), r12           ; 2-byte Folded Reload
	mov.w	r14, -152(r4)           ; 2-byte Folded Spill
	mov.w	r12, r14
	mov.w	-150(r4), r13           ; 2-byte Folded Reload
	mov.w	r15, -154(r4)           ; 2-byte Folded Spill
	mov.w	r13, r15
	mov.w	-152(r4), r12           ; 2-byte Folded Reload
	mov.w	-154(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -156(r4)           ; 2-byte Folded Spill
	mov.w	r15, -158(r4)           ; 2-byte Folded Spill
	jmp	.LBB4_30
.LBB4_29:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	&stddevmag, r12
	mov.w	r12, r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	mov.w	r12, r14
	mov.w	r13, r15
	call	#__floatsisf
	mov.w	-8(r4), r12
	rla.w	r12
	rla.w	r12
	mov.w	walking+4(r12), r13
	mov.w	walking+6(r12), r12
	mov.w	r12, -160(r4)           ; 2-byte Folded Spill
	mov.w	r13, r12
	mov.w	-160(r4), r13           ; 2-byte Folded Reload
	call	#__subsf3
	mov.w	r14, -156(r4)           ; 2-byte Folded Spill
	mov.w	r15, -158(r4)           ; 2-byte Folded Spill
.LBB4_30:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-158(r4), r12           ; 2-byte Folded Reload
	mov.w	-156(r4), r13           ; 2-byte Folded Reload
	mov.w	r13, r14
	mov.w	r12, r15
	call	#__fixsfhi
	mov.w	r15, -16(r4)
	mov.w	-14(r4), r12
	mov.w	-10(r4), r13
	cmp.w	r13, r12
	jge	.LBB4_32
	jmp	.LBB4_31
.LBB4_31:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB4_33
.LBB4_32:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
.LBB4_33:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-16(r4), r12
	mov.w	-12(r4), r13
	cmp.w	r13, r12
	jge	.LBB4_35
	jmp	.LBB4_34
.LBB4_34:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-4(r4), r12
	add.w	#1, r12
	mov.w	r12, -4(r4)
	jmp	.LBB4_36
.LBB4_35:                               ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-6(r4), r12
	add.w	#1, r12
	mov.w	r12, -6(r4)
.LBB4_36:                               ;   in Loop: Header=BB4_1 Depth=1
; BB#37:                                ;   in Loop: Header=BB4_1 Depth=1
	mov.w	-8(r4), r12
	add.w	#2, r12
	mov.w	r12, -8(r4)
	br	#.LBB4_1
.LBB4_38:
	mov.w	-4(r4), r12
	mov.w	-6(r4), r13
	cmp.w	r12, r13
	jge	.LBB4_40
	jmp	.LBB4_39
.LBB4_39:
	mov.w	#1, -2(r4)
	jmp	.LBB4_41
.LBB4_40:
	mov.w	#0, -2(r4)
.LBB4_41:
	mov.w	-2(r4), r15
	add.w	#160, r1
	pop.w	r4
	ret
.Ltmp4:
	.size	classify, .Ltmp4-classify

	.globl	initializeNVData
	.align	2
	.type	initializeNVData,@function
initializeNVData:                       ; @initializeNVData
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	&0xD000, r12
	cmp.w	#-1, r12
	jne	.LBB5_4
	jmp	.LBB5_1
.LBB5_1:
	mov.w	&0xD002, r12
	cmp.w	#-1, r12
	jne	.LBB5_4
	jmp	.LBB5_2
.LBB5_2:
	mov.w	&0xD004, r12
	cmp.w	#-1, r12
	jne	.LBB5_4
	jmp	.LBB5_3
.LBB5_3:
	mov.w	#0, &0xD000
	mov.w	#0, &0xD002
	mov.w	#0, &0xD004
.LBB5_4:
	pop.w	r4
	ret
.Ltmp5:
	.size	initializeNVData, .Ltmp5-initializeNVData

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
.Ltmp6:
	.size	initializeHardware, .Ltmp6-initializeHardware

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
.Ltmp7:
	.size	clearExperimentalData, .Ltmp7-clearExperimentalData

	.section	.init9,"ax",@progbits
	.globl	main
	.align	1
	.type	main,@function
main:                                   ; @main
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#22, r1
	;DEBUG_VALUE: main:argc <- undef
	;DEBUG_VALUE: main:argv <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	#0, -8(r4)
	mov.w	r15, -10(r4)
	mov.w	r14, -12(r4)
	mov.w	#23168, &__WDTCTL
	mov.w	&__PM5CTL0, r14
	and.w	#-2, r14
	mov.w	r14, &__PM5CTL0
	mov.w	r12, -20(r4)            ; 2-byte Folded Spill
	mov.w	r13, -22(r4)            ; 2-byte Folded Spill
	call	#initializeHardware
; BB#1:
	mov.w	&0xD000, r12
	mov.w	r12, -6(r4)
	mov.w	&0xD002, r12
	mov.w	r12, -4(r4)
	mov.w	&0xD004, r12
	mov.w	r12, -2(r4)
	mov.w	#0, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	-2(r4), r12
	mov.w	r12, &0xD004
	mov.w	-4(r4), r12
	mov.w	r12, &0xD002
	mov.w	-6(r4), r12
	mov.w	r12, &0xD000
	call	#initializeNVData
	;DEBUG_VALUE: main:addr <- [FPW+-14]
	call	#__mementos_find_active_bundle
	mov.w	r15, -14(r4)
	cmp.w	#-1, r15
	jeq	.LBB8_3
	jmp	.LBB8_2
.LBB8_2:
	mov.w	-14(r4), r15
	call	#__mementos_restore
.LBB8_3:
.LBB8_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_5 Depth 2
                                        ;     Child Loop BB8_13 Depth 2
	mov.w	&0xD004, r12
	mov.w	r12, -2(r4)
	mov.w	#1, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	-2(r4), r12
	mov.w	r12, &0xD004
.LBB8_5:                                ;   Parent Loop BB8_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	&0xD004, r12
	cmp.w	#100, r12
	jlo	.LBB8_9
	jmp	.LBB8_6
.LBB8_6:                                ;   in Loop: Header=BB8_5 Depth=2
	mov.b	&__PBIN_H, r12
	bit.w	#64, r12
	jeq	.LBB8_8
	jmp	.LBB8_7
.LBB8_7:                                ;   in Loop: Header=BB8_5 Depth=2
	call	#clearExperimentalData
.LBB8_8:                                ;   in Loop: Header=BB8_5 Depth=2
	jmp	.LBB8_5
.LBB8_9:                                ;   in Loop: Header=BB8_4 Depth=1
	mov.b	&__PBIN_H, r12
	bit.w	#64, r12
	jeq	.LBB8_11
	jmp	.LBB8_10
.LBB8_10:                               ;   in Loop: Header=BB8_4 Depth=1
	call	#clearExperimentalData
.LBB8_11:                               ;   in Loop: Header=BB8_4 Depth=1
	call	#getNextSample
	mov.b	&__PAOUT_L, r12
	xor.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &__PAOUT_L
	call	#featurize
	;DEBUG_VALUE: class <- [FPW+-16]
	call	#classify
	mov.w	r15, -16(r4)
; BB#12:                                ;   in Loop: Header=BB8_4 Depth=1
	mov.w	&0xD004, r12
	mov.w	r12, -2(r4)
	mov.w	&0xD000, r12
	mov.w	r12, -6(r4)
	mov.w	&0xD002, r12
	mov.w	r12, -4(r4)
	mov.w	#2, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	-4(r4), r12
	mov.w	r12, &0xD002
	mov.w	-6(r4), r12
	mov.w	r12, &0xD000
	mov.w	-2(r4), r12
	mov.w	r12, &0xD004
	mov.w	&0xD004, r12
	add.w	#1, r12
	mov.w	r12, &0xD004
	;DEBUG_VALUE: q <- [FPW+-18]
	mov.w	#0, -18(r4)
.LBB8_13:                               ;   Parent Loop BB8_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-18(r4), r12
	cmp.w	#255, r12
	jge	.LBB8_16
	jmp	.LBB8_14
.LBB8_14:                               ;   in Loop: Header=BB8_13 Depth=2
; BB#15:                                ;   in Loop: Header=BB8_13 Depth=2
	mov.w	-18(r4), r12
	add.w	#1, r12
	mov.w	r12, -18(r4)
	jmp	.LBB8_13
.LBB8_16:                               ;   in Loop: Header=BB8_4 Depth=1
	mov.w	-16(r4), r12
	cmp.w	#0, r12
	jeq	.LBB8_18
	jmp	.LBB8_17
.LBB8_17:                               ;   in Loop: Header=BB8_4 Depth=1
	mov.w	&0xD000, r12
	add.w	#1, r12
	mov.w	r12, &0xD000
	jmp	.LBB8_19
.LBB8_18:                               ;   in Loop: Header=BB8_4 Depth=1
	mov.w	&0xD002, r12
	add.w	#1, r12
	mov.w	r12, &0xD002
.LBB8_19:                               ;   in Loop: Header=BB8_4 Depth=1
	jmp	.LBB8_4
.Ltmp8:
	.size	main, .Ltmp8-main

	.type	currSamp,@object        ; @currSamp
	.local	currSamp
	.comm	currSamp,2,2
	.type	aWin,@object            ; @aWin
	.local	aWin
	.comm	aWin,24,2
	.type	mean,@object            ; @mean
	.local	mean
	.comm	mean,6,2
	.type	stddev,@object          ; @stddev
	.local	stddev
	.comm	stddev,6,2
	.type	meanmag,@object         ; @meanmag
	.local	meanmag
	.comm	meanmag,2,2
	.type	stddevmag,@object       ; @stddevmag
	.local	stddevmag
	.comm	stddevmag,2,2
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
