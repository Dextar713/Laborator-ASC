# program to reverse the string given

.data
orig : .asciz "dextar"
rev : .space 6
n : .long 6

.text
.global main
main:
movl n, %ecx
lea orig, %esi
lea rev, %edi

rev_loop:
mov %ecx, %edx
movl n, %eax
sub %edx, %eax
dec %ecx
movb (%esi, %ecx, 1), %dl
mov %dl, (%edi, %eax, 1) 
xor %edx, %edx
cmp %edx, %ecx
je display
jmp rev_loop

display:
movl $4, %eax
movl $1, %ebx
mov $rev, %ecx
addl $1, n
movl n, %edx
int $0x80
jmp et_exit


et_exit:
movl $1, %eax
xorl %ebx, %ebx
int $0x80
