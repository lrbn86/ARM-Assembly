/*

	This program returns a substring,
	using start index and end index, from an input string.
	
	This function will be called by a C file called main.c

*/

.data

out_string: .skip 256

null_terminator: .word 0x00 /* May not be needed ... */
.text
.global sub_string
.extern printf

sub_string:

	/* Code to extract the sub-string */

	// Parameters
	// r0 contains the first element of the char array
	// r1 contains the start_index
	// r2 contains the end_index

	/* int i = start_index */
	mov r4, r1

	/* int j = 0 */
	mov r5, #0

	// ldrb is used to load from input string
	// strb is used to store into output string

	// r3 will be used as a temporary variable
	// r6 will contain the address of the out_string 
	ldr r6, =out_string

	sub r3, r1, #1 /* r3 = start_index - 1 */

	ldrb r8, [r0, r3] /* r8 = in_string[start_index - 1] */

	strb r8, [r6, r5] /* out_string[j] = in_string[start_index - 1] */


	add r5, #1 /* j++ */

	forLoop:
		cmp r4, r2  /* Compare i and end_index */
		bge endLoop /* Terminate loop if i >=  end_index */	
		ldrb r8, [r0, r4] /* in_string[i] */
		strb r8, [r6, r5] /* out_string[j] = in_string[i] */
		add r4, #1 /* i++ */
		add r5, #1 /* j++ */
		b forLoop
	endLoop:
	
	// Add null terminator at end??
	// TODO Doing the below will simply append a 0.
	// Commenting out for now...
	//ldrb r8, =null_terminator
	//strb r8, [r6, r5]

	mov r0, r6	/* Return out_string */

	// r0 should contain the final substring result	
	
	/* Return control back to main*/
	bx lr

.end

