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

end_first_loop:
    li $t9, 0
    add $t9, $s2, $zero

first_loop2:
    la $a1, input_string
    add $a1, $a1, $t9
    lb $a1, 0($a1)

    li $t5, 10
    beq $a1, $t5, end_first_loop2

    addi $t9, $t9, 1 # increment
    li $t5, 100
    slt $t5, $t9, $t5
    bne $t5, $zero, first_loop2


end_first_loop2:

    li $t7, 0
    addi $t9, $t9, -1
    add $t7, $t7, $t9

second_loop:

    la $a1, input_string
    add $a1, $a1, $t7
    lb $a1, 0($a1)

    li $t5, 32
    li $t4, 9
    seq $t5, $a1, $t5
    seq $t4, $a1, $t4
    or $t5, $t5, $t4
    beq $t5, $zero, end_second_loop

    addi $t7, $t7, -1       # decrement
    li $t0, -1
    sgt $t5, $t7, $t0
    bne $t5, $zero, second_loop

end_second_loop:

    sub $s1, $t7, $s2
    slt $t0, $s1, $zero
    li $s3, 19
    sgt $t3, $s1, $s3
    or $t5, $t0, $t3
    bne $t5, $zero, invalid_input

add $s7, $t7, $zero # count
    addi $s6, $s2, -1
    sgt $t6, $s7, $s6
    beq $t6, $zero, back

    j my_subprogram
    # parameter $a1
    # return $t9

back:
    li $v0, 1
    la $s1, Helper_1
    lw $t5, size_of_helper
    addi $s1, $s1, 156
    addi $t4, $zero, 1 # count = 0
    li $t0, 0

print:
    beq $t4, $t5, end_print
    lw $a0, 0($s1)
    bne $a0, $zero, branch

    branchBack:
    beq $t0, $zero, skip_print
#If you opt to print
    syscall

skip_print:
    addi $s1, $s1, -4
    addi $t4, $t4, 1
    j print

end_print:
    lw $a0, 0($s1)
    syscall
    j exit

branch:
    li $t0, 1
    j branchBack








    addition:
    beq $t3, $zero end_addition
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
    j addition

    end_addition:

    la $s1, Helper_3
    sw $zero,0($s1)
    li $s3, 4
    addi $t0, $t0, -4 # decrement
    j multiply

    multiplyEnd:
    addi $t1, $t1, -1
    j exponent

    end_exponent:
    lw $t5, size_of_helper # size
    la $s1, Helper_4
    li $t4, 0 # count


    initialize4:
    beq $t4, $t5, end_initialize4
    sw $zero, 0($s1)
    addi $s1, $s1, 4
    addi $t4, $t4, 1
    j initialize4

    end_initialize4:
    la $t5, Helper_4
    li $t0, 10
    div $s4, $t0
    mfhi $t0
    mflo $s3

    sw $t0, 0($t5)
    sw $s3, 4($t5)

    lw $t3, size_of_helper
    la $s1, Helper_2
    la $t4, Helper_5
    li $t6, 0

    copy2:
    beq $t6, $t3, end_copy2
    lw $t9, 0($s1)
    sw $t9, 0($t4)
    addi $s1, $s1, 4
    addi $t4, $t4, 4

    end_copy2:
    lw $t5, size_of_helper # array size
    la $s1, Helper_2
    li $t4, 0 #count


    initialize5:
        beq $t4, $t5, end_initialize5
        sw $zero, 0($s1)
        addi $s1, $s1, 4
        addi $t4, $t4, 1
        j initialize5
    
    end_initialize5:
    li $t5, 0
    li $t0, 8 # count
    li $s3, 0 # Helper_3 index

    multiply2: # Helper_5 * Helper_4 = Helper_2
   beq $t0, $zero, multiply2End
   li $t3, 160
   li $t5, 0

    multiply2In:
    beq $t3, $zero multiply2InEnd
    li $s1, 160
    sub $s1, $s1, $t3
    li $t4, 8
    sub $t4, $t4, $t0
    la $t6, Helper_5
    la $t9, Helper_4
    add $t6, $t6, $s1
    lw $s1, 0($t6)
    add $t9, $t9, $t4
    lw $t4, 0($t9)

    mul $s1, $s1, $t4
    add $s1, $s1, $t5
    li $t4, 10
    div $s1, $t4
    mfhi $t4 #This saves the remainder
    mflo $t5 # This saves the quoteient
    la $t6, Helper_3
    add $t6, $t6, $s3
    sw $t4, 0($t6)

    addi $s3, $s3, 4 #increment
        addi $t3, $t3, -4
        j multiply2In
    
   multiply2InEnd:
      
          li $t3, 160
          li $s1, 0

add_funct:
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
    mfhi $t6 # quotient
    mflo $s1 # remainder
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

Corresponding_ascii:
    # parameter $s4
    # return $s4
    li $t3, 64
    li $s1, 65
    add $s1, $s5, $s1
    sgt $t5, $s4, $t3
    slt $t0, $s4, $s1
    and $t5, $t5, $t0
    bne $t5, $zero, capital

    li $t3, 96
    li $s1, 97
    add $s1, $s1, $s5
    sgt $t5, $s4, $t3
    slt $t0, $s4, $s1
    and $t5, $t5, $t0
    bne $t5, $zero, small

    li $t3, 47
    li $s1, 58
    sgt $t5, $s4, $t3
    slt $t0, $s4, $s1
    and $t5, $t5, $t0
    bne $t5, $zero, number

    j invalid_input
    
    capital:
    addiu $s4, $s4, -55
    jr $ra
    
    small:
    addiu $s4, $s4, -87
    jr $ra

    number:
    addiu $s4, $s4, -48
    jr $ra

invalid_input:
    li $v0, 4
    la $a0, Not_Valid
    syscall
    j exit






