/*
	Program:	hackme.s
	Author:		Kelvin Lai
	Date:		ver 1.0
	Description:	A simple program in GNU Assembler(GAS) to demonstrate injection attack
	
	Step 1 Compile:	as -o hackme.o hackme.s
	Step 2 Link:	ld -o hackme hackme.o
	Step 3 Run:	./hackme
*/

.global _start				# .global SECTION DECLARATION
					# This informs the ELF linker/loader, where is the entry point
					# (Default: _start). An entry point is where the program begins.
					# Can be overridden with -e option of the ld command:
					#	ld -e <LABEL> hackme.s

.text					# .text SECTION DECLARATION
_start:					# _start Label
	####################################
	# syscall - write(1, prompt, plen); 
	####################################
	mov	$1, %rax		# Assign syscall operation to rax register. 0 = read, 1 = write
	mov	$1, %rdi		# Register Destination Index, rdi with 0 = stdin or 1 = stdout
	mov	$prompt, %rsi		# Register Source Index, rsi with "prompt" message
	mov	$plen, %rdx		# length of message
	syscall				# invoke syscall

	####################################
	# syscall - read(0, name, 10);
	####################################
	mov	$0, %rax		# read input and assign to the label "name"
	mov	$0, %rdi		
	mov	$name, %rsi
	mov	$10, %rdx
	syscall

	mov	$1, %rax		# Displays "greet1" message
	mov	$1, %rdi
	mov	$greet1, %rsi
	mov	$glen, %rdx
	syscall

	mov	$1, %rax		# Write "name" that was read above, to stdout.
	mov	$1, %rdi
	mov	$name, %rsi
	mov	$10, %rdx
	syscall

	mov	$1, %rax		# Display a final message
	mov	$1, %rdi
	mov	$greet2, %rsi
	mov	$g2len, %rdx
	syscall

	####################################
	# syscall - _exit(0)
	####################################
	mov	$60, %rax		# exit
	mov	$0, %rdi		# return code
	syscall

.data					# .data SECTION DECLARATION
prompt:					# Label declaration
	.ascii	"Name: "		# Assign string "Name: " to label "prompt"
	plen	= . - prompt		# ". - prompt" will calculate the length "prompt"

greet1:
	.ascii	"Hello "
	glen	= . - greet1

greet2:
	.ascii	"\nNow watch me hack you!!!\n\n"
	g2len	= . - greet2

name:
	.ascii	"          "		# Assign an initial 10 character string
