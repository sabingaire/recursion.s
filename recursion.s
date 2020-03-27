.data
input_string: .space 101
not_valid: .asciiz "Invalid Input"
start1: .asciiz "Enter the string:
Helper_1: .space 160
Helper_2: .space 160
Helper_3: .space 160
Helper_4: .space 160
Helper_5: .space 160
size_of_helper: .word 40


.text
main:
    main:
    li $v0, 4
    la $a0, start1
    syscall



    li $t5, 2859054
    li $t0, 11
    div $t5, $t0
    mfhi $t5 # module 11
    addi $s0, $t5, 26
    addiu $s5, $s0, -10

    #Taking the user input for strings
    li $v0, 8
    la $a0, input_string
    li $a1, 101
    syscall

    li $s2,0


first_loop:
    la $a1, input_string
    add $a1, $a1, $s2
    lb $a1, 0($a1)


    li $t5, 32
    li $t4, 9
    seq $t5, $a1, $t5
    seq $t4, $a1, $t4
    or $t5, $t5, $t4
    beq $t5, $zero, end_first_loop
    
    addi $s2, $s2, 1
    li $t0, 101
    slt $t5, $s2, $t0
    bne $t5, $zero, first_loop   
    
    j invalid_input







addfunct:
beq $t3, $zero end_add
li $t4, 160
sub $t4, $t4, $t3
la $t6, Helper_3
la $t9, Helper_2
add $t6, $t6, $t4
add $t9, $t9, $t4
lw $t8, 0($t6)
lw $t2, 0($t9)
add $t6, $t8, $t2
add $t6, $t6, $s1
li $t9, 10
div $t6, $t9
mfhi $t6 # This saves the quotient
mflo $s1 # This saves the remainder
la $t8, Helper_2
add $t8, $t8, $t4
sw $t6, 0($t8)
addi $t3, $t3, -4
j add_funct

#increment counter
addi $t1, $t1, 4
j start1
end1:
jr $ra




