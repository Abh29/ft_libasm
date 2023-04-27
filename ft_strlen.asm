section .text
global ft_strlen:function     	;must be declared for linker (ld)

ft_strlen:
	push 	rbp					;save rbp
	mov 	rbp, rsp			;move rbp to the top of the sack (this is the prologue)
	xor 	rax, rax			;set rax to 0 (i = 0)
	.L1:
	cmp 	byte [rdi+rax], $0	;compare rdi[rax] with 0 if (str[i] == 0)
	jz		.OUT				;if == 0 go to end
	inc		rax					;else increment rax
	jmp		.L1					;loop back
	.OUT:
	mov 	rsp, rbp			;move rsp back like it wal before
	pop		rbp					;change rbp back like it was (this is the epilogue)
   	ret							;return rax
