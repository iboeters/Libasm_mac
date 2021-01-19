; **************************************************************************** ;
;                                                                              ;
;                                                         ::::::::             ;
;    ft_strdup.s                                        :+:    :+:             ;
;                                                      +:+                     ;
;    By: iboeters <iboeters@student.codam.nl>         +#+                      ;
;                                                    +#+                       ;
;    Created: 2021/01/18 13:48:17 by iboeters      #+#    #+#                  ;
;    Updated: 2021/01/19 10:55:01 by iboeters      ########   odam.nl          ;
;                                                                              ;
; **************************************************************************** ;

; Synopsis---------------------------------------------------------------------
; char 	*ft_strdup(const char *s);
; Description------------------------------------------------------------------
; The  strdup() function returns a pointer to a new string which is a duplicate
; of the string s. Memory for the new string is obtained with malloc(3), and
; can be freed with free(3).
; Return-----------------------------------------------------------------------
; On success, the strdup() function returns a pointer to the duplicated string.
; It returns NULL if insufficient memory was available, with errno set to
; indicate the cause of the error.

section .text
	global ft_strdup
	extern ft_strlen
	extern ft_strcpy
	extern malloc
	extern ___error

ft_strdup:				; rdi = s
	push rdi			; store rdi on stack
	call ft_strlen		; str len stored in rax
	inc rax				; len + 1 for null termination
	mov rdi, rax
	call malloc			; call malloc with argument rdi, returns string in rax
	cmp rax, 0
	jne _cpy_string

_error_return:
	mov rdx, rax
	call ___error
	mov [rax], rdx
	mov rax, -1
	ret

_cpy_string:
	; original string is on stack, newly allocated string is in rax
	mov rdi, rax		; rdi holds dst string
	pop rsi
	push rdi			; store dst
	call ft_strcpy
	pop rax
	ret
