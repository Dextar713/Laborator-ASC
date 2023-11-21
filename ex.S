.data
s : .space 3
n : .long 3
x : .space 4
s2 : .space 3

.text
.global main 

main:
mov $3, %eax
mov $0, %ebx
mov $s, %ecx
mov n, %edx
int $0x80

lea s, %edi
mov n, %ecx
xor %eax, %eax
xor %edx, %edx

to_num:
movb (%edi), %dl
incl %edi
subb $48, %dl
add %dl, %al
mov $10, %ebx
xor %edx, %edx
imul %ebx
dec %ecx
cmp $0, %ecx
je inter
jmp to_num


inter:
mov $10, %ebx
idiv %ebx
mov %eax, x
lea s2, %edi
mov n, %ecx
decl %ecx
jmp to_str

to_str:
mov $10, %ebx
idiv %ebx
addb $48, %dl
movb %dl, (%edi, %ecx, 1)
decl %ecx
xor %edx, %edx
cmp $0, %eax
je display
jmp to_str



display:
mov $4, %eax
mov $1, %ebx
mov $s2, %ecx
mov n, %edx
int $0x80
mov $1, %eax
xor %eax, %eax
int $0x80
