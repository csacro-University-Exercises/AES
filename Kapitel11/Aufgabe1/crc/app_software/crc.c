#include <stdio.h>
#include <stdlib.h>

void print_bin(unsigned int num) {
    if (num > 1) {
        print_bin(num/2);
    }
    printf("%d", num%2);
}

int main() {
    unsigned int message;
    unsigned int generator;
    char buf[32];
    char *dummy;

	while (1) {
		// read in message and polynom
		do {
		printf("Enter a 32-bit long message: ");
		} while (scanf("%32s", buf) != 1);
		message = strtol(buf, &dummy, 2);

		// read in polynom with check for enable
		do {
		printf("Enter a 8-bit long generator polynom (first and last bit have to be '1'): ");
		} while (scanf("%8s", buf) != 1 || buf[0] != '1' || buf[7] != '1');
		generator = strtol(buf, &dummy, 2);
		generator <<= 24;

		// calculate crc
		int counter = 0;
		while (counter < 25) {
			// shift 25 times

			if (message & (1 << 31)) {
				// xor
				message ^= generator;
			} else {
				// shift
				counter++;
				message <<= 1;
			}
		}

		// output result
		printf("CRC Result: ");
		print_bin(message >> 25);
		printf("\n");
	}

    return 0;
}