.text
.globl main
main:
  # First attempt
  movq $10, %rdi
  movq $20, %rsi
  movq %rdi, %rax
  addq %rsi, %rax

  # Can we use just constants? (yes)
  # movq $10, %rax
  # addq $30, %rax
  ret

.section .note.GNU-stack
