	.file	"midi.bc"
	.text
	.globl	__dino_recover
	.align	2
	.type	__dino_recover,@function
__dino_recover:                         ; @__dino_recover
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	;DEBUG_VALUE: __dino_recover:recovery <- undef
	mov.w	4(r4), r12
	mov.w	r12, -2(r4)
	mov.w	r12, r13
	cmp.w	#4, r12
	mov.w	r12, -12(r4)            ; 2-byte Folded Spill
	mov.w	r13, -14(r4)            ; 2-byte Folded Spill
	jhs	.LBB0_6
; BB#1:
	mov.w	#2, r14
	mov.w	-12(r4), r15            ; 2-byte Folded Reload
	call	#__mulhi3
	mov.w	.LJTI0_0(r15), r14
	br	r14
.LBB0_2:
	;DEBUG_VALUE: a <- [FPW+-4]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -4(r4)
	jmp	.LBB0_7
.LBB0_3:
	;DEBUG_VALUE: a <- [FPW+-6]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -6(r4)
	jmp	.LBB0_7
.LBB0_4:
	;DEBUG_VALUE: a <- [FPW+-8]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -8(r4)
	jmp	.LBB0_7
.LBB0_5:
	;DEBUG_VALUE: a <- [FPW+-10]
	mov.w	r4, r12
	add.w	#6, r12
	mov.w	r12, -10(r4)
	jmp	.LBB0_7
.LBB0_6:
.LBB0_7:
	add.w	#14, r1
	pop.w	r4
	ret
.Ltmp0:
	.size	__dino_recover, .Ltmp0-__dino_recover
	.section	.rodata,"a",@progbits
	.align	1
.LJTI0_0:
	.short	.LBB0_2
	.short	.LBB0_3
	.short	.LBB0_4
	.short	.LBB0_5

	.text
	.globl	abortWithError
	.align	2
	.type	abortWithError,@function
abortWithError:                         ; @abortWithError
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	#-16658, &inErrorState
.LBB1_1:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_2 Depth 2
	mov.b	&__PAOUT_L, r12
	xor.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &__PAOUT_L
	;DEBUG_VALUE: i <- [FPW+-2]
	mov.w	#0, -2(r4)
.LBB1_2:                                ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	mov.w	-2(r4), r12
	cmp.w	#4095, r12
	jge	.LBB1_5
	jmp	.LBB1_3
.LBB1_3:                                ;   in Loop: Header=BB1_2 Depth=2
; BB#4:                                 ;   in Loop: Header=BB1_2 Depth=2
	mov.w	-2(r4), r12
	add.w	#1, r12
	mov.w	r12, -2(r4)
	jmp	.LBB1_2
.LBB1_5:                                ;   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.Ltmp1:
	.size	abortWithError, .Ltmp1-abortWithError

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
	mov.b	&__PBDIR_H, r12
	bis.w	#16, r12
	mov.b	r12, r13
	mov.b	r13, &__PBDIR_H
	mov.b	&__PAOUT_L, r12
	and.w	#254, r12
	mov.b	r12, r13
	mov.b	r13, &__PAOUT_L
	mov.b	&__PBOUT_H, r12
	and.w	#239, r12
	mov.b	r12, r13
	mov.b	r13, &__PBOUT_H
	pop.w	r4
	ret
.Ltmp2:
	.size	initializeHardware, .Ltmp2-initializeHardware

	.globl	initializeNVData
	.align	2
	.type	initializeNVData,@function
initializeNVData:                       ; @initializeNVData
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.w	&initialized, r12
	cmp.w	#-16658, r12
	jeq	.LBB3_2
	jmp	.LBB3_1
.LBB3_1:
	mov.w	#0, &currentState
	mov.w	#0, &currentLED
	mov.w	#0, &reboots
	mov.w	#0, &msgSequenceNumber
	mov.w	#-1, &which
	mov.w	#-1, &MIDIBuf
	mov.b	#-1, &MIDIBuf+2
	mov.b	#-1, &MIDIBuf+3
	mov.b	#-1, &MIDIBuf+4
	mov.w	#-1, &MIDIBuf+6
	mov.b	#-1, &MIDIBuf+8
	mov.b	#-1, &MIDIBuf+9
	mov.b	#-1, &MIDIBuf+10
	mov.w	#-1, &MIDIBuf+12
	mov.b	#-1, &MIDIBuf+14
	mov.b	#-1, &MIDIBuf+15
	mov.b	#-1, &MIDIBuf+16
	mov.w	#-1, &MIDIBuf+18
	mov.b	#-1, &MIDIBuf+20
	mov.b	#-1, &MIDIBuf+21
	mov.b	#-1, &MIDIBuf+22
.LBB3_2:
	mov.w	#-16658, &initialized
	pop.w	r4
	ret
.Ltmp3:
	.size	initializeNVData, .Ltmp3-initializeNVData

	.globl	addMIDIMessage
	.align	2
	.type	addMIDIMessage,@function
addMIDIMessage:                         ; @addMIDIMessage
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#10, r1
	;DEBUG_VALUE: addMIDIMessage:speed <- undef
	;DEBUG_VALUE: addMIDIMessage:direction <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	&which, r14
	add.w	#1, r14
	mov.w	r14, &which
	mov.w	&msgSequenceNumber, r14
	add.w	#1, r14
	mov.w	r14, &msgSequenceNumber
	mov.w	&which, r14
	cmp.w	#4, r14
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	mov.w	r14, -10(r4)            ; 2-byte Folded Spill
	jhs	.LBB4_6
; BB#1:
	mov.w	#2, r14
	mov.w	-10(r4), r15            ; 2-byte Folded Reload
	call	#__mulhi3
	mov.w	.LJTI4_0(r15), r14
	br	r14
.LBB4_2:
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, &MIDIBuf
	mov.b	#-112, &MIDIBuf+2
	mov.b	#-128, &MIDIBuf+3
	mov.w	-2(r4), r15
	mov.w	#127, r14
	call	#__umodhi3
	mov.b	r15, r13
	mov.b	r13, &MIDIBuf+4
	jmp	.LBB4_7
.LBB4_3:
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, &MIDIBuf+6
	mov.b	#-112, &MIDIBuf+8
	mov.b	#-128, &MIDIBuf+9
	mov.w	-2(r4), r15
	mov.w	#127, r14
	call	#__umodhi3
	mov.b	r15, r13
	mov.b	r13, &MIDIBuf+10
	jmp	.LBB4_7
.LBB4_4:
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, &MIDIBuf+12
	mov.b	#-112, &MIDIBuf+14
	mov.b	#-128, &MIDIBuf+15
	mov.w	-2(r4), r15
	mov.w	#127, r14
	call	#__umodhi3
	mov.b	r15, r13
	mov.b	r13, &MIDIBuf+16
	jmp	.LBB4_7
.LBB4_5:
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, &MIDIBuf+18
	mov.b	#-112, &MIDIBuf+20
	mov.b	#-128, &MIDIBuf+21
	mov.w	-2(r4), r15
	mov.w	#127, r14
	call	#__umodhi3
	mov.b	r15, r13
	mov.b	r13, &MIDIBuf+22
	jmp	.LBB4_7
.LBB4_6:
	call	#abortWithError
.LBB4_7:
	add.w	#10, r1
	pop.w	r4
	ret
.Ltmp4:
	.size	addMIDIMessage, .Ltmp4-addMIDIMessage
	.section	.rodata,"a",@progbits
	.align	1
.LJTI4_0:
	.short	.LBB4_2
	.short	.LBB4_3
	.short	.LBB4_4
	.short	.LBB4_5

	.text
	.globl	sendAllMessages
	.align	2
	.type	sendAllMessages,@function
sendAllMessages:                        ; @sendAllMessages
; BB#0:
	push.w	r4
	mov.w	r1, r4
	mov.b	&__PBOUT_H, r12
	xor.w	#16, r12
	mov.b	r12, r13
	mov.b	r13, &__PBOUT_H
	mov.b	&MIDIBuf+4, r13
	mov.b	r13, &TXvel0
	mov.w	#-1, &MIDIBuf
	mov.b	#-1, &MIDIBuf+2
	mov.b	#-1, &MIDIBuf+3
	mov.b	#-1, &MIDIBuf+4
	mov.b	&MIDIBuf+10, r13
	mov.b	r13, &TXvel1
	mov.w	#-1, &MIDIBuf+6
	mov.b	#-1, &MIDIBuf+8
	mov.b	#-1, &MIDIBuf+9
	mov.b	#-1, &MIDIBuf+10
	mov.b	&MIDIBuf+16, r13
	mov.b	r13, &TXvel2
	mov.w	#-1, &MIDIBuf+12
	mov.b	#-1, &MIDIBuf+14
	mov.b	#-1, &MIDIBuf+15
	mov.b	#-1, &MIDIBuf+16
	mov.b	&MIDIBuf+22, r13
	mov.b	r13, &TXvel3
	mov.w	#-1, &MIDIBuf+18
	mov.b	#-1, &MIDIBuf+20
	mov.b	#-1, &MIDIBuf+21
	mov.b	#-1, &MIDIBuf+22
	pop.w	r4
	ret
.Ltmp5:
	.size	sendAllMessages, .Ltmp5-sendAllMessages

	.globl	getInput
	.align	2
	.type	getInput,@function
getInput:                               ; @getInput
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#8, r1
	;DEBUG_VALUE: getInput:s <- undef
	;DEBUG_VALUE: getInput:d <- undef
	mov.w	r14, r12
	mov.w	r15, r13
	mov.w	r15, -2(r4)
	mov.w	r14, -4(r4)
	mov.w	r12, -6(r4)             ; 2-byte Folded Spill
	mov.w	r13, -8(r4)             ; 2-byte Folded Spill
	call	#adc12_sample
	mov.w	-2(r4), r12
	mov.w	r15, 0(r12)
	add.w	#8, r1
	pop.w	r4
	ret
.Ltmp6:
	.size	getInput, .Ltmp6-getInput

	.section	.init9,"ax",@progbits
	.globl	main
	.align	1
	.type	main,@function
main:                                   ; @main
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#14, r1
	mov.w	#0, -8(r4)
	mov.w	#23168, &__WDTCTL
	mov.w	&__PM5CTL0, r12
	and.w	#-2, r12
	mov.w	r12, &__PM5CTL0
	mov.w	&reboots, r12
	add.w	#1, r12
	mov.w	r12, &reboots
	call	#initializeHardware
	mov.w	&inErrorState, r12
	cmp.w	#-16658, r12
	jne	.LBB7_2
	jmp	.LBB7_1
.LBB7_1:
	call	#abortWithError
.LBB7_2:
	;DEBUG_VALUE: main:addr <- [FPW+-10]
	call	#__mementos_find_active_bundle
	mov.w	r15, -10(r4)
	cmp.w	#-1, r15
	jeq	.LBB7_4
	jmp	.LBB7_3
.LBB7_3:
	mov.w	-10(r4), r15
	call	#__mementos_restore
.LBB7_4:
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, -6(r4)
	mov.w	&initialized, r12
	mov.w	r12, -4(r4)
	mov.w	#0, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	-4(r4), r12
	mov.w	r12, &initialized
	mov.w	-6(r4), r12
	mov.w	r12, &msgSequenceNumber
	call	#initializeNVData
.LBB7_5:                                ; =>This Inner Loop Header: Depth=1
	mov.w	&msgSequenceNumber, r12
	cmp.w	#10000, r12
	jhs	.LBB7_11
	jmp	.LBB7_6
.LBB7_6:                                ;   in Loop: Header=BB7_5 Depth=1
	;DEBUG_VALUE: speed <- [FPW+-12]
	mov.w	#0, -12(r4)
	;DEBUG_VALUE: direction <- [FPW+-14]
	mov.w	#0, -14(r4)
; BB#7:                                 ;   in Loop: Header=BB7_5 Depth=1
	mov.w	#1, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	r4, r15
	sub.w	#12, r15
	mov.w	r4, r14
	sub.w	#14, r14
	call	#getInput
; BB#8:                                 ;   in Loop: Header=BB7_5 Depth=1
	mov.w	&which, r12
	mov.w	r12, -2(r4)
	mov.w	&msgSequenceNumber, r12
	mov.w	r12, -6(r4)
	mov.w	#2, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	mov.w	-6(r4), r12
	mov.w	r12, &msgSequenceNumber
	mov.w	-2(r4), r12
	mov.w	r12, &which
	mov.w	-12(r4), r15
	mov.w	-14(r4), r14
	call	#addMIDIMessage
	mov.w	&which, r12
	cmp.w	#3, r12
	jne	.LBB7_10
	jmp	.LBB7_9
.LBB7_9:                                ;   in Loop: Header=BB7_5 Depth=1
	mov.w	#3, r15
	call	#__dino_task_boundary
	call	#__mementos_checkpoint
	call	#sendAllMessages
	mov.w	#-1, &which
.LBB7_10:                               ;   in Loop: Header=BB7_5 Depth=1
	jmp	.LBB7_5
.LBB7_11:
	mov.b	&__PAOUT_L, r12
	bis.w	#1, r12
	mov.b	r12, r13
	mov.b	r13, &__PAOUT_L
.LBB7_12:                               ; =>This Inner Loop Header: Depth=1
	jmp	.LBB7_12
.Ltmp7:
	.size	main, .Ltmp7-main

	.type	inErrorState,@object    ; @inErrorState
	.section	FRAMVARS,"aw",@progbits
	.globl	inErrorState
	.align	1
inErrorState:
	.short	0                       ; 0x0
	.size	inErrorState, 2

	.type	initialized,@object     ; @initialized
	.globl	initialized
	.align	1
initialized:
	.short	0                       ; 0x0
	.size	initialized, 2

	.type	currentState,@object    ; @currentState
	.globl	currentState
	.align	1
currentState:
	.short	0                       ; 0x0
	.size	currentState, 2

	.type	currentLED,@object      ; @currentLED
	.globl	currentLED
	.align	1
currentLED:
	.short	0                       ; 0x0
	.size	currentLED, 2

	.type	reboots,@object         ; @reboots
	.globl	reboots
	.align	1
reboots:
	.short	0                       ; 0x0
	.size	reboots, 2

	.type	msgSequenceNumber,@object ; @msgSequenceNumber
	.globl	msgSequenceNumber
	.align	1
msgSequenceNumber:
	.short	0                       ; 0x0
	.size	msgSequenceNumber, 2

	.type	which,@object           ; @which
	.globl	which
	.align	1
which:
	.short	0                       ; 0x0
	.size	which, 2

	.type	MIDIBuf,@object         ; @MIDIBuf
	.globl	MIDIBuf
	.align	1
MIDIBuf:
	.zero	24
	.size	MIDIBuf, 24

	.type	TXvel0,@object          ; @TXvel0
	.globl	TXvel0
TXvel0:
	.byte	0                       ; 0x0
	.size	TXvel0, 1

	.type	TXvel1,@object          ; @TXvel1
	.globl	TXvel1
TXvel1:
	.byte	0                       ; 0x0
	.size	TXvel1, 1

	.type	TXvel2,@object          ; @TXvel2
	.globl	TXvel2
TXvel2:
	.byte	0                       ; 0x0
	.size	TXvel2, 1

	.type	TXvel3,@object          ; @TXvel3
	.globl	TXvel3
TXvel3:
	.byte	0                       ; 0x0
	.size	TXvel3, 1


	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
