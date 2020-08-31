#include <stdio.h>
#include <io.h>

void print_bin(unsigned int num) {
    if (num > 1) {
        print_bin(num/2);
    }
    printf("%d", num%2);
}

int main() {
    unsigned int message;
    unsigned int generator;
    char c;
	int counter;
	unsigned short enable;

	while (1) {
		enable = 1;
		// read in message and polynom
		counter = 0;
		printf("Enter a 32-bit long message: ");
		while (counter < 32) {
			c = getchar();
			if (c == '1' || c == '0') {
				message <<= 1;
				message += (c - '0');
				counter ++;
			}
		}
		print_bin(message);
		//IOWR(0, 0, message);

		// read in polynom with check for enable
		counter = 0;
		printf("\nEnter a 8-bit long generator polynom (first and last bit have to be '1'): ");
		while (counter < 8) {
			if ((c = getchar()) == '1' || c == '0') {
				if ((counter == 0 && c != '1') || (counter == 7 && c != '1')) {
					enable = 0;
				}
				generator <<= 1;
				generator += (c - '0');
				counter ++;
			}
		}
		print_bin(generator);
		//IOWR(0, 1, generator);
	}

    return 0;
}