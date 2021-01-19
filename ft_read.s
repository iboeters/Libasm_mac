; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_read.s                                          :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/18 12:05:10 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 10:54:41 by iboeters      ########   odam.nl          ;
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

section .text
	global ft_read
	extern ___error

ft_read:					; rdi = fd, rsi = buf, rdx = count
	mov rax, 0
	syscall
	; cmp rax, 0			; delete
	; jl _error_return		; delete
	jc _error_return
	ret

_error_return:
	mov rdx, rax
	call ___error
	mov [rax], rdx
	mov rax, -1
	mov rax, -1
	ret
