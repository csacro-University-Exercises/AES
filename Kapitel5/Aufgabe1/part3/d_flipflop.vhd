LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY d_flipflop IS
	PORT (clk, d : IN STD_LOGIC;
			q : OUT STD_LOGIC
			);
END d_flipflop;

ARCHITECTURE Structure OF d_flipflop IS
	COMPONENT d_latch
		port (Clk, D : IN STD_LOGIC;
				Q : OUT STD_LOGIC);
	END COMPONENT;
	
	signal qm, negClk: STD_LOGIC;
	ATTRIBUTE KEEP : BOOLEAN;
	ATTRIBUTE KEEP OF qm, negClk : SIGNAL IS TRUE;
BEGIN
	negClk <= NOT clk;
	master: d_latch port map (negClk, d, qm);
	slave: d_latch port map (clk, qm, q);
END Structure;