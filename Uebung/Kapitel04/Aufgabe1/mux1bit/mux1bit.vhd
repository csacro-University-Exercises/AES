LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux1bit IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 2);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 0));
END mux1bit;

ARCHITECTURE LogicFunction OF mux1bit IS
BEGIN
	LEDR(0) <= SW(0) when SW(2) = '0' else SW(1);
END LogicFunction;