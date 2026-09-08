.rodata
out:
  .string "%d\n"

.text
.globl main
main:
  subq $8, %rsp # alingment, without rbp cuz we dont need it

  # First attempt
  movq $10, %rdi
  movq $20, %rsi
  movq %rdi, %rax
  addq %rsi, %rax

  # Can we use just constants? without other registers?
  # YES
  # movq $10, %rax
  # addq $30, %rax

  # movq $(10+20), %rax # another way to combine nums

  leaq out(%rip), %rdi
  movq %rax, %rsi
  xorl %eax, %eax
  call printf

  xorl %eax, %eax
  addq $8, %rsp
  ret

.section .note.GNU-stack
