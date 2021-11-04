.data 
	inputStr: .space 16 			
	enterString: .asciiz "Nhap Chuoi: " 	
	outerString: .asciiz "Xuat Chuoi: " 	
.text 
.globl main
	main:
		addiu $v0, $zero, 4 	# print string
		la $a0, enterString
		syscall
		
		addiu $v0, $zero, 8 	
		la    $a0, inputStr      
		addi $a1, $zero, 16 	# Chieu dai cua bien inputStr
		addu $t0, $zero, $a0 	# Tam luu lai gia tri cua inputStr vao $t0
		syscall
		
		# Khai bao stack
		addi $sp, $sp, -8	# Khai bao kich thuoc stack
		sw $a0, 0($sp)		# Luu dia chi inputStr vao stack
		jal printf
		j End
	printf:
		addiu $v0, $zero, 4 	# print string
		la $a0, outterString
		syscall
		
		lw $a0, 0($sp) 		# luu lai dia chi inputStr tu stack vao $a0
		addiu $v0, $zero, 4 	# print string
		syscall
		jr $ra
	End:
		addi $sp, $sp, 8	# Tra lai kich thuoc stack
		addiu $v0, $zero, 10 	# end
		syscall
