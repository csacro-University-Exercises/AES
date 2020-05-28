LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inputANDoutput IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 17);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 17));
END inputANDoutput;

ARCHITECTURE LogicFunction OF inputANDoutput IS
BEGIN
	LEDR(0 to 8) <= SW(0 to 8) AND SW(9 to 17);
	LEDR(9 to 17) <= SW(9 to 17) AND SW(0 to 8);
END LogicFunction;