section .data
    buffer times 128 db 0 ; buffer to store input

section .text
    global _start

_start:
    ; read a string from stdin
    mov eax, 3 ; system call number (sys_read)
    mov ebx, 0 ; file descriptor (stdin)
    mov ecx, buffer ; buffer to store input
    mov edx, 128 ; number of bytes to read
    int 0x80 ; call kernel

    ; write the ASCII values of the characters to stdout
    mov eax, 4 ; system call number (sys_write)
    mov ebx, 1 ; file descriptor (stdout)
    mov ecx, buffer ; message to write
    mov edx, 128 ; message length
    int 0x80 ; call kernel

    ; exit
    mov eax, 1 ; system call number (sys_exit)
    xor ebx, ebx ; exit code
    int 0x80 ; call kernel
