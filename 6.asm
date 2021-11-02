.data
	str1: .asciiz "Nhap vao mot ky tu: "
	str2: .asciiz "\nKy tu vua nhap: "
	s1: .asciiz " la so"
	s2: .asciiz " la chu thuong"
	s3: .asciiz " la chu hoa"
.text
	.globl main
	main:
		addi  $v0, $zero,4
		la $a0,str1
		syscall #in rs str1
		addi  $v0, $zero,12
		syscall #nhap 1 ky tu
		move $s0,$v0
		addi  $v0, $zero,4
		la $a0,str2
		syscall #in rs str2
		addi  $v0, $zero,11
		move $a0,$s0
		syscall #in ra ky tu vua nhap
		
		#xu ly
		sge $t1,$s0,48
		sle $t2,$s0,57
		bne $t1,$t2 TH1
		addi  $v0, $zero,4
		la $a0,s1
		syscall
		j end
	TH1:
		sge $t1,$s0,97
		sle $t2,$s0,122
		bne $t1,$t2 TH2
		addi  $v0, $zero,4
		la $a0,s2
		syscall
		j end
	TH2:
		addi  $v0, $zero,4
		la $a0,s3
		syscall
		j end
	end:
		addi  $v0, $zero,10
		syscall
		
		
	
