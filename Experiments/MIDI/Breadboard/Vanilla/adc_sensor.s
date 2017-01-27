	.file	"adc_sensor.bc"
	.text
	.globl	adc12_setup
	.align	2
	.type	adc12_setup,@function
adc12_setup:                            ; @adc12_setup
; BB#0:
	push.w	r4
	mov.w	r1, r4
	pop.w	r4
	ret
.Ltmp0:
	.size	adc12_setup, .Ltmp0-adc12_setup

	.globl	adc12_sample
	.align	2
	.type	adc12_sample,@function
adc12_sample:                           ; @adc12_sample
; BB#0:
	push.w	r4
	mov.w	r1, r4
	sub.w	#2, r1
	mov.w	&__ADC12CTL0, r12
	and.w	#-3, r12
	mov.w	r12, &__ADC12CTL0
	mov.w	&__ADC12CTL0, r12
	bis.w	#2064, r12
	mov.w	r12, &__ADC12CTL0
	mov.w	&__ADC12CTL1, r12
	bis.w	#512, r12
	mov.w	r12, &__ADC12CTL1
	mov.w	&__ADC12MCTL0, r12
	bis.w	#2, r12
	mov.w	r12, &__ADC12MCTL0
	mov.w	&__ADC12CTL0, r12
	bis.w	#3, r12
	mov.w	r12, &__ADC12CTL0
	mov.w	#0, &__ADC12IFGR0
	mov.w	#1, &__ADC12IER0
.LBB1_1:                                ; =>This Inner Loop Header: Depth=1
	mov.w	&__ADC12CTL1, r12
	bit.w	#1, r12
	jeq	.LBB1_3
	jmp	.LBB1_2
.LBB1_2:                                ;   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_1
.LBB1_3:
	;DEBUG_VALUE: adc12_sample:ret <- [FPW+-2]
	mov.w	&__ADC12MEM0, r12
	mov.w	r12, -2(r4)
	mov.w	&__ADC12CTL0, r12
	and.w	#-3, r12
	mov.w	r12, &__ADC12CTL0
	mov.w	#0, &__ADC12CTL1
	mov.w	#0, &__ADC12CTL0
	mov.w	-2(r4), r15
	add.w	#2, r1
	pop.w	r4
	ret
.Ltmp1:
	.size	adc12_sample, .Ltmp1-adc12_sample


	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
