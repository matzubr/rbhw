# Phase 1

```
Dump of assembler code for function phase_1:
   0x00000000004011b0 <+0>:	push   %rbp
   0x00000000004011b1 <+1>:	mov    %rsp,%rbp
   0x00000000004011b4 <+4>:	sub    $0x10,%rsp
   0x00000000004011b8 <+8>:	mov    %rdi,-0x8(%rbp)              # Мы кладем аргумент (вводимую строку) по оффсету от rbp?
   0x00000000004011bc <+12>:	mov    -0x8(%rbp),%rdi            # Мы кладем его обратно в rdi? Что за логика?
   0x00000000004011c0 <+16>:	mov    $0x402069,%esi             # x/s по адрессу - Rust is blazingly fast and memory-efficient
                                                                # Из-за $ у адресса - вызывает подозрение на константу
   0x00000000004011c5 <+21>:	call   0x401060 <strcmp@plt>      # strcmp - сравнивает %rdi vs %rsi(esi)
   0x00000000004011ca <+26>:	cmp    $0x0,%eax
   0x00000000004011cd <+29>:	je     0x4011d8 <phase_1+40>
   0x00000000004011d3 <+35>:	call   0x401180 <explode_bomb>
   0x00000000004011d8 <+40>:	movabs $0x402095,%rdi
   0x00000000004011e2 <+50>:	mov    $0x0,%al
   0x00000000004011e4 <+52>:	call   0x401030 <printf@plt>
   0x00000000004011e9 <+57>:	add    $0x10,%rsp
   0x00000000004011ed <+61>:	pop    %rbp
   0x00000000004011ee <+62>:	ret
End of assembler dump.
```
# Phase 2


```
# objdump -d bomb # легче по адресам визуально прыгать. 
                  # Если надо прочитать значени строки по адрессу - то gdb
                  
00000000004011f0 <phase_2>:
  4011f0:	55                   	push   %rbp
  4011f1:	48 89 e5             	mov    %rsp,%rbp
  4011f4: 48 83 ec 40           sub    $0x40,%rsp                       # аллокация 64 байт
  4011f8: 48 89 7d f8           mov    %rdi,-0x8(%rbp)                  # 
  4011fc: 48 8b 7d f8           mov    -0x8(%rbp),%rdi                  # stdin
  401200: 48 8d 55 e0           lea    -0x20(%rbp),%rdx                 # set rdx to reference rbp-0x20 
  401204: 48 8d 4d e0           lea    -0x20(%rbp),%rcx                 # same here
  401208: 48 83 c1 04           add    $0x4,%rcx                        # rcx = reference of rbp - 0x20 + 4
  40120c: 4c 8d 45 e0           lea    -0x20(%rbp),%r8
  401210: 49 83 c0 08           add    $0x8,%r8                         # r8 = rbp - 0x20 + 8
  401214: 4c 8d 4d e0           lea    -0x20(%rbp),%r9
  401218: 49 83 c1 0c           add    $0xc,%r9                         # +12
  40121c: 4c 8d 55 e0           lea    -0x20(%rbp),%r10
  401220: 49 83 c2 10           add    $0x10,%r10                       # +16
  401224: 48 8d 45 e0           lea    -0x20(%rbp),%rax
  401228: 48 83 c0 14           add    $0x14,%rax                       # +20
                                                                        # rdx=rbp-20
                                                                        # rcx=rbp-20+4
                                                                        # r8=rbp-20+8
                                                                        # r9=rbp-20+12
                                                                        # r10=rbp-20+16
                                                                        # rax=rbp-20+20
  40122c: 48 be a6 20 40 00 00  movabs $0x4020a6,%rsi                   # x/s по константе = "%d %d %d %d %d %d"
                                                                        # rsi - format for sscanf (second arg)
  401233: 00 00 00
  401236: 4c 89 14 24           mov    %r10,(%rsp)                      # 7th arg on stack
  40123a: 48 89 44 24 08        mov    %rax,0x8(%rsp)                   # 8th arg on stack with offset 8bytes
  40123f: b0 00                 mov    $0x0,%al                         # Skip xmm registers (пришлось погуглить)
  401241: e8 2a fe ff ff        call   401070 <__isoc99_sscanf@plt>     # Читаем строку по формату
  401246:	83 f8 06             	cmp    $0x6,%eax                        # compare eax to scnned fields
  401249:	0f 84 05 00 00 00    	je     401254 <phase_2+0x64>            # jump equal - 401254
  40124f:	e8 2c ff ff ff       	call   401180 <explode_bomb>
  401254:	83 7d e0 01          	cmpl   $0x1,-0x20(%rbp)                 # compare 1 vs -20 rbp ?
  401258:	0f 84 05 00 00 00    	je     401263 <phase_2+0x73>
  40125e:	e8 1d ff ff ff       	call   401180 <explode_bomb>
  401263:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%rbp)                 # move 1 to -24 rbp
  
  40126a:	83 7d dc 06          	cmpl   $0x6,-0x24(%rbp)                 # compare 6 vs 1 (after reading - 4012a6 
                                                                        # i got that this is a loop)
  40126e:	0f 8d 37 00 00 00    	jge    4012ab <phase_2+0xbb>            # if 6<=1 - 4012ab
  401274:	48 63 45 dc          	movslq -0x24(%rbp),%rax                 # rax=1
  401278:	8b 44 85 e0          	mov    -0x20(%rbp,%rax,4),%eax          # eax=rbp-20 + rax*4=rbp-20 + (1*4)
  40127c:	8b 4d dc             	mov    -0x24(%rbp),%ecx                 # ecx=rbp-24=1
  40127f:	83 e9 01             	sub    $0x1,%ecx                        # ecx-=1
  401282:	48 63 c9             	movslq %ecx,%rcx                        # extended to register (up to 64bit)
  401285:	8b 4c 8d e0          	mov    -0x20(%rbp,%rcx,4),%ecx          # ecx=rbp-20 + rcx*4
  401289:	d1 e1                	shl    $1,%ecx                          # ecx*=2
  40128b:	39 c8                	cmp    %ecx,%eax                        # ecx == eax => 
                                                                        # rbp-20+rax*4 == (rbp-20+rcx*4)*2 =>
                                                                        # 
  40128d:	0f 84 05 00 00 00    	je     401298 <phase_2+0xa8>
  401293:	e8 e8 fe ff ff       	call   401180 <explode_bomb>
  401298:	e9 00 00 00 00       	jmp    40129d <phase_2+0xad>
  40129d:	8b 45 dc             	mov    -0x24(%rbp),%eax
  4012a0:	83 c0 01             	add    $0x1,%eax
  4012a3:	89 45 dc             	mov    %eax,-0x24(%rbp)
  4012a6:	e9 bf ff ff ff       	jmp    40126a <phase_2+0x7a>
  4012ab:	48 bf b8 20 40 00 00 	movabs $0x4020b8,%rdi                   # x/s $ 4020b8 - Phase2 Passed (useless)
  4012b2:	00 00 00
  4012b5:	b0 00                	mov    $0x0,%al
  4012b7:	e8 74 fd ff ff       	call   401030 <printf@plt>
  4012bc:	48 83 c4 40          	add    $0x40,%rsp
  4012c0:	5d                   	pop    %rbp
  4012c1:	c3                   	ret
  4012c2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 cs nopw 0x0(%rax,%rax,1)
  4012c9:	1f 84 00 00 00 00 00
```
