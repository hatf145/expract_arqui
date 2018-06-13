#Examen práctico

.data 
	Result:	.word 0 0 0 0 0 0 0 0
	Matriz: .word 1 2 3 4 5 6 7 8 9
.text
	addi $a0, $zero, 9
	addi $a1, $zero, 0
	addi $a2, $zero, 3
	la $s0, Result
	la $s2, Matriz
	jal calculo
	j exit
	
calculo:
	addi $sp, $sp, -4
	sw $s2, 0($sp)
	add $t0, $zero, $a0
	sll $t0, $t0, 2
	addi $t0, $t0, -4
	add $s2, $s2, $t0
	lw $t0, 0($s2)
	mult $t0, $a2
	mflo $t0
	add $t2, $t2, $t0
	lw $s2, 0($sp)
	addi $sp, $sp, 4
	addi $a0, $a0, -1
	addi $a2, $a2, -1
	addi $a1, $a1, 1
cycle:	bne $a1, 3, ciclo
	sw $t2, 0($s0)
	addi $s0, $s0, 4
	addi $a1, $zero, 0
	add $t2, $zero, $zero
	addi $a2, $a2, 3
ciclo:	bne $a0, $zero, calculo
	jr $ra
	
exit: