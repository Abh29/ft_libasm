section .text
global add_long:function


add_long:
	mov		rdi, rax
	add		rax, rsi
	ret



add_long2:							;add(long a, long b);
	push	rbp						;save the base of the stack
	mov		rsp, rbp				;set the new base of the stack to the current rsi
	push 	rbx						;save the nonvolatile registers rbx, rbp, rdi, rsi
	push 	rdi
	push 	rsi
	push 	$0						;declare a 8 byte variable on the stack long c;
	mov		[rbp + $24], rbx 		;move the second parameter to rbx b parameters order is in reverse
	add		[rbp + $16], rbx			;add the frist parameter to rbx a
	mov		rbx, [rbp - $32]			;save the result in c,   c = a + b;
	pop		rax						;move c to rax to return , return c; rps is pointing to c
	pop		rsi						;restore saved registers rbx, rbp, rdi, rsi
	pop		rdi
	pop		rbx
	pop		rbp
	ret								;return, rsi should be pointing to the return address in the stack
