LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY part2 IS
	PORT (Clk, D : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
END part2;

ARCHITECTURE Structural OF part2 IS
	SIGNAL S, R, R_g, S_g, Qa, Qb : STD_LOGIC ;
	ATTRIBUTE KEEP : BOOLEAN;
	ATTRIBUTE KEEP OF R, R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN
	R <= NOT D;
	S <= D;
	R_g <= NOT (R AND Clk);
	S_g <= NOT (S AND Clk);
	Qb <= NOT (R_g AND Qa);
	Qa <= NOT (S_g AND Qb);
	Q <= Qa;
END Structural;