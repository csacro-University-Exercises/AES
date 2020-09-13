LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY counter IS
	PORT (
		CLOCK_50	: IN	STD_LOGIC;
		HEX0		: OUT	STD_LOGIC_VECTOR(6 DOWNTO 0)
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
SIGNAL number	: STD_LOGIC_VECTOR(3 DOWNTO 0);		-- Output number in hex
SIGNAL output	: STD_LOGIC_VECTOR(6 DOWNTO 0);		-- Output for the hex display

BEGIN
	clk <= CLOCK_50;
	HEX0 <= output;

	Digit0: htb PORT MAP (number, output);
	
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
				IF (number = "1001") THEN 	-- Is the number grater then 9?
					number <= "0000"; -- reset it
				ELSE
					number <= number + 1; -- increase it
				END IF;
			END IF;
		END IF;
	END PROCESS;
END behavior;