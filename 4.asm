.data
	str1: .asciiz "Nhap so thu nhat: "
	str2: .asciiz "\nNhap so thu hai: "
	tong: .asciiz "\nTong: "
	hieu: .asciiz "\nHieu: "
	tich: .asciiz "\nTich: "
	thuong: .asciiz "\nThuong: "
	du: .asciiz " du "
.text
	.globl main
	main:
		#nhap so thu 1
		addi  $v0, $zero,4
		la $a0,str1
		syscall
		
		addi  $v0, $zero,5
		syscall
		add $t0,$v0,0 #luu so thu nhat = t0
		
		#nhap so thu 2
		addi  $v0, $zero,4
		la $a0,str2
		syscall
		
		addi  $v0, $zero,5
		syscall
		add $t1,$v0,0 #luu so thu 2 vao t1
		
		#tong
		addi  $v0, $zero,4
		la $a0,tong
		syscall
		
		add $a0,$t0,$t1
		addi  $v0, $zero,1
		syscall
		
		#hieu
		addi  $v0, $zero,4
		la $a0,hieu
		syscall 
		sub $a0,$t0,$t1
		addi  $v0, $zero,1
		syscall
		
		#tich
		addi  $v0, $zero,4
		la $a0,tich
		syscall
		mult $t0,$t1
		mflo $a0
		addi  $v0, $zero,1
		syscall
		
		#thuong
		addi  $v0, $zero,4
		la $a0,thuong
		syscall
		div $t0,$t1
		mflo $a0
		addi  $v0, $zero,1
		syscall
		
		#so du
		addi  $v0, $zero,4
		la $a0,du
		syscall
		div $t0,$t1
		mfhi $a0
		addi  $v0, $zero,1
		syscall
