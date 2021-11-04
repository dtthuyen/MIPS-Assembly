#viet ham MinMax(&X, N, min, max)
.data
	array: .space 400
.text	
  	addiu	$sp, $sp, -16
	la	$t0, array
	sw	$t0, 0($sp)
	li	$t0, 100
	sw	$t0, 4($sp)
	jal	MinMax
	lw	$t0, 8($sp)
	lw	$t1, 12($sp)
	addiu	$sp, $sp, 16
	
MinMax:
	lw	$t1, 0($sp) #&X = $t1
	lw	$t2, 4($sp) #N = $t2
	lw	$t8, 0($t1) #min = $t8
	move	$t9, $t8    #max = $t9
	addi	$t2, $t2, -1
	blez	$t2, ret
loop:
	addiu	$t1, $t1, 4
	lw	$t0, 0($t1)
	bge	$t0, $t8, next
	move	$t8, $t0
	b 	chk
next:
	ble	$t0, $t9, chk
	move	$t9, $t0
chk:
	addi	$t2, $t2, -1
	bgtz	$t2, loop
ret:
	sw	$t8, 8($sp)
	sw	$t9, 12($sp)
	jr	$ra
end:
	la  	$a0, tb2
  	addi  	$v0, $zero, 4
  	syscall
  	addi  	$v0, $zero, 1
  	move	$a0, $t8
  	syscall
  	
  	la  	$a0, tb3
  	addi  	$v0, $zero, 4
  	syscall
  	addi  	$v0, $zero, 1
  	move	$a0, $t9
  	syscall

	
