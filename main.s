/*

	This program calls a function from a C file to return 
	a substring, using start index and end index, from input string.

	This program will call the function from a C file called sub_string.c

*/

.data

/* Data declarations as necessary */
str1: .asciz "Enter a string: "
str2: .asciz "Enter the start index: "
str3: .asciz "Enter the end index: "
str4: .asciz "Publication"

/* Input variables */
str_input: .skip 256
start_input: .skip 256
end_input: .skip 256


format_str: .asciz "%[^\n]%*c" /* Use this format for strings */
format_int: .asciz "%d" /* Use this format for integers */
output: .asciz "The substring of the given string is \'%s\'\n"

.text
.global main /* Make 'main' available to linker */

/* Use C functions for I/O */
.extern printf
.extern scanf

main:

	/* Ask for string */
	ldr r0, =str1
	bl printf
	ldr r0, =format_str /* Load address of format into r0 */
	ldr r1, =str_input /* Load address of str_input into r1 */
	bl scanf /* Branch to scanf function, which uses r0 and r1 as parameters */
	ldr r4, =str_input

	/* Ask for start index */
	ldr r0, =str2 
	bl printf
	ldr r0, =format_int /* Load address of format_int into r0 */
	ldr r1, =start_input /* Load address of start_input into r1 */
	bl scanf /* Branch to scanf function, which uses r0 and r1 as parameters */
	ldr r5, =start_input /* Load address of start_input into r5 */
	

	/* Ask for end index */
	ldr r0, =str3
	bl printf
	ldr r0, =format_int /* Load address of format_int into r0 */
	ldr r1, =end_input /* Load address of end_input into r1 */
	bl scanf /* Branch to scanf function, which uses r0 and r1 as parameters */
	ldr r6, =end_input /* Load addresss of start_input into r6 */

	// r0 should contain string to be substringed
	// r1 should contain start_index
	// r2 should contain end_index
	// then bl to sub_string
	mov r0, r4 /* Move value of r4 into r0 */
	ldr r1, [r5] /* Load address of r5 to r1 */
	ldr r2, [r6] /* Load address of r6 to r2 */
	bl sub_string /* r0, r1, r2 will be used as parameters */
	
	mov r1, r0 /* Move value of r0 into r1 */
	ldr r0, =output /* Load address of output into r0 */
	bl printf /* r0, r1 will be used as parameters to print */

	/* Terminate program */
	swi 0
	mov r7, #1
	swi 0
