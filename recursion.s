.data
max_input: .space 10000
not_valid: .asciiz "Invalid Input"
start1: .asciiz "Enter the string:
theEntry: .word 0


.text
main:
    main:
    li $v0, 4
    la $a0, start1
    syscall

#Taking the user input for strings
    li $v0, 8
    la $a0, max_input
    li $a1, 101
    syscall

sw $v0, theEntry

#Calling the function

lw $a0, theEntry
jal


addfunct:
li $t1, 0
li $t0, 0
start1:
#start from back(front)
beq $t1, 160, end1
lw $t2, array1($t1)
lw $t3, array2($t1)
add $t5, $t2, $t3
addi $t6, $t5, 0




