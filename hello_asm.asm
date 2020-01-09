section .data
msg: db "Hello World!", 0x0a     ; cria um label com o dado xyz e o caracter de nova linha (0x0a)
tam: equ $-msg                  ; recebe a posicao atual menos (-) tamanho da mensagem

section .text
global _start                   ; cria um rotulo global (visivel ao linker)

_start:
mov eax, 4                      ; move o valor 4 (syscall write) para o registrador eax
mov ebx, 1                      ; informa o file description 1 (/dev/fd/1) para o registrador ebx
mov ecx, msg                    ; mensagem (*buf);
mov edx, tam                    ; tamanho da mensagem (count)
int 0x80                        ; execute uma chamada syscall

mov eax, 1                      ; move o valor 1 (syscall exit) para o registrador eax
mov ebx, 0                      ; move o valor 0 para o registrador ebx (return 0)
int 0x80                        ; execute uma chamada syscall
