	.text
	.file	"src_fram/hello+timer+gsize+mementos+o.bc"
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
	MOV #0x2400, j
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
	MOV 0(R10), 0x1C00(R9)
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

	.globl	__mementos_setup_timer
	.align	2
	.type	__mementos_setup_timer,@function
__mementos_setup_timer:                 ; @__mementos_setup_timer
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#16, &__TA1CCTL0
	mov.w	#20000, &__TA1CCR0
	mov.w	#528, &__TA1CTL
	;APP
	BIS #8, R2
	;NO_APP
	mov.b	#0, &ok_to_checkpoint
	pop.w	r4
	ret
.Ltmp2:
	.size	__mementos_setup_timer, .Ltmp2-__mementos_setup_timer

	.globl	Timer_A
	.align	2
	.type	Timer_A,@function
Timer_A:                                ; @Timer_A
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	mov.w	#20000, &__TA1CCR0
	mov.b	#1, &ok_to_checkpoint
	pop.w	r4
	reti
.Ltmp3:
	.size	Timer_A, .Ltmp3-Timer_A

	.globl	__mementos_checkpoint
	.align	2
	.type	__mementos_checkpoint,@function
__mementos_checkpoint:                  ; @__mementos_checkpoint
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	;APP
	PUSH 4(R1)
	;NO_APP
	;APP
	NOP
	;NO_APP
	;APP
	PUSH R1
	;NO_APP
	;APP
	ADD #6, 0(R1)
	;NO_APP
	;APP
	PUSH R2
	;NO_APP
	;APP
	PUSH 8(R1)
	;NO_APP
	;APP
	PUSH R5
	;NO_APP
	;APP
	PUSH R6
	;NO_APP
	;APP
	PUSH R7
	;NO_APP
	;APP
	PUSH R8
	;NO_APP
	;APP
	PUSH R9
	;NO_APP
	;APP
	PUSH R10
	;NO_APP
	;APP
	PUSH R11
	;NO_APP
	;APP
	PUSH R12
	;NO_APP
	;APP
	PUSH R13
	;NO_APP
	;APP
	PUSH R14
	;NO_APP
	;APP
	PUSH R15
	;NO_APP
	;APP
	MOV 26(R1), j
	;NO_APP
	call	#__mementos_locate_next_bundle
	mov.w	r15, &baseaddr
	;APP
	PUSH R12
	;NO_APP
	;APP
	PUSH R13
	;NO_APP
	;APP
	MOV #0x2400, R13
	;NO_APP
	;APP
	SUB j, R13
	;NO_APP
	;APP
	MOV baseaddr, R12
	;NO_APP
	;APP
	MOV R13, 2(R12)
	;NO_APP
	;APP
	MOV GlobalAllocSize, R13
	;NO_APP
	;APP
	INC R13
	;NO_APP
	;APP
	AND #0xFE, R13
	;NO_APP
	;APP
	MOV R13, 0(R12)
	;NO_APP
	;APP
	POP R13
	;NO_APP
	;APP
	POP R12
	;NO_APP
	;APP
	MOV baseaddr, R14
	;NO_APP
	;APP
	POP 32(R14)
	;NO_APP
	;APP
	POP 30(R14)
	;NO_APP
	;APP
	POP 28(R14)
	;NO_APP
	;APP
	POP 26(R14)
	;NO_APP
	;APP
	POP 24(R14)
	;NO_APP
	;APP
	POP 22(R14)
	;NO_APP
	;APP
	POP 20(R14)
	;NO_APP
	;APP
	POP 18(R14)
	;NO_APP
	;APP
	POP 16(R14)
	;NO_APP
	;APP
	POP 14(R14)
	;NO_APP
	;APP
	POP 12(R14)
	;NO_APP
	;APP
	POP 10(R14)
	;NO_APP
	;APP
	POP 8(R14)
	;NO_APP
	;APP
	POP 6(R14)
	;NO_APP
	;APP
	POP 4(R14)
	;NO_APP
	mov.w	#34, r12
	add.w	&baseaddr, r12
	mov.w	r12, &k
	mov.w	&j, &i
	jmp	.LBB4_2
.LBB4_1:                                ; %for.body
                                        ;   in Loop: Header=BB4_2 Depth=1
	mov.w	&i, r12
	mov.w	r12, r13
	sub.w	&j, r13
	add.w	&k, r13
	mov.w	0(r12), 0(r13)
	add.w	#2, &i
.LBB4_2:                                ; %for.cond
                                        ; =>This Inner Loop Header: Depth=1
	cmp.w	#9216, &i
	jlo	.LBB4_1
; BB#3:                                 ; %for.end
	mov.w	&i, r12
	sub.w	&j, r12
	add.w	r12, &k
	mov.w	#7168, &i
	mov.w	#1, r12
	add.w	&GlobalAllocSize, r12
	and.w	#-2, r12
	add.w	#7168, r12
	jmp	.LBB4_5
.LBB4_4:                                ; %for.body11
                                        ;   in Loop: Header=BB4_5 Depth=1
	mov.w	&i, r13
	mov.w	r13, r14
	add.w	&k, r14
	mov.w	0(r13), -7168(r14)
	add.w	#2, &i
.LBB4_5:                                ; %for.cond7
                                        ; =>This Inner Loop Header: Depth=1
	cmp.w	r12, &i
	jlo	.LBB4_4
; BB#6:                                 ; %for.end16
	mov.w	&i, r12
	add.w	&k, r12
	mov.w	r12, r13
	add.w	#-7168, r13
	mov.w	r13, &k
	mov.w	#-16723, -7168(r12)
	mov.w	&baseaddr, &-4228
	pop.w	r4
	ret
.Ltmp4:
	.size	__mementos_checkpoint, .Ltmp4-__mementos_checkpoint

	.globl	__mementos_locate_next_bundle
	.align	2
	.type	__mementos_locate_next_bundle,@function
__mementos_locate_next_bundle:          ; @__mementos_locate_next_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	call	#__mementos_find_active_bundle
	mov.w	r15, -2(r4)
	cmp.w	#-2178, r15
	jne	.LBB5_2
; BB#1:                                 ; %sw.bb1
	mov.w	#-4226, -4(r4)
	jmp	.LBB5_4
.LBB5_2:                                ; %entry
	cmp.w	#-4226, r15
	jne	.LBB5_4
; BB#3:                                 ; %sw.bb
	mov.w	#-2178, -4(r4)
	jmp	.LBB5_5
.LBB5_4:                                ; %sw.default
	mov.w	#-4226, -4(r4)
.LBB5_5:                                ; %sw.epilog
	mov.w	-4(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Ltmp5:
	.size	__mementos_locate_next_bundle, .Ltmp5-__mementos_locate_next_bundle

	.globl	__mementos_find_active_bundle
	.align	2
	.type	__mementos_find_active_bundle,@function
__mementos_find_active_bundle:          ; @__mementos_find_active_bundle
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#4, r1
	mov.w	&-4228, r15
	mov.w	r15, -4(r4)
	call	#__mementos_bundle_in_range
	cmp.w	#0, r15
	jeq	.LBB6_2
; BB#1:                                 ; %if.then
	mov.w	-4(r4), -2(r4)
	jmp	.LBB6_3
.LBB6_2:                                ; %if.end
	mov.w	#-1, -2(r4)
.LBB6_3:                                ; %return
	mov.w	-2(r4), r15
	add.w	#4, r1
	pop.w	r4
	ret
.Ltmp6:
	.size	__mementos_find_active_bundle, .Ltmp6-__mementos_find_active_bundle

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
	cmp.w	#-4226, r12
	jlo	.LBB7_2
; BB#1:                                 ; %land.rhs
	cmp.w	#-129, -2(r4)
	mov.w	#1, r15
	bic.w	r2, r15
.LBB7_2:                                ; %land.end
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp7:
	.size	__mementos_bundle_in_range, .Ltmp7-__mementos_bundle_in_range

	.globl	__mementos_atboot_cleanup
	.align	2
	.type	__mementos_atboot_cleanup,@function
__mementos_atboot_cleanup:              ; @__mementos_atboot_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Ltmp8:
	.size	__mementos_atboot_cleanup, .Ltmp8-__mementos_atboot_cleanup

	.globl	__mementos_inactive_cleanup
	.align	2
	.type	__mementos_inactive_cleanup,@function
__mementos_inactive_cleanup:            ; @__mementos_inactive_cleanup
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	r15, -2(r4)
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp9:
	.size	__mementos_inactive_cleanup, .Ltmp9-__mementos_inactive_cleanup

	.globl	__mementos_force_free
	.align	2
	.type	__mementos_force_free,@function
__mementos_force_free:                  ; @__mementos_force_free
; BB#0:                                 ; %entry
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	-2(r4), r15
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp10:
	.size	__mementos_force_free, .Ltmp10-__mementos_force_free

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
	.type	ok_to_checkpoint,@object ; @ok_to_checkpoint
	.comm	ok_to_checkpoint,1,1

	.globl	__isr_6
__isr_6 = Timer_A
	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
