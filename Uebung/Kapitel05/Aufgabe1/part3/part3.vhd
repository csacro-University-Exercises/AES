LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part3 IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 1);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 0)
			);
END part3;

ARCHITECTURE Structure OF part3 IS
	COMPONENT d_flipflop
		port (clk, d : IN STD_LOGIC;
				q : OUT STD_LOGIC);
	END COMPONENT;
BEGIN
	dff: d_flipflop port map (SW(1), SW(0), LEDR(0));
END Structure;