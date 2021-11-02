.data
	str1: .asciiz "Nhap so thu nhat: "
	str2: .asciiz "\nNhap so thu hai: "
	s1: .asciiz "\nSo lon hon la: "
	s2: .asciiz "\nHai so bang nhau"
.text
	.globl main
	main:
		#nhap so thu 1
		addi  $v0, $zero,4
		la $a0,str1
		syscall
		
		addi  $v0, $zero,5
		syscall
		addi $t0,$v0,0
		
		#nhap so thu 2
		addi  $v0, $zero,4
		la $a0,str2
		syscall
		
		addi  $v0, $zero,5
		syscall
		addi $t1,$v0,0
		
		#so sanh 2 so
		ble $t0,$t1,TH1
		addi  $v0, $zero,4
		la $a0,s1
		syscall
		
		addi  $v0, $zero,1
		addi $a0,$t0,0
		syscall
		
		j end
TH1:
	beq $t0,$t1,TH2
	addi  $v0, $zero,4
	la $a0,s1
	syscall
	
	addi  $v0, $zero,1
	addi $a0,$t1,0
	syscall
	
	j end
TH2:
	addi  $v0, $zero,4
	la $a0,s2
	syscall
end:
	addi  $v0, $zero,10
	syscall	
		
		
