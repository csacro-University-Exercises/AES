LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux8bit IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 17);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 17);
			LEDG : OUT STD_LOGIC_VECTOR(0 to 7));
END mux8bit;

ARCHITECTURE LogicFunction OF mux8bit IS
BEGIN
	LEDR <= SW;
	LEDG <= SW(0 to 7) when SW(17) = '0' else SW(8 to 15);
END LogicFunction;