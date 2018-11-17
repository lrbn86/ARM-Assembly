#include <stdio.h>
#include <stdlib.h>

char* sub_string(char *in_string, int start_index, int end_index);

int main() {
	
	int start_index, end_index;
	
	char *in_string = malloc(256);
	
	char *out_string; 
	
	/* Code to receive inputs from user */
	printf("Enter a string: ");
	scanf("%[^\n]%*c", in_string);
	
	printf("Enter the start index: ");
	scanf("%d", &start_index);

	printf("Enter the end index: ");
	scanf("%d", &end_index);
	
	/* Code to print the sub-string */
	out_string = sub_string(in_string, start_index, end_index);
	printf("The substring of the given string is \'%s\'\n", out_string);
	
	return 0;

}
