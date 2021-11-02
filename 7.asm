.data
	str1:  .asciiz  "Nhap n: "
	str2:  .asciiz  "[ "
	str3:  .asciiz  " ] = "
	str:  .asciiz  "\nMang vua nhap: "
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

	# nhap phan tu mang
  	addi  $v0, $zero, 5
  	syscall
  	sw    $v0, ($a1)

	# tang chi so
  	addi  $t1, $t1, 1
  	addi  $a1, $a1, 4

  j    NhapMang

KetThucNhap:
  	la    $a0, str
  	addi  $v0, $zero, 4
  	syscall

	# khoi tao
  	la    $a1, array
  	addi  $t1, $zero, 0

XuatMang:
	# kiem tra so lan lap
  	subu  $t2, $t1, $t0
  	bgez  $t2, KetThuc

	# xuat phan tu array[i]
  	lw    $a0, ($a1)
  	addi  $v0, $zero, 1
  	syscall

  	# dau space
  	addi  $a0, $zero, 0x20
  	addi  $v0, $zero, 11
  	syscall

	# tang chi so
  	addi  $t1, $t1, 1
  	addi  $a1, $a1, 4

  j    XuatMang

KetThuc:
	addi  $v0, $zero, 10
  	syscall
