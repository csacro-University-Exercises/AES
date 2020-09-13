LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part2 IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 1);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 0)
			);
END part2;

ARCHITECTURE Structure OF part2 IS
	COMPONENT d_latch
		port (Clk, D : IN STD_LOGIC;
				Q : OUT STD_LOGIC);
	END COMPONENT;
BEGIN
	dl: d_latch port map (SW(1), SW(0), LEDR(0));
END Structure;