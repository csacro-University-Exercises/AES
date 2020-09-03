#include <stdio.h>
#include <io.h>

#define CRC_BASE_ADDR 0x10003000

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
		// read in message and polynom
		counter = 0;
		printf("\nEnter a 32-bit long message: ");
		while (counter < 32) {
			c = getchar();
			if (c == '1' || c == '0') {
				message <<= 1;
				message += (c - '0');
				counter ++;
			}
		}
		print_bin(message);
		IOWR(CRC_BASE_ADDR, 0, message);

		// read in polynom with check for enable
		enable = 1;
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
		IOWR(CRC_BASE_ADDR, 1, generator);
		
		if (enable == 1) {
			// output result
			while(IORD(CRC_BASE_ADDR, 1));
			printf("\nCRC result:");
			print_bin(IORD(CRC_BASE_ADDR, 0));
		} else {
			printf("\ninvalid generator polynom\n");
			print_bin(IORD(CRC_BASE_ADDR, 1));
		}
	}

    return 0;
}