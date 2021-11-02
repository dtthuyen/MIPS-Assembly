.data
	tb1: .asciiz "Nhap so thu nhat: "
	tb2: .asciiz "Nhap so thu hai: "
	tb3: .asciiz "Tong:  "
.text
main:
	la $a0, tb1 #nhap so thu nhat
	jal xuatChuoi
	jal nhapSo
	add $t0, $0, $v0

	la $a0, tb2 #nhap so thu 2
	jal xuatChuoi
	jal nhapSo
	add $t1, $0, $v0

	add $a0, $0, $t0 
	add $a1, $0, $t1
	jal sum
	
	# Xuat ket qua ra man hinh
	add $t3, $0, $v0 # luu ket qua thu tuc vao #t3
	la $a0, tb3
	jal xuatChuoi
	add $a0, $0, $t3
	jal xuatSo

	addi $v0, $0, 10
	syscall
sum:
	addi $sp, $sp, -12
	sw $ra, 8($sp)
	sw $a0, 4($sp)
	sw $a1, 0($sp)

	add $v0, $a0, $a1

	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
xuatChuoi:
	addi $v0, $0, 4
	syscall
	jr $ra
nhapSo:
	addi $v0, $0, 5
	syscall
	jr $ra
xuatSo:
	addi $v0, $0, 1
	syscall
	jr $ra

	