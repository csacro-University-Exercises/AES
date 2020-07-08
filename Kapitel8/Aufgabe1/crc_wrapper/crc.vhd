LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY crc IS
	PORT (input: IN STD_LOGIC_VECTOR(31 downto 0);
			output: OUT STD_LOGIC_VECTOR(6 downto 0);
			adr, wrt, reset: IN STD_LOGIC;
			clock: IN STD_LOGIC);
END crc;

ARCHITECTURE behavior OF crc IS

	SIGNAL clk, enable, do_xor: STD_LOGIC;
	SIGNAL counter: STD_LOGIC_VECTOR(4 downto 0);
	SIGNAL message: STD_LOGIC_VECTOR(31 downto 0);
	SIGNAL generator: STD_LOGIC_VECTOR(7 downto 0);
	
BEGIN
	clk <= clock;
	do_xor <= message(31);
	output <= message(31 downto 25);
	enable <= generator(0) AND generator(7);
	
	PROCESS (clk)
	BEGIN
		IF (rising_edge(clk)) THEN
			IF (reset = '1') THEN
			-- reset
				message <= "00000000000000000000000000000000";
				generator <= "00000000";
				counter <= "00000";
			ELSIF (wrt = '1') THEN
			-- read
				IF (adr = '0') THEN
				-- read in message
					message <= input;
				ELSIF (adr = '1') THEN
				-- read in generator ploynom
					generator <= input(7 downto 0);
				END IF;
			ELSIF (enable = '1') THEN
			-- calculate crc
				IF (counter = "11001") THEN
				-- shifted 25 times -> finish calc
					generator <= "00000000";
					counter <= "00000";
				ELSE
				-- continue calc
					counter <= counter + 1;
					IF (do_xor = '1') THEN
					-- xor before shift
						message(30 downto 24) <= message(30 downto 24) XOR generator(6 downto 0);
					END IF;
					-- shift
					message(31 downto 1) <= message(30 downto 0);
					message(0) <= '0';
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
END behavior;