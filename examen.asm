#Examen práctico

.data 
	Result:	.word 0 0 0 0 0 0 0 0
	Vector: .word 1 2 3 0 0 0 0 0
	Matriz: .word 1 2 3 4 5 6 7 8 9
.text
	addi $a0, $zero, 9
	addi $a1, $zero, 0
	addi $a2, $zero, 3
	la $s0, Result
	la $s1, Vector
	la $s2, Matriz
	add $t6, $zero, $s1
	jal getSize
	add $a3, $zero, $v0
	jal calculo
	j exit
	
calculo:
	addi $sp, $sp, -8
	sw $s2, 4($sp)
	sw $s1, 0($sp)
	add $v1, $a3, $zero
	sll $v1, $v1, 2
	addi $v1, $v1, -4
	add $s1, $s1, $v1
	lw $t4, 0($s1)
	add $t0, $zero, $a0
	sll $t0, $t0, 2
	addi $t0, $t0, -4
	add $s2, $s2, $t0
	lw $t0, 0($s2)
	mult $t0, $a2
	mflo $t0
	add $t2, $t2, $t0
	lw $s1, 0($sp)
	lw $s2, 4($sp)
	addi $sp, $sp, 8
	addi $a0, $a0, -1
	addi $a2, $a2, -1
	addi $a1, $a1, 1
	addi $v0, $v0, -1
cycle:	bne $a1, 3, ciclo
	sw $t2, 0($s0)
	addi $s0, $s0, 4
	addi $a1, $zero, 0
	add $t2, $zero, $zero
	addi $a2, $a2, 3
ciclo:	bne $a0, $zero, calculo
	jr $ra
	
getSize:
	lw $t5, 0($t6)
	addi $t6, $t6, 4
	addi $v0, $v0, 1
	bne $t5,$zero, getSize
	addi $v0,$v0,-1
	jr $ra
	
exit: