.data
	str1: .asciiz "Nhap mot ky tu: "
	str2: .asciiz "\nKy tu thuong: "
	str: .asciiz "\nKy tu khong hop le"
.text
	.globl main
	main:
		addi  $v0, $zero,4
		la $a0,str1
		syscall #in ra str1
		
		addi  $v0, $zero,12
		syscall #nhap vao 1 ky tu
		add $t0,$v0,0 #luu ky tu
		
		addi  $v0, $zero,11
		add $a0,$t0,0
		syscall
		
		#xu ly
		sge $s0,$t0,65
		sle $s1,$t0,90
		bne $s0,$s1 khac
		add $t0,$t0,32
		
		addi  $v0, $zero,4
		la $a0,str2
		syscall
		addi  $v0, $zero,11
		add $a0,$t0,0
		syscall
		j end
khac:
	sge $s0,$t0,97
	sle $s1,$t0,122
	bne $s0,$s1 khaccc
	addi  $v0, $zero,4
	la $a0,str2
	syscall
	
	addi  $v0, $zero,11
	add $a0,$t0,0
	syscall
	j end
khaccc:
	addi  $v0, $zero,4
	la $a0,str
	syscall
end:
	li $v0,10
	syscall	
		
		
