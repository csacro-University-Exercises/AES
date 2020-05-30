LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_latch IS
	PORT (Clk, D : IN STD_LOGIC;
			Q : OUT STD_LOGIC);
END d_latch;

ARCHITECTURE Structural OF d_latch IS
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