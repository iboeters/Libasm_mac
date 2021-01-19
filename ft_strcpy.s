; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcpy.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/15 14:42:18 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 10:53:08 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; char	*ft_strcpy(char *dest, const char *src);
; Description------------------------------------------------------------------
; The strcpy() function copies the string pointed to by src, including the
; terminating null byte ('\0'), to the buffer pointed to by dest. The strings
; may not  overlap, and the destination string dest must be large enough to
; receive the copy.
; Return-----------------------------------------------------------------------
; Returns a pointer to the destination string dest.

section .text
	global ft_strcpy
	extern ft_strlen

ft_strcpy:			; rdi = dst, rsi = src
	push rdi 		; save dst
	mov rdi, rsi
	call ft_strlen	; rax holds ft_strlen src
	pop rdi
	push rdi
	mov rcx, 0

_cpy_loop:
	mov dl, byte [rsi + rcx]
	mov byte [rdi + rcx], dl
	cmp rcx, rax
	je _end
	inc rcx
	jmp _cpy_loop

_end:
	pop rax
	ret
