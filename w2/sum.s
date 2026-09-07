.rodata
out:
  .string "%d\n"

.text
.globl main
main:
  # stack aling
  pushq %rbp
  movq %rsp, %rbp

  # First attempt
  movq $10, %rdi
  movq $20, %rsi
  movq %rdi, %rax
  addq %rsi, %rax

  # Can we use just constants? (yes)
  # movq $10, %rax
  # addq $30, %rax

  leaq out(%rip), %rdi
  movq %rax, %rsi
  movb $0, %al
  call printf

  movq %rbp, %rsp
  popq %rbp
  xorl %eax, %eax
  ret

.section .note.GNU-stack
