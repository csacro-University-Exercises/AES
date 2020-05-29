LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY fulladder IS
	PORT (a, b, ci : IN STD_LOGIC;
			s, co : OUT STD_LOGIC);
END fulladder;

ARCHITECTURE LogicFunction OF fulladder IS
BEGIN
	s <= a XOR b XOR ci;
	co <= (ci AND (a XOR b)) OR (a AND b);
END LogicFunction;