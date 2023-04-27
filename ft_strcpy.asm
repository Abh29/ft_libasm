section .text
global ft_strcpy:function     	;must be declared for linker (ld)

ft_strcpy:
	push 	rbp							; save rbp
	mov 	rbp, rsp					; move rbp to the top of the sack (this is the prologue)
	xor 	rax, rax					; set rax to 0 (i = 0)
	xor		rdx, rdx
	.L1: 
	mov 	dh, byte [rsi+rax]			; move src[rax] to bx
	mov		byte [rdi + rax], dh		; move bx to dest[rax]
	inc		rax							; increment the counter
	test	dh, dh						; check if *str == 0
	jnz		.L1							; if != 0 loop back
	mov		rax, rdi

	mov 	rsp, rbp			;move rsp back like it wal before
	pop		rbp					;change rbp back like it was (this is the epilogue)
   	ret							;return rax
