.data 
	inputStr: .space 100
	enterString: .asciiz "Nhap 1 chuoi:"
	outerString: .asciiz "\nChuoi da nhap:"
.text 
	.globl main
	main:
		addi  $v0, $zero, 4
		la $a0, enterString
		syscall
		
		addi  $v0, $zero,8 
		la $a0, inputStr 
		addi  $a0, $zero, 100 
		move $t0, $a0 
		syscall
		
		addi  $v0, $zero,4
		la $a0, outerString
		syscall
		
		la $a0, inputStr
		move $a0, $t0
		addi  $v0, $zero, 4 
		syscall
		
		addi  $v0, $zero, 10
		syscall
