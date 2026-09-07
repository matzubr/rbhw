.rodata
out:
  .string "%d\n"

.text
.globl main
main:
  pushq %rbp
  movq %rsp, %rbp

  movq $0, %rax
  movq $1, %r8
  movq $0, %rcx

fibloop:
  movq %rax, %rdx
  movq %r8, %rax
  addq %rdx, %r8
  incq %rcx
  cmpq $10, %rcx
  jl fibloop

  leaq out(%rip), %rdi
  movq %rax, %rsi
  movb $0, %al
  call printf

  movq %rbp, %rsp
  popq %rbp
  xorl %eax, %eax

  ret

.section .note.GNU-stack
