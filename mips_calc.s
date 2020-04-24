#################################################################
#								#
#	Name: Christelle Nieves					#
#	Class: CDA 3100						#
#	Assignment: Assignment #4				#
#	Description: Reads in two numbers and calculates	#
#		the sum, difference, product, and the		#
#		quotient and remainder.				#
#								#
#################################################################

.data
	name: .asciiz "\nName: Christelle\n"
	title: .asciiz "Mips Assignment 1\n"
	description: .asciiz "A program that calculates the sum, difference, product, and quotient of two numbers.\n\n"
	getnum1: .asciiz "Enter the first number:"
	getnum2: .asciiz "Enter the second number:"
	plus: .asciiz " + "	# NOTE: I am using .asciiz for these so I can have spaces on both sides of the operators
	minus: .asciiz " - "
	times: .asciiz " * "
	divide: .asciiz " / "
	equals: .asciiz " = "
	nextline: .asciiz "\n"
	remainder: .asciiz " rem "
	errormessage: .asciiz "*** Error: The number is below 1 ***\n*** Exiting the program. ***\n"
	exitmessage: .asciiz "\nThe program is stopping now. Bye Bye.\n"
.text
.globl main

main:
	# Print the introduction

	li $v0, 4				# Get ready to print a string
	la $a0, name				# Print my name
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, title				# Print the title of the assignment
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, description			# Print the description of the assignment
	syscall

	# Get two numbers from the user

	li $v0, 4				# Get ready to print a string
	la $a0, getnum1				# Print the message to get the first number
	syscall

	li $v0, 5				# Take a number as input from the user
	syscall
	
	move $t0, $v0				# Store the number into t0

	blt $t0, 1, BADN			# Check if the number is below 1
	
	li $v0, 4				# Get ready to print a string
	la $a0, getnum2				# Print the message to get the second number
	syscall

	li $v0, 5				# Take a number as input from the user
	syscall

	move $t1, $v0				# Store the number into t1

	blt $t1, 1, BADN			# Check if the number is below 1
	
	# Calculate sum, difference, product, and quotient/remainder.

	add $t6, $t0, $t1			# Perform addition
	sub $t3, $t0, $t1			# Perform subtraction
	mul $t4, $t0, $t1			# Perform multiplication
	div $t0, $t1				# Perform division

	# Print the addition equation

	li $v0, 1				# Get ready to print an integer
	move $a0, $t0				# Move the integer from t0 to a0
	syscall

	move $t0, $a0				# Move the number back into t0 so we can use it again later

	li $v0, 4				# Get ready to print a string
	la $a0, plus				# Print the plus sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t1				# Move the integer from t1 to a0
	syscall

	move $t1, $a0				# Move the integer back into t1 so we can use it again later

	li $v0, 4				# Get ready to print a string
	la $a0, equals				# Print the equals sign
	syscall	

	li $v0, 1				# Get ready to print an integer
	move $a0, $t6				# Move the sum into a0 and print it
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, nextline			# Print the nextline string
	syscall

	# Print the subtraction equation

	li $v0, 1				# Get ready to print an integer
	move $a0, $t0				# Move the integer from t0 to a0 and print it
	syscall

	move $t0, $a0				# Move the integer back into t0 so we can use it again later

	li $v0, 4				# Get ready to print a string
	la $a0, minus				# Print the minus sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t1				# Move the integer from t1 to a0 and print it
	syscall

	move $t1, $a0				# Put the number back into t1

	li $v0, 4				# Get ready to print a string
	la $a0, equals				# Print the equals sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t3				# Move the integer from t3 into a0 and print it
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, nextline			# Print the nextline string
	syscall
	
	# Print the multiplication equation

	li $v0, 1				# Get ready to print an integer
	move $a0, $t0				# Move the integer from t0 to a0 and print it
	syscall

	move $t0, $a0				# Put the integer back into t0 so we can access it again

	li $v0, 4				# Get ready to print a string
	la $a0, times				# Print the multiplication sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t1				# Move the integer from t1 to a0 and print it
	syscall

	move $t1, $a0				# Move the integer back into t1 so we can use it again

	li $v0, 4				# Get ready to print a string
	la $a0, equals				# Print the equals sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t4				# Move the integer from t4 to a0 and print it
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, nextline			# Print the nextline string
	syscall

	# Print the division equation

	li $v0, 1				# Get ready to print an integer
	move $a0, $t0				# Move the integer from t0 to a0 and print it
	syscall

	move $t0, $a0				# Move the integer back into t0 to use it again

	li $v0, 4				# Get ready to print a string
	la $a0, divide				# Print the division sign
	syscall

	li $v0, 1				# Get ready to print an integer
	move $a0, $t1				# Move the integer from t1 to a0 and print it
	syscall

	move $t1, $a0				# Move the integer back into t1

	li $v0, 4				# Get ready to print a string
	la $a0, equals				# Print the equals sign
	syscall

	li $v0, 1				# Get ready to print an integer
	mflo $a0				# Print the quotient
	syscall

	li $v0, 4				# Get ready to print a string
	la $a0, remainder			# Print the word "rem"
	syscall

	li $v0, 1				# Get ready to print an integer
	mfhi $a0				# Print the remainder value
	syscall
end:
	li $v0, 4				# Get ready to print a string
	la $a0, exitmessage			# Print the exit message
	syscall

	jr $ra					# Stop the program
BADN:
	li $v0, 4				# Get ready to print a string
	la $a0, errormessage			# Print the error message
	syscall

	jr $ra					# Exit the program
