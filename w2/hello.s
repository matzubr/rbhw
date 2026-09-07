.rodata
hello:
  .string "Hello, World!\n"

.text
.globl main
main:
  # aling stack for call
  pushq %rbp
  movq %rsp, %rbp

  # set first arg as an address of string
  leaq hello(%rip), %rdi

  # the only diff between printf and puts that
  # put \n at the end of the stirng automatic
  # call puts
  movb $0, %al
  call printf

  # epilog
  movq %rbp, %rsp
  popq %rbp
  
  # set exit code 0
  # movq $0, %rax
  xorl %eax, %eax
  ret

.section .note.GNU-stack
