LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter IS
	PORT (
		CLOCK_50	: IN	STD_LOGIC;
		HEX0		: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX1		: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0);
		HEX2		: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
END counter;

ARCHITECTURE behavior OF counter IS
COMPONENT htb	-- Hex to binary decoder
	PORT (
		input	: IN 	STD_LOGIC_VECTOR(3 DOWNTO 0);
		output	: OUT 	STD_LOGIC_VECTOR(6 DOWNTO 0)
		);
END COMPONENT;

SIGNAL clk		: STD_LOGIC;			-- Clock
SIGNAL count 	: STD_LOGIC_VECTOR(24 DOWNTO 0);	-- Counter
SIGNAL number0	: STD_LOGIC_VECTOR(3 DOWNTO 0);		-- Output number in hex0
SIGNAL number1	: STD_LOGIC_VECTOR(3 DOWNTO 0);		-- Output number in hex1
SIGNAL number2	: STD_LOGIC_VECTOR(3 DOWNTO 0);		-- Output number in hex2
SIGNAL output0	: STD_LOGIC_VECTOR(6 DOWNTO 0);		-- Output for the hex0 display
SIGNAL output1	: STD_LOGIC_VECTOR(6 DOWNTO 0);		-- Output for the hex1 display
SIGNAL output2	: STD_LOGIC_VECTOR(6 DOWNTO 0);		-- Output for the hex2 display

BEGIN
	clk <= CLOCK_50;
	HEX0 <= output0;
	HEX1 <= output1;
	HEX2 <= output2;

	Digit0: htb PORT MAP (number0, output0);
	Digit1: htb PORT MAP (number1, output1);
	Digit2: htb PORT MAP (number2, output2);
	
	PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN		-- Syncronize with the clock
			count <= count + 1;
		END IF;
	END PROCESS;

	PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN		-- Syncronize with the clock
			IF (count = "1111111111111111111111111") THEN 	-- Trigger the action to count
				IF (number0 = "1001") THEN 	-- Is the number grater then 9?
					number0 <= "0000"; -- reset it
					IF (number1 = "1001") THEN 	-- Is the number grater then 9?
						number1 <= "0000"; -- reset it
						IF (number2 = "1001") THEN 	-- Is the number grater then 9?
							number2 <= "0000"; -- reset it
						ELSE
							number2 <= number2 + 1; -- increase it
						END IF;
					ELSE
						number1 <= number1 + 1; -- increase it
					END IF;
				ELSE
					number0 <= number0 + 1; -- increase it
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behavior;