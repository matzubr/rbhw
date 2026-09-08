.rodata
hello:
  .string "Hello, World!\n"
hello_end:

.text
.globl _start
_start:
  movq $1, %rax # print syscall
  movq $1, %rdi # stdout (2-stderr)
  movq $hello, %rsi # data to print
  # movq $14, %rdx
  movq $(hello_end-hello), %rdx # len to print
  syscall

  movq $60, %rax # exit syscall
  movq $0, %rdi # exit code
  syscall

.section .note.GNU-stack
