LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY switchestosegmentdisplay IS
	PORT (SW : IN STD_LOGIC_VECTOR(0 to 3);
			HEX0 : OUT STD_LOGIC_VECTOR(0 to 6));
END switchestosegmentdisplay;

ARCHITECTURE Structure OF switchestosegmentdisplay IS
	COMPONENT segmentdisplay
		port (input: IN STD_LOGIC_VECTOR(0 to 3);
				output: OUT STD_LOGIC_VECTOR(0 to 6));
	END COMPONENT;
BEGIN
	SEG: segmentdisplay port map (SW, HEX0);
END Structure;