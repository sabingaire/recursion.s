.data
max_input: .space 10000
not_valid: .asciiz "Invalid Input"
start1: .asciiz "Enter the string:

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

