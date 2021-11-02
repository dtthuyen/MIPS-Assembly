.data
	str1: .asciiz "Nhap mot ky tu: "
	str2: .asciiz "\nKy tu lien truoc: "
	str3: .asciiz "\nKy tu lien sau: "

.text 
	.globl main
	main:
		addi $v0, $zero, 4
		la $a0, str1
		syscall
		
		addi  $v0, $zero, 12
		syscall
		move $s1, $v0 #luu ky tu
		
		addi  $v0, $zero,11
		move $a0,$s1
		syscall
		
		addi  $v0, $zero,4
		la $a0, str2
		syscall
		
		sub $s0, $s1, 1
		addi  $v0, $zero,11
		move $a0,$s0
		syscall		
		
		addi  $v0, $zero,4
		la $a0, str3
		syscall
		
		add $s2, $s1, 1
		addi  $v0, $zero,11
		move $a0,$s2
		syscall	
