LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY mux3bit IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 17);
			LEDR : OUT STD_LOGIC_VECTOR(0 to 17);
			LEDG : OUT STD_LOGIC_VECTOR(0 to 2));
END mux3bit;

ARCHITECTURE LogicFunction OF mux3bit IS
BEGIN
	LEDR <= SW;
	WITH SW(15 to 17) SELECT LEDG <= SW(0 to 2) WHEN "000",
												SW(3 to 5) WHEN "001",
												SW(6 to 8) WHEN "010",
												SW(9 to 11) WHEN "011",
												SW(12 to 14) WHEN "100",
												"000" WHEN OTHERS;
END LogicFunction;