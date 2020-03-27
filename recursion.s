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
    




#Calling the function

lw $a0, theEntry
jal


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
#lw $t2, array1($t1)
#lw $t3, array2($t1)
#add $t5, $t2, $t3
#addi $t6, $t5, 0
#b if sum <10
#blt $t5, 10, append
addi $t5, $t5, -10
append:
add $t5, $t5, $t0
sw $t5, array3($t1)
sge $t0, $t6, 10

#increment counter
addi $t1, $t1, 4
j start1
end1:
jr $ra




