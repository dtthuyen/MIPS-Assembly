.data
	str1: .asciiz "Nhap mot so: "
	str2: .asciiz "Tong tu 1 den "
	str3: .asciiz " la: "
.text
main:
	# nhap vao 1 so
  	la  $a0, str1
  	addi  $v0, $zero, 4
  	syscall

  	addi  $v0, $zero, 5
  	syscall
  	addi  $t0, $v0, 0

	# khoi tao 
  	addi  $t1, $zero, 1 #chi so khi duyet lan luot cac phan tu
  	addi $t2, $zero, 0 #sum
  	jal sum
  
sum:
	subu  $t3, $t1, $t0
  	bgtz  $t3, ketthuc #ket thuc tinh tong khi cong het cac phan tu
  	
  	add $t2, $t2, $t1
  	addi $t1, $t1, 1
  j	sum
  
ketthuc:
	# in Tong tu 1 den n la:
	la  $a0, str2 
  	addi  $v0, $zero, 4
  	syscall
  	
  	addi $v0, $zero, 1
  	addi $a0, $t0, 0
  	syscall
  	
  	la  $a0, str3
  	addi  $v0, $zero, 4
  	syscall
  	
  	# in tong
  	addi $v0, $zero, 1
  	addi $a0, $t2, 0
  	syscall
 
