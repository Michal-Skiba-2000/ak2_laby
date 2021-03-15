section .text
global _start

_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, question_text
  mov edx, question_text_length
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, input_text
  mov edx, input_text_length
  int 80h

  mov eax, 4
  mov ebx, 1
  mov ecx, display_text
  mov edx, display_text_length
  int 80h

  mov ecx, 0

  mov edi, input_text

  loop_start:
  movzx ax, [input_text+ecx]

  cmp ax, 10
  je loop_end

  cmp ax, 97
  jl big_letter

  cmp ax, 122
  jg increment

  add ax, 13
  cmp ax, 123
  jl write

  add ax, -26
  jmp write

  increment:
  inc ecx
  jmp loop_start

  write:
  mov byte[edi+ecx], al
  jmp increment

  big_letter:

  cmp ax, 65
  jl increment

  cmp ax, 90
  jg increment

  add ax, 13
  cmp ax, 91
  jl write

  add ax, -26
  jmp write

  loop_end:

  mov eax, 4
  mov ebx, 1
  mov ecx, input_text
  mov edx, input_text_length
  int 80h

  mov eax, 1
  int 80h

section .data
  question_text	db	"Podaj zdanie: "
  question_text_length	equ	$ - question_text
  input_text: times 100 db 0
  input_text_length equ	$ - input_text
  display_text	db	"ROT13: "
  display_text_length	equ	$ - display_text
