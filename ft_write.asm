section .text
global ft_write:function    

ft_write:						; fd, buff, size
	mov		rax, $1				; rax = 1 (1 is the code for write syscall)
	syscall						; call sys_write it takes the same parameters in the same registers as ft_write
   	ret							; return rax
