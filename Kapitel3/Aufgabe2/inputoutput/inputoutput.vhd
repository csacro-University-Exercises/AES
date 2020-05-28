LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY inputoutput IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 17);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 17));
END inputoutput;

ARCHITECTURE LogicFunction OF inputoutput IS
BEGIN
	LEDR <= SW;
END LogicFunction;