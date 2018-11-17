#include <stdlib.h>
#include <stdio.h>
char* sub_string(char *in_string, int start_index, int end_index) {
	char *out_string = malloc(400);
	int i, j = 0;
	out_string[j] = in_string[start_index-1];
	j++;
	for (i = start_index; i < end_index; i++, j++) {
		out_string[j] = in_string[i];
	}
	out_string[i] = '\0';
	return out_string;
}
