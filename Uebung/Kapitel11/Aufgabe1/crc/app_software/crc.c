#include <stdio.h>
#include <time.h>

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

		if (enable == 1) {
			// calculate crc
			generator <<= 24;
			counter = 0;
			
			clock_t begin = clock();
			
			while (counter < 25) {
				// shift 25 times

				if (message & (1 << 31)) {
					// xor
					message ^= generator;
				}
				// shift
				counter++;
				message <<= 1;
			}
			
			clock_t end = clock();
			
			printf("\n computation time: %f", (double)(end - begin) / CLOCKS_PER_SEC);
			
			// output result
			printf("\nCRC Result: ");
			print_bin(message >> 25);
			printf("\n");
		} else {
			printf("\ninvalid generator polynom\n");
		}
	}

    return 0;
}