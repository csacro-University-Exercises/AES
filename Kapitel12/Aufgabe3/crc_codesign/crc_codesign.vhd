LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crc_codesign IS
	PORT (CLOCK_50 : IN STD_LOGIC;
			KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			LEDR: OUT STD_LOGIC_VECTOR(6 downto 0));
END crc_codesign;

ARCHITECTURE Structure OF crc_codesign IS
	COMPONENT embedded_system IS
		PORT (clk_clk : IN STD_LOGIC;
				resetn_reset_n : IN STD_LOGIC;
				crc_out_readdata: OUT STD_LOGIC_VECTOR (6 DOWNTO 0) );
	END COMPONENT embedded_system;
	
BEGIN
	U0: embedded_system PORT MAP (clk_clk => CLOCK_50,
											resetn_reset_n => KEY(0),
											crc_out_readdata => LEDR );
END Structure;