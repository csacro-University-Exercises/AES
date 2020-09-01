LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crc_avalon_interface IS
	PORT (clock, resetn : IN STD_LOGIC;
			read, write, chipselect : IN STD_LOGIC;
			writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			address : IN STD_LOGIC;
			readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			Q_export : OUT STD_LOGIC_VECTOR(31 DOWNTO 0) );
END crc_avalon_interface;

ARCHITECTURE Structure OF crc_avalon_interface IS
	SIGNAL local_address : STD_LOGIC;
	SIGNAL to_reg : STD_LOGIC_VECTOR(31 DOWNTO 0);
	SIGNAL from_reg : STD_LOGIC_VECTOR(31 downto 0);

	COMPONENT crc
		PORT (input: IN STD_LOGIC_VECTOR(31 downto 0);
				output: OUT STD_LOGIC_VECTOR(7 downto 0);
				adr, wrt, reset: IN STD_LOGIC;
				clk: IN STD_LOGIC);
	END COMPONENT;
BEGIN
	to_reg <= writedata;
	WITH (chipselect AND (WRITE OR READ)) SELECT
		local_address <= address WHEN '1', '0' WHEN OTHERS;
	crc_instance: crc PORT MAP (to_reg, from_reg, local_address, write, NOT resetn, clock);	
	readdata <= from_reg;
	Q_export <= from_reg;
END Structure;