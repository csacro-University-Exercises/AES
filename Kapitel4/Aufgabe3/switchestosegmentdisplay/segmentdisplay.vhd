LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY segmentdisplay IS
	PORT (input : IN STD_LOGIC_VECTOR(0 to 3);
			output : OUT STD_LOGIC_VECTOR(0 to 6));
END segmentdisplay;

ARCHITECTURE LogicFunction OF segmentdisplay IS
BEGIN
	WITH input SELECT output <= "0000001" WHEN "0000",
										 "1001111" WHEN "0001",
										 "0010010" WHEN "0010",
										 "0000110" WHEN "0011",
										 "1001100" WHEN "0100",
										 "0100100" WHEN "0101",
										 "0100000" WHEN "0110",
										 "0001111" WHEN "0111",
										 "0000000" WHEN "1000",
										 "0000100" WHEN "1001",
										 "1111111" WHEN OTHERS;
END LogicFunction;