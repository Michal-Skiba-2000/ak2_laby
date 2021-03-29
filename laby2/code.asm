section .text
global _start

_start:

  mov eax, 3
  mov ebx, 0
  mov ecx, number_1
  mov edx, number_1_length
  int 80h

  mov eax, 3
  mov ebx, 0
  mov ecx, number_2
  mov edx, number_2_length
  int 80h

  ;mov eax, 4
  ;mov ebx, 1
  ;mov ecx, number_1
  ;mov edx, number_1_length
  ;int 80h

  ;mov eax, 4
  ;mov ebx, 1
  ;mov ecx, number_2
  ;mov edx, number_2_length
  ;int 80h

  ;mov ecx, 0; licznik number_1(32 bity)
  ;mov ebx, number_1; adres początku number_1(32 bity)

  ;mov edx, 0; licznik number_2(32 bity)
  ;mov edx, number_2; adres początku number_2(32 bity)

  ;outer_loop_start:
  ;movzx ax, [number_1+ecx]
  ;cmp ax, 10
  ;je outer_loop_end

  ;cmp ax, 48
  ;jl outer_increment

  ;cmp ax,57
  ;jg outer_increment

  ;mov byte[result+ecx], al

  ;outer_increment:
  ;inc ecx
  ;jmp outer_loop_start




  ;wynik mnożenia dwóch cyfr w AX
  ;pozycja pierwszego bajtu w CX
  ;add_to_result:
  ;push ax
  ;push bx
  ;mov bx, cx
  ;push cx
  ;mov cx, 0
  ;push dx
  ;mov bx, 65536

  ;ZAPISZ DWIE CYFRY HEX DO WARTOŚCI 8 BITOWEJ W REJSTRZE AX
  ;mov bx, 0

  movzx ax, [number_1+1]
  cmp ax, 48
  jl add_end
  cmp ax,57
  jg add_end
  add ax, -48
  mul bx
  mov dx, ax

  movzx ax, [number_1]
  cmp ax, 48
  jl add_end
  cmp ax,57
  jg add_end
  add ax, -48

  add ax, dx

  ;ZAPISZ WARTOŚĆ 8 BITOWĄ DO DWÓCH CYFR HEX SŁOWA RESULT

  mul bx
  mov dl, ah
  add dl, 48
  mov byte[result+1], dl

  mul bx
  mov dl, ah
  add dl, 48
  mov byte[result+0], dl


  add_end:
  ;outer_loop_end:

  mov eax, 4
  mov ebx, 1
  mov ecx, result
  mov edx, result_length
  int 80h

  mov eax, 1
  int 80h

section .data
  number_1: times 200 db 0
  number_1_length equ	$ - number_1
  number_2: times 200 db 0
  number_2_length equ	$ - number_2
  result: times 400 db 0
  result_length equ	$ - result
