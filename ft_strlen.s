; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strlen.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/15 11:56:44 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 14:44:42 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; size_t	ft_strlen(const char *s);
; Description------------------------------------------------------------------
; The strlen() function calculates the length of the string pointed to by s,
; excluding the terminating null byte ('\0').
; Return-----------------------------------------------------------------------
; The strlen() function returns the number of characters in the string pointed
; to by s.

section .text
	global _ft_strlen

_ft_strlen:			; rdi = s
	mov rax, 0

_counter:
	mov cl, [rdi]	; cl = 8 bit equivalent of rcx
	cmp cl, 0
	jz _exit		; jump zero
	inc rdi
	inc rax
	jmp _counter

_exit:
	ret
