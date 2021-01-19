; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strcmp.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/18 10:01:39 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 10:53:00 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; int	ft_strcmp(const char *s1, const char *s2);
; Description------------------------------------------------------------------
; The  strcmp()  function  compares  the  two strings s1 and s2.
; Return-----------------------------------------------------------------------
; It returns an integer less than, equal to, or greater than zero if s1
; is found, respectively, to be less than, to match, or be greater than s2.

section .text
	global ft_strcmp

ft_strcmp: 						; rdi = s1, rsi = s2
	mov rbx, 0					; store s1 content
	mov rcx, 0					; counter
	mov rdx, 0					; store s2 content

_cmp_loop:
	mov bl, byte [rdi + rcx]	; s1[i]
	mov dl, byte [rsi + rcx]	; s2[i]
	cmp bl, dl
	jne	_end
	cmp bl, 0
	je _end
	cmp dl, 0
	je _end
	inc rcx
	jmp _cmp_loop

_end:
	mov rax, rbx
	sub rax, rdx				; s1[i] - s2[i]
	ret
