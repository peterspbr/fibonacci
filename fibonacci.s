# ##### Make the program compatible with a x86_64 processor #####
	.text
	.globl	x
	.bss
	.align 4
	.type	x, @object
	.size	x, 4
x:
	.zero	4
	.globl	y
	.align 4
	.type	y, @object
	.size	y, 4
y:
	.zero	4
	.globl	z
	.align 4
	.type	z, @object
	.size	z, 4
z:
	.zero	4
	.section	.rodata
# ##############################################################

.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
	
main:
.LFB0:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, x(%rip)
	movl	$1, y(%rip)
.L2:
	movl	x(%rip), %eax
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi # LEA means Load Effective Address
	movl	$0, %eax
	call	printf@PLT
	movl	x(%rip), %edx
	movl	y(%rip), %eax
	addl	%edx, %eax
	movl	%eax, z(%rip)
	movl	y(%rip), %eax
	movl	%eax, x(%rip)
	movl	z(%rip), %eax
	movl	%eax, y(%rip)
	movl	x(%rip), %eax
	cmpl	$254, %eax
	jle	.L2
	movl	$0, %eax
	popq	%rbp
	ret
