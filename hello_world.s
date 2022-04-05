	.global _start		# declare entrypoint using global symbol

	.text

_start:				# _start Label
	mov $1, %rax		# syscall 1 = write, 0 = read
	mov $1, %rdi		# file handle 1 = stdout, 0 = stdin
	mov $message, %rsi
	mov $len, %rdx		# length of message
	syscall

	mov $60, %rax		# exit
	mov $0, %rdi		# return code
	syscall

message:
	.ascii	"Hello, World!\n"
	len	= . - message

