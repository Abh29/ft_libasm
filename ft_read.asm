section .text
global ft_read:function    

ft_read:						; fd, buff, size
	mov		rax, $0				; rax = 1 (1 is the code for read syscall)
	syscall						; call sysread it takes the same parameters in the same registers as ft_write
   	ret							; return rax
