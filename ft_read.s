; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/18 12:05:10 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 14:27:54 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; ssize_t	ft_read(int fd, void *buf, size_t count);
; Description------------------------------------------------------------------
; read() attempts to read up to count bytes from file descriptor fd into the
; buffer starting at buf.
; Return-----------------------------------------------------------------------
; On success, the number of bytes read is returned (zero indicates end of
; file), and the file position is advanced by this number.
; On error, -1 is returned, and errno is set appropriately.

section .text
	global _ft_read
	extern ___error

_ft_read:					; rdi = fd, rsi = buf, rdx = count
	mov rax, 0x2000003		; sycall ID for sys_read
	syscall
	jc _error_return		; jump if carry flag is set (error occured)
	ret

_error_return:
	mov rbx, rax			; save error return in rbx
	push rbx
	call ___error			; returns pointer to errno in rax
	pop rbx
	mov [rax], rbx
	mov rax, -1
	ret
