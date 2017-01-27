	.text
	.file	"src_fram/hello+plainclang.bc"
	.globl	main
	.align	2
	.type	main,@function
main:                                   ; @main
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
	.size	main, .Ltmp0-main


	.ident	"clang version 3.5.0 (tags/RELEASE_350/final)"
