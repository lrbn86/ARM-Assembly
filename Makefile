asm2c: main.s sub_string.c
	gcc -g -o asm2c main.s sub_string.c
clean:
	rm -f asm2c
