.data
	tb1: .asciiz "Nhap chuoi: "
	tb2: .asciiz "Chieu dai cua chuoi: "
	input:	.space	256
	output:	.space	256
.text
.globl main
main:
	addi	$v0, ,$0, 4
	la	$a0, tb1
	syscall
	
	addi	$v0, $0, 8		
	la	$a0, input		
	addi	$a1, ,$0,256		
	syscall
	
	jal	strlen			
	
	addi	$v0, ,$0, 4
	la	$a0, tb2
	syscall
	add	$a0, $zero, $v1
	addi	$v0, $0,1	# This prints the length that we found in 'strlen'
	syscall
	
	addi	$v0, ,$0,10	# exit()
	syscall
	
# strlen:
# a0 is our input string
# v1 returns the length
strlen:
	addi	$t0, $zero, 0 
	addi	$t2, $zero, 0
	strlen_loop:
		add	$t2, $a0, $t0
		lb	$t1, 0($t2)
		beqz	$t1, strlen_exit
		addiu	$t0, $t0, 1
		j	strlen_loop
		
	strlen_exit:
		subi	$t0, $t0, 1
		addi 	$v1, $t0, 0
		jr	$ra
