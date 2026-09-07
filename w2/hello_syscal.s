.rodata
hello:
  .string "Hello, World!\n"
hello_end:

.text
.globl _start
_start:
  movq $1, %rax
  movq $1, %rdi
  movq $hello, %rsi
  # movq $14, %rdx
  movq $(hello_end-hello), %rdx
  syscall

  movq $60, %rax
  movq $0, %rdi
  syscall

.section .note.GNU-stack
