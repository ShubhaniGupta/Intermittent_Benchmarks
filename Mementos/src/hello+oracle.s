	.text
	.file	"src/hello+oracle+gsize+mementos.bc"
	.globl	_old_main
	.align	2
	.type	_old_main,@function
_old_main:                              ; @_old_main
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	#0, -2(r4)
	mov.w	#0, r15
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp0:
	.size	_old_main, .Ltmp0-_old_main

	.globl	__mementos_restore
	.align	2
	.type	__mementos_restore,@function
__mementos_restore:                     ; @__mementos_restore
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, &baseaddr
	mov.w	r15, -2(r4)
	mov.w	2(r15), r12
	mov.w	r12, &tmpsize
	mov.w	#0, &i
	jmp	.LBB1_2
.LBB1_1:                                ; %for.body
                                        ;   in Loop: Header=BB1_2 Depth=1
	;APP
	MOV #0x3100, j
	;NO_APP
	;APP
	SUB i, j
	;NO_APP
	;APP
	DECD.W j
	;NO_APP
	;APP
	MOV baseaddr, k
	;NO_APP
	;APP
	ADD #30, k
	;NO_APP
	;APP
	ADD #2, k
	;NO_APP
	;APP
	ADD tmpsize, k
	;NO_APP
	;APP
	SUB i, k
	;NO_APP
	;APP
	MOV k, R7
	;NO_APP
	;APP
	MOV j, R8
	;NO_APP
	;APP
	MOV @R7, 0(R8)
	;NO_APP
	add.w	#2, &i
.LBB1_2:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	&i, r12
	cmp.w	&tmpsize, r12
	jlo	.LBB1_1
; BB#3:                                 ; %for.end
	;APP
	MOV tmpsize, R7
	;NO_APP
	;APP
	MOV baseaddr, R6
	;NO_APP
	;APP
	MOV @R6, R8
	;NO_APP
	;APP
	AND #255, R8
	;NO_APP
	;APP
	CLR.W R9
	;NO_APP
	;APP
	rdloop:
	;NO_APP
	;APP
	CMP R8, R9
	;NO_APP
	;APP
	JC afterrd
	;NO_APP
	;APP
	MOV R6, R10
	;NO_APP
	;APP
	ADD #34, R10
	;NO_APP
	;APP
	ADD R7, R10
	;NO_APP
	;APP
	ADD R9, R10
	;NO_APP
	;APP
	MOV 0(R10), 0x1100(R9)
	;NO_APP
	;APP
	INCD R9
	;NO_APP
	;APP
	JMP rdloop
	;NO_APP
	;APP
	afterrd:
	;NO_APP
	;APP
	MOV R6, baseaddr
	;NO_APP
	;APP
	MOV 4(R6), j
	;NO_APP
	;APP
	MOV 6(R6), R1
	;NO_APP
	;APP
	MOV 32(R6), R15
	;NO_APP
	;APP
	MOV 30(R6), R14
	;NO_APP
	;APP
	MOV 28(R6), R13
	;NO_APP
	;APP
	MOV 26(R6), R12
	;NO_APP
	;APP
	MOV 24(R6), R11
	;NO_APP
	;APP
	MOV 22(R6), R10
	;NO_APP
	;APP
	MOV 20(R6), R9
	;NO_APP
	;APP
	MOV 18(R6), R8
	;NO_APP
	;APP
	MOV 16(R6), R7
	;NO_APP
	;APP
	MOV 12(R6), R5
	;NO_APP
	;APP
	MOV 10(R6), R4
	;NO_APP
	;APP
	MOV 8(R6), R2
	;NO_APP
	;APP
	MOV 6(R6), R1
	;NO_APP
	;APP
	PUSH 4(R6)
	;NO_APP
	;APP
	MOV 14(R6), R6
	;NO_APP
	;APP
	POP R0
	;NO_APP
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp1:
	.size	__mementos_restore, .Ltmp1-__mementos_restore

	.globl	__mementos_checkpoint
	.align	2
	.type	__mementos_checkpoint,@function
__mementos_checkpoint:                  ; @__mementos_checkpoint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;APP
	PUSH 2(R1)
	PUSH R1
	ADD #6, 0(R1)
	PUSH R2
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	PUSH R9
	PUSH R10
	PUSH R11
	PUSH R12
	PUSH R13
	PUSH R14
	PUSH R15
	;NO_APP
	;APP
	MOV 26(R1), &j
	;NO_APP
	mov.w	&j, r15
	call	#__mementos_locate_next_bundle
	mov.w	r15, &baseaddr
	cmp.w	#-1, r15
	jne	.LBB2_6
; BB#1:                                 ; %if.then
	mov.w	#-1280, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB2_3
; BB#2:                                 ; %if.then2
	mov.w	#-1280, r15
	call	#__mementos_erase_segment
	mov.w	#-1280, &baseaddr
	jmp	.LBB2_6
.LBB2_3:                                ; %if.else
	mov.w	#-768, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB2_5
; BB#4:                                 ; %if.then5
	mov.w	#-768, r15
	call	#__mementos_erase_segment
	mov.w	#-768, &baseaddr
	jmp	.LBB2_6
.LBB2_5:                                ; %if.else6
	mov.w	#-1280, r15
	call	#__mementos_mark_segment_erase
	mov.w	#-768, r15
	call	#__mementos_mark_segment_erase
	;APP
	ADD #30, R1
	RET
	;NO_APP
.LBB2_6:                                ; %if.end8
	;APP
	DINT
	;NO_APP
	mov.w	#-23296, &__FCTL3
	mov.w	#-23232, &__FCTL1
	;APP
	PUSH R12
	;NO_APP
	;APP
	PUSH R13
	;NO_APP
	;APP
	MOV #0x3100, R13
	;NO_APP
	;APP
	SUB &j, R13
	;NO_APP
	;APP
	MOV &baseaddr, R12
	;NO_APP
	;APP
	MOV.B R13, 1(R12)
	;NO_APP
	;APP
	MOV &GlobalAllocSize, R13
	;NO_APP
	;APP
	INC R13
	;NO_APP
	;APP
	AND #0xFE, R13
	;NO_APP
	;APP
	MOV.B R13, 0(R12)
	;NO_APP
	;APP
	POP R13
	;NO_APP
	;APP
	POP R12
	;NO_APP
	;APP
	MOV &baseaddr, R14
	;NO_APP
	;APP
	POP 30(R14)
	POP 28(R14)
	POP 26(R14)
	POP 24(R14)
	POP 22(R14)
	POP 20(R14)
	POP 18(R14)
	POP 16(R14)
	POP 14(R14)
	POP 12(R14)
	POP 10(R14)
	POP 8(R14)
	POP 6(R14)
	POP 4(R14)
	POP 2(R14)
	;NO_APP
	mov.w	&j, r12
	mov.w	r12, &i
	mov.w	#12544, r13
	sub.w	r12, r13
	mov.w	r13, &j
	jmp	.LBB2_8
.LBB2_7:                                ; %while.body
                                        ;   in Loop: Header=BB2_8 Depth=1
	mov.w	&i, r12
	mov.w	#12544, r13
	sub.w	r12, r13
	mov.w	&baseaddr, r14
	add.w	&j, r14
	add.w	#32, r14
	sub.w	r13, r14
	mov.w	0(r12), 0(r14)
	add.w	#2, &i
.LBB2_8:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	#12544, r12
	sub.w	&i, r12
	cmp.w	#1, r12
	jge	.LBB2_7
; BB#9:                                 ; %while.end
	mov.w	#4352, &i
	add.w	#32, &j
	mov.w	#1, r12
	add.w	&GlobalAllocSize, r12
	and.w	#-2, r12
	add.w	#4352, r12
	jmp	.LBB2_11
.LBB2_10:                               ; %for.inc
                                        ;   in Loop: Header=BB2_11 Depth=1
	mov.w	&baseaddr, r13
	add.w	&j, r13
	mov.w	&i, r14
	mov.w	0(r14), 0(r13)
	add.w	#2, &i
	add.w	#2, &j
.LBB2_11:                               ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	cmp.w	r12, &i
	jlo	.LBB2_10
; BB#12:                                ; %for.end
	mov.w	&baseaddr, r12
	add.w	&j, r12
	mov.w	#-16723, 0(r12)
	cmp.w	#-1280, &baseaddr
	jeq	.LBB2_14
; BB#13:                                ; %lor.lhs.false
	cmp.w	#-768, &baseaddr
	jne	.LBB2_18
.LBB2_14:                               ; %if.then26
	mov.w	#-768, r15
	cmp.w	#-768, &baseaddr
	jlo	.LBB2_16
; BB#15:                                ; %if.then26
	mov.w	#-1280, r15
.LBB2_16:                               ; %if.then26
	mov.w	r15, &j
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB2_18
; BB#17:                                ; %if.then30
	mov.w	&j, r15
	call	#__mementos_mark_segment_erase
.LBB2_18:                               ; %if.end32
	mov.w	#-23296, &__FCTL1
	mov.w	#-23280, &__FCTL3
	;APP
	EINT
	;NO_APP
	pop.w	r4
	ret
.Ltmp2:
	.size	__mementos_checkpoint, .Ltmp2-__mementos_checkpoint

	.globl	__mementos_locate_next_bundle
	.align	2
	.type	__mementos_locate_next_bundle,@function
__mementos_locate_next_bundle:          ; @__mementos_locate_next_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	mov.w	r15, -4(r4)
	mov.w	#12544, r12
	sub.w	r15, r12
	mov.w	#1, r13
	add.w	&GlobalAllocSize, r13
	and.w	#-2, r13
	add.w	r12, r13
	add.w	#34, r13
	mov.w	r13, -6(r4)
	call	#__mementos_find_active_bundle
	mov.w	r15, &baseaddr
	cmp.w	#-1, r15
	jeq	.LBB3_14
; BB#1:                                 ; %if.end10
	mov.w	&baseaddr, r12
	mov.w	0(r12), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	mov.b	r13, r13
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	add.w	r13, r14
	add.w	#34, r14
	mov.w	r14, -10(r4)
	add.w	r12, r14
	mov.w	r14, -12(r4)
.LBB3_2:                                ; %while.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-12(r4), r12
	cmp.w	#-1, 0(r12)
	jeq	.LBB3_10
; BB#3:                                 ; %while.body
                                        ;   in Loop: Header=BB3_2 Depth=1
	mov.w	-12(r4), r12
	mov.w	0(r12), r12
	mov.w	r12, r13
	clrc
	rrc.w	r13
	mov.b	r12, r12
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	rra.w	r13
	add.w	r12, r13
	add.w	#34, r13
	mov.w	r13, -10(r4)
	add.w	-12(r4), r13
	mov.w	r13, -12(r4)
	cmp.w	#-255, r13
	jlo	.LBB3_2
; BB#4:                                 ; %if.then24
                                        ;   in Loop: Header=BB3_2 Depth=1
	mov.w	#-1280, r15
	cmp.w	#-768, &baseaddr
	jhs	.LBB3_6
; BB#5:                                 ; %if.then24
                                        ;   in Loop: Header=BB3_2 Depth=1
	mov.w	#-768, r15
.LBB3_6:                                ; %if.then24
                                        ;   in Loop: Header=BB3_2 Depth=1
	mov.w	r15, -12(r4)
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB3_2
; BB#7:                                 ; %if.then28
	mov.w	-12(r4), r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jne	.LBB3_9
; BB#8:                                 ; %if.then31
	mov.w	-12(r4), r15
	call	#__mementos_mark_segment_erase
.LBB3_9:                                ; %if.end32
	mov.w	#-1, -2(r4)
	jmp	.LBB3_26
.LBB3_10:                               ; %while.end
	cmp.w	#-768, -12(r4)
	jhs	.LBB3_16
; BB#11:                                ; %if.then36
	mov.w	-12(r4), r12
	add.w	-6(r4), r12
	cmp.w	#-767, r12
	jlo	.LBB3_19
; BB#12:                                ; %if.then39
	mov.w	#-768, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jeq	.LBB3_23
; BB#13:                                ; %if.then42
	mov.w	#-768, -12(r4)
	jmp	.LBB3_19
.LBB3_14:                               ; %if.then
	mov.w	#-1280, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jeq	.LBB3_20
; BB#15:                                ; %if.then5
	mov.w	#-1280, -2(r4)
	jmp	.LBB3_26
.LBB3_16:                               ; %if.else46
	mov.w	-12(r4), r12
	add.w	-6(r4), r12
	cmp.w	#-255, r12
	jlo	.LBB3_19
; BB#17:                                ; %if.then49
	mov.w	#-1280, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jeq	.LBB3_24
; BB#18:                                ; %if.then52
	mov.w	#-1280, -12(r4)
.LBB3_19:                               ; %if.end56
	mov.w	-12(r4), -2(r4)
	jmp	.LBB3_26
.LBB3_20:                               ; %if.else
	mov.w	#-768, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jeq	.LBB3_22
; BB#21:                                ; %if.then8
	mov.w	#-768, -2(r4)
	jmp	.LBB3_26
.LBB3_22:                               ; %if.end9
	mov.w	#-1, -2(r4)
	jmp	.LBB3_26
.LBB3_23:                               ; %if.else43
	mov.w	#-768, r15
	jmp	.LBB3_25
.LBB3_24:                               ; %if.else53
	mov.w	#-1280, r15
.LBB3_25:                               ; %return
	call	#__mementos_mark_segment_erase
	mov.w	#-1, -2(r4)
.LBB3_26:                               ; %return
	mov.w	-2(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.Ltmp3:
	.size	__mementos_locate_next_bundle, .Ltmp3-__mementos_locate_next_bundle

	.globl	__mementos_segment_marked_erase
	.align	2
	.type	__mementos_segment_marked_erase,@function
__mementos_segment_marked_erase:        ; @__mementos_segment_marked_erase
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, r12
	mov.b	#0, r15
	mov.w	r12, -2(r4)
	cmp.w	#0, 2(r12)
	jne	.LBB4_2
; BB#1:                                 ; %land.rhs
	mov.w	-2(r4), r12
	cmp.w	#0, 510(r12)
	mov.w	r2, r15
	rra.w	r15
	and.w	#1, r15
.LBB4_2:                                ; %land.end
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp4:
	.size	__mementos_segment_marked_erase, .Ltmp4-__mementos_segment_marked_erase

	.globl	__mementos_erase_segment
	.align	2
	.type	__mementos_erase_segment,@function
__mementos_erase_segment:               ; @__mementos_erase_segment
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, -2(r4)
	;APP
	DINT
	;NO_APP
	mov.w	#-23296, &__FCTL3
	mov.w	#-23294, &__FCTL1
	mov.w	-2(r4), r12
	mov.w	#0, 0(r12)
	mov.w	#-23296, &__FCTL1
	mov.w	#-23280, &__FCTL3
	;APP
	EINT
	;NO_APP
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp5:
	.size	__mementos_erase_segment, .Ltmp5-__mementos_erase_segment

	.globl	__mementos_mark_segment_erase
	.align	2
	.type	__mementos_mark_segment_erase,@function
__mementos_mark_segment_erase:          ; @__mementos_mark_segment_erase
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, -2(r4)
	mov.w	#-23296, &__FCTL3
	mov.w	#-23232, &__FCTL1
	mov.w	#0, 2(r15)
	mov.w	-2(r4), r12
	mov.w	#0, 510(r12)
	mov.w	#-23296, &__FCTL1
	mov.w	#-23280, &__FCTL3
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp6:
	.size	__mementos_mark_segment_erase, .Ltmp6-__mementos_mark_segment_erase

	.globl	__mementos_segment_is_empty
	.align	2
	.type	__mementos_segment_is_empty,@function
__mementos_segment_is_empty:            ; @__mementos_segment_is_empty
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#6, r1
	mov.w	r15, -4(r4)
	mov.w	r15, -6(r4)
	jmp	.LBB7_2
.LBB7_1:                                ; %for.inc
                                        ;   in Loop: Header=BB7_2 Depth=1
	add.w	#32, -6(r4)
.LBB7_2:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	#512, r12
	add.w	-4(r4), r12
	cmp.w	r12, -6(r4)
	jhs	.LBB7_5
; BB#3:                                 ; %for.body
                                        ;   in Loop: Header=BB7_2 Depth=1
	mov.w	-6(r4), r12
	cmp.w	#-1, 0(r12)
	jeq	.LBB7_1
; BB#4:                                 ; %if.then
	mov.w	#0, -2(r4)
	jmp	.LBB7_6
.LBB7_5:                                ; %for.end
	mov.w	#1, -2(r4)
.LBB7_6:                                ; %return
	mov.w	-2(r4), r15
	add.w	#6, r1
	pop.w	r4
	ret
.Ltmp7:
	.size	__mementos_segment_is_empty, .Ltmp7-__mementos_segment_is_empty

	.globl	__mementos_find_active_bundle
	.align	2
	.type	__mementos_find_active_bundle,@function
__mementos_find_active_bundle:          ; @__mementos_find_active_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#12, r1
	mov.w	#-1280, -2(r4)
	mov.w	#-1, -12(r4)
	mov.w	#-1280, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB8_2
; BB#1:                                 ; %lor.lhs.false
	mov.w	#-1280, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB8_12
.LBB8_2:                                ; %if.then
	mov.w	#-768, -4(r4)
	mov.w	#-1280, -6(r4)
.LBB8_3:                                ; %searchbundle
	mov.w	-4(r4), -2(r4)
.LBB8_4:                                ; %do.body
                                        ; =>This Inner Loop Header: Depth=1
	mov.w	-2(r4), r12
	cmp.w	#-1, 0(r12)
	jeq	.LBB8_8
; BB#5:                                 ; %if.end
                                        ;   in Loop: Header=BB8_4 Depth=1
	mov.w	-2(r4), r12
	mov.w	0(r12), r13
	mov.w	r13, r14
	clrc
	rrc.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	rra.w	r14
	add.w	r12, r14
	mov.b	r13, r13
	add.w	r14, r13
	mov.w	r13, r12
	add.w	#32, r12
	mov.w	r12, -10(r4)
	mov.w	32(r13), r12
	mov.w	r12, -8(r4)
	cmp.w	#-16723, r12
	jne	.LBB8_7
; BB#6:                                 ; %do.cond
                                        ;   in Loop: Header=BB8_4 Depth=1
	mov.w	-2(r4), -12(r4)
	mov.w	#2, r12
	add.w	-10(r4), r12
	mov.w	r12, -2(r4)
	mov.w	#512, r13
	add.w	-4(r4), r13
	cmp.w	r13, r12
	jlo	.LBB8_4
	jmp	.LBB8_8
.LBB8_7:                                ; %if.else
	mov.w	-4(r4), r15
	call	#__mementos_mark_segment_erase
.LBB8_8:                                ; %do.end
	cmp.w	#-1, -12(r4)
	jeq	.LBB8_11
; BB#9:                                 ; %if.then14
	mov.w	#-1280, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB8_11
; BB#10:                                ; %if.then17
	mov.w	#-1280, r15
	call	#__mementos_mark_segment_erase
.LBB8_11:                               ; %if.end19
	mov.w	-12(r4), r15
	add.w	#12, r1
	pop.w	r4
	ret
.LBB8_12:                               ; %if.end20
	mov.w	#-1280, -4(r4)
	mov.w	#-768, -6(r4)
	jmp	.LBB8_3
.Ltmp8:
	.size	__mementos_find_active_bundle, .Ltmp8-__mementos_find_active_bundle

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#-1280, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB9_2
; BB#1:                                 ; %if.then
	mov.w	#-1280, r15
	call	#__mementos_erase_segment
.LBB9_2:                                ; %if.end
	mov.w	#-768, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB9_4
; BB#3:                                 ; %if.then3
	mov.w	#-768, r15
	call	#__mementos_erase_segment
.LBB9_4:                                ; %if.end4
	pop.w	r4
	ret
.Ltmp9:
	.size	__mementos_atboot_cleanup, .Ltmp9-__mementos_atboot_cleanup

	.globl	__mementos_bundle_in_range
	.align	2
	.type	__mementos_bundle_in_range,@function
__mementos_bundle_in_range:             ; @__mementos_bundle_in_range
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, r12
	mov.b	#0, r15
	mov.w	r12, -2(r4)
	cmp.w	#-1280, r12
	jlo	.LBB10_2
; BB#1:                                 ; %land.rhs
	cmp.w	#-256, -2(r4)
	mov.w	#1, r15
	bic.w	r2, r15
.LBB10_2:                               ; %land.end
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp10:
	.size	__mementos_bundle_in_range, .Ltmp10-__mementos_bundle_in_range

	.globl	__mementos_inactive_cleanup
	.align	2
	.type	__mementos_inactive_cleanup,@function
__mementos_inactive_cleanup:            ; @__mementos_inactive_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, -2(r4)
	cmp.w	#-768, r15
	jhs	.LBB11_3
; BB#1:                                 ; %if.then
	mov.w	#-768, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB11_6
; BB#2:                                 ; %if.then1
	mov.w	#-768, r15
	jmp	.LBB11_5
.LBB11_3:                               ; %if.else
	mov.w	#-1280, r15
	call	#__mementos_segment_is_empty
	cmp.w	#0, r15
	jne	.LBB11_6
; BB#4:                                 ; %if.then4
	mov.w	#-1280, r15
.LBB11_5:                               ; %if.end6
	call	#__mementos_erase_segment
.LBB11_6:                               ; %if.end6
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp11:
	.size	__mementos_inactive_cleanup, .Ltmp11-__mementos_inactive_cleanup

	.globl	__mementos_force_free
	.align	2
	.type	__mementos_force_free,@function
__mementos_force_free:                  ; @__mementos_force_free
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	#-1280, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jne	.LBB12_4
; BB#1:                                 ; %if.else
	mov.w	#-768, r15
	call	#__mementos_segment_marked_erase
	cmp.w	#0, r15
	jeq	.LBB12_3
; BB#2:                                 ; %if.then3
	mov.w	#-768, r15
	call	#__mementos_erase_segment
	mov.w	#-768, -2(r4)
	jmp	.LBB12_5
.LBB12_3:                               ; %if.else4
	mov.w	#-1280, r15
	call	#__mementos_mark_segment_erase
	mov.w	#-768, r15
	call	#__mementos_mark_segment_erase
.LBB12_4:                               ; %return
	mov.w	#-1280, r15
	call	#__mementos_erase_segment
	mov.w	#-1280, -2(r4)
.LBB12_5:                               ; %return
	mov.w	-2(r4), r15
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp12:
	.size	__mementos_force_free, .Ltmp12-__mementos_force_free

	.type	GlobalAllocSize,@object ; @GlobalAllocSize
	.section	.rodata,"a",@progbits
	.globl	GlobalAllocSize
	.align	1
GlobalAllocSize:
	.short	0                       ; 0x0
	.size	GlobalAllocSize, 2

	.type	baseaddr,@object        ; @baseaddr
	.comm	baseaddr,2,2
	.type	tmpsize,@object         ; @tmpsize
	.comm	tmpsize,2,2
	.type	i,@object               ; @i
	.comm	i,2,2
	.type	j,@object               ; @j
	.comm	j,2,2
	.type	k,@object               ; @k
	.comm	k,2,2

	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
