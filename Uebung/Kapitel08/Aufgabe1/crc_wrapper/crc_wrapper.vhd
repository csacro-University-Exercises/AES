LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

ENTITY crc_wrapper IS
	PORT (CLOCK_50: IN STD_LOGIC;
			LEDR: OUT STD_LOGIC_VECTOR(6 downto 0);
			SW: IN STD_LOGIC_VECTOR(17 downto 0));
END crc_wrapper;

ARCHITECTURE behavior OF crc_wrapper IS
COMPONENT crc
	PORT (input: IN STD_LOGIC_VECTOR(31 downto 0);
			output: OUT STD_LOGIC_VECTOR(6 downto 0);
			adr, wrt, reset: IN STD_LOGIC;
			clock: IN STD_LOGIC);
END COMPONENT;

SIGNAL message: STD_LOGIC_VECTOR(31 downto 0);
SIGNAL part: STD_LOGIC_VECTOR(1 downto 0);
SIGNAL input: STD_LOGIC_VECTOR(7 downto 0);
SIGNAL clk, reset, wrt, adr: STD_LOGIC;

BEGIN
	clk <= CLOCK_50;
	input <= SW(7 downto 0);
	part <= SW(11 downto 10);
	reset <= SW(17);
	wrt <= SW(16);
	adr <= SW(15);
	
	crc_checker: crc PORT MAP (message, LEDR, adr, wrt, reset, clk);
	
	PROCESS (clk)
	BEGIN
		IF (falling_edge(clk)) THEN
			IF (reset = '1') THEN
				message <= "00000000000000000000000000000000";
			ELSIF (wrt = '1') THEN
				IF (adr = '0') THEN
					CASE part IS
						WHEN "00" => message(7 downto 0) <= input;
						WHEN "01" => message(15 downto 8) <= input;
						WHEN "10" => message(23 downto 16) <= input;
						WHEN "11" => message(31 downto 24) <= input;
					END CASE;
				ELSIF (adr = '1') THEN
					message <= "00000000000000000000000000000000";
					message(7 downto 0) <= input;
				END IF;
			END IF;
		END IF;
	END PROCESS;
				
END behavior;