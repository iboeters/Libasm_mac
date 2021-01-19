; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_write.s                                         :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/18 12:05:08 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 12:57:24 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; ssize_t	ft_write(int fd, const void *buf, size_t count);
; Description------------------------------------------------------------------
; write() writes up to count bytes from the buffer starting at buf to the file
; referred to by the file descriptor fd.
; Return-----------------------------------------------------------------------
; On success, the number of bytes written is returned (zero indicates nothing
; was written).

section .text
	global _ft_write
	extern ___error			; _error returns the address of errno

_ft_write:					; rdi = fd, rsi = buf, rdx = count
	mov rax, 0x2000004
	syscall
	jc _error_return		; jump if carry flag is set
	ret

_error_return:
	mov rbx, rax
	push rbx
	call ___error			; returns pointer to errno in rax
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret
