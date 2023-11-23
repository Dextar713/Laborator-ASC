.data
# x:     .long 8
x : .space 4
form_in:  .asciz "%ld"
form_out: .asciz "%ld\n"

.text
.global main

main:
    call input
    pushl x
    call divs
    popl %ebx
    mov $1, %eax
    xor %ebx, %ebx
    int $0x80

divs:
    mov $0, %ecx
    mov x, %eax

for_loop:
    incl %ecx
    xor %edx, %edx
    mov x, %eax
    cmp %eax, %ecx
    jg  exit_for

    div %ecx
    cmp $0, %edx
    jne for_loop
    mov %ecx, %ebx
    call display

    jmp for_loop

exit_for:
    ret


input:
    pushl $x
    pushl $form_in
    call scanf
    popl %ebx
    popl %ebx
    ret

display:
    pusha
    pushl %ebx
    pushl $form_out
    call printf
    popl %ebx
    popl %ebx
    popa
    ret
