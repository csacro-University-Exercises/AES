LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY carryrippleadder IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 8);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 8);
			LEDG : OUT STD_LOGIC_VECTOR(0 to 4)
			);
END carryrippleadder;

ARCHITECTURE Structure OF carryrippleadder IS
	COMPONENT fulladder
		port (a, b, ci : IN STD_LOGIC;
			s, co : OUT STD_LOGIC);
	END COMPONENT;
	
	signal c: std_LOGIC_VECTOR(0 to 2);
BEGIN
	LEDR <= SW;
	bit0: fulladder port map (SW(0), SW(4), SW(8), LEDG(0), c(0));
	bit1: fulladder port map (SW(1), SW(5), c(0), LEDG(1), c(1));
	bit2: fulladder port map (SW(2), SW(6), c(1), LEDG(2), c(2));
	bit3: fulladder port map (SW(3), SW(7), c(2), LEDG(3), LEDG(4));
END Structure;