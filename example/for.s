
.intel_syntax noprefix

.section .text
.global main

main:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    
    mov rcx, 0
    
loop_start: 
    cmp rcx, 5
    je done

    mov [rbp - 8], rcx
    lea rdi, [rip + hello_world]
	mov rsi, rcx
	mov rdx, [rip + vector]
	mov rdx, [rdx + rcx * 4]
	call printf@plt
	mov rcx, [rbp - 8]
    
    inc rcx 
    jmp loop_start

    
done:
	mov rdi, [rip + vector]
	call free@plt
	xor rax, rax
	mov rsp, rbp
	pop rbp
	ret


.section .bss
vector:
	.8byte

.section .rodata
hello_world:
    .string "Hello world\n"


