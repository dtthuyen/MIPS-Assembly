.data
  tb1: .asciiz "Nhap chuoi: "
  tb2: .asciiz "Xuat chuoi: "
  str: .space 128 

.text
.globl main

main:                  
  addi	$v0, ,$0, 4
  la	$a0, tb1
  syscall
  
  addi	$v0, ,$0, 8         
  la    $a0, str      
  addi	$a1, ,$0, 128      
  syscall

  addi	$t0, ,$0, 0    # gia tri  
  subu  $sp, $sp, 4    
  sw    $t0, ($sp)     
  addi	$t1, ,$0, 0    # chi so 

pushl:                 
  lbu    $t0, str($t1) # get current char into a full word
  beqz  $t0, stend     # null byte: end of string

  subu  $sp, $sp, 4    
  sw    $t0, ($sp)     

  addu  $t1, $t1 1     # tang index
  j      pushl         # loop

stend:                
  addi	$t1, ,$0, 0     # gan lai  
popl:
  lw    $t0, ($sp)     # pop 
  addu  $sp, $sp, 4
  beqz  $t0, done      

  sb    $t0, str($t1)  # store at string[$t1]
  addu  $t1, $t1, 1    # tang chi so
  j      popl
done:                  # in chuoi nguoc
  addi	$v0, ,$0, 4
  la	$a0, tb2
  syscall
  
  addi	$v0, ,$0, 4         
  la    $a0, str       
  syscall
  
  addi	$v0, ,$0, 10        # thoat
  syscall

