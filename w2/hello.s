.rodata
hello:
  .string "Hello, World!\n"

.text
.globl main
main:
  pushq %rbp # rbp is callee saved so we save it + aling stack due to _start_main call from libc
  movq %rsp, %rbp # move stack pointer on the base

  leaq hello(%rip), %rdi # due to RIP relative instructions, we save (rip + hello) offset to rdi

  xorl %eax, %eax # al register need to be set to 0 to skip allocating XMM registers
  call printf
  xorl %eax, %eax # printf write number of bytes that hes print to RAX + set exit code to 0

  movq %rbp, %rsp # return pointer to base
  popq %rbp # callee save register need to be returned
  ret

.section .note.GNU-stack
