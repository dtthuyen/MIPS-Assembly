.data
	str1:  .asciiz  "Nhap n: "
	str2:  .asciiz  "[ "
	str3:  .asciiz  " ] = "
	str4:  .asciiz  "So lon nhat la: "
	str5: .asciiz "\nSo nho nhat la: "
	array:  .word  0:100 
.text
main:
	# nhap n
  	la  $a0, str1
  	addi  $v0, $zero, 4
  	syscall

  	addi  $v0, $zero, 5
  	syscall
  	addi  $t0, $v0, 0

	# khoi tao
  	addi  $t1, $zero, 0 #chi so khi duyet lan luot cac phan tu
  	la  $a1, array

NhapMang:
	# kiem tra so lan lap
  	subu  $t2, $t1, $t0
  	bgez  $t2, KetThucNhap

  	# xuat dau nhac nhap
  	la    $a0, str2
  	addi  $v0, $zero, 4
  	syscall

  	addi  $a0, $t1, 0
  	addi  $v0, $zero, 1
  	syscall

  	la    $a0, str3
  	addi  $v0, $zero, 4
  	syscall

	# nhap gia tri tung phan tu
  	addi  $v0, $zero, 5
  	syscall
  	sw    $v0, ($a1)

	# tang chi so
  	addi  $t1, $t1, 1
  	addi  $a1, $a1, 4

  j    NhapMang

KetThucNhap:
  	la    $a0, str4
  	addi  $v0, $zero, 4
  	syscall

	# khoi tao
  	la    $a1, array
  	addi  $t1, $zero, 0
  	lw $t3, ($a1) #so lon nhat = t3
  	addi $t4, $t3,0 #so nho nhat = t4
  	
TimSo:
	# kiem tra so lan lap
	addi  $t1, $t1, 1
	addi  $a1, $a1, 4
	bge $t1, $t0, KetThuc
  	
	# so sanh voi phan tu array[i]
  	lw    $t5, ($a1)
  	blt $t5,$t4, L1
	j Next1
L1:
	addi $t6,$t4,0
	addi $t4,$t5,0
	addi $t5,$t6,0

Next1:
	blt $t3,$t5,L2
  	j    TimSo
L2:
	addi $t6,$t3,0
	addi $t3,$t5,0
	addi $t5,$t6,0
	j    TimSo

KetThuc:
	addi  $a0, $t3, 0
  	addi  $v0, $zero, 1
  	syscall
  	
	la    $a0, str5
  	addi  $v0, $zero, 4
  	syscall
  	
  	addi  $a0, $t4, 0
  	addi  $v0, $zero, 1
  	syscall
