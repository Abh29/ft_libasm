section .text
global ft_strcmp:function     	;must be declared for linker (ld)

ft_strcmp:
	push 	rbp							; save rbp
	mov 	rbp, rsp					; move rbp to the top of the sack (this is the prologue)

	xor 	rax, rax					; set registers to 0x0
	xor		rdx, rdx
	xor		rcx, rcx
	.L1:
	mov		al, byte[rdi+rdx]			; move  s1[rdx] to rax
	mov 	cl, byte [rsi+rdx]			; move  s2[rdx] to rcx
	inc		rdx							; increment the counter
	sub		rax, rcx					; rax = rax - rcx
	jnz		.Out
	test	cl, cl						; check s2[rdx] == 0
	jnz		.L1							; if != 0 loop back
	.Out:
	mov 	rsp, rbp					;move rsp back like it wal before
	pop		rbp						;change rbp back like it was (this is the epilogue)
   	ret									;return rax
