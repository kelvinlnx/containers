	.global _start		# declare entrypoint using global symbol

	.text

_start:				# _start Label
	mov $1, %rax		# Greeting Prompt
	mov $1, %rdi		# "Name: "
	mov $prompt, %rsi
	mov $plen, %rdx		# length of message
	syscall

	mov $0, %rax		# Read from stdin
	mov $0, %rdi		# file handle 1 = stdout, 0 = stdin
	mov $name, %rsi
	mov $10, %rdx		# length of message
	syscall

	mov $1, %rax		# syscall 1 = write, 0 = read
	mov $1, %rdi		# file handle 1 = stdout, 0 = stdin
	mov $greet1, %rsi
	mov $glen, %rdx		# length of message
	syscall

	mov $1, %rax		# syscall 1 = write, 0 = read
	mov $1, %rdi		# file handle 1 = stdout, 0 = stdin
	mov $name, %rsi
	mov $10, %rdx		# length of message
	syscall

	mov $1, %rax		# syscall 1 = write, 0 = read
	mov $1, %rdi		# file handle 1 = stdout, 0 = stdin
	mov $greet2, %rsi
	mov $g2len, %rdx		# length of message
	syscall

	mov $60, %rax		# exit
	mov $0, %rdi		# return code
	syscall

	.data
prompt:
	.ascii "Name: "
	plen	= . - prompt

greet1:
	.ascii "Hello "
	glen	= . - greet1

greet2:
	.ascii "\nNow watch me hack you!!!\n\n"
	g2len	= . - greet2

name:
	.ascii	"          "
