LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY crc_codesign IS
	PORT (CLOCK_50 : IN STD_LOGIC;
			KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
			LEDR: OUT STD_LOGIC_VECTOR(6 downto 0);
			DRAM_ADDR  : OUT   STD_LOGIC_VECTOR(12 DOWNTO 0);
			DRAM_BA    : OUT   STD_LOGIC_VECTOR( 1 DOWNTO 0);
			DRAM_CAS_N, DRAM_CKE, DRAM_CS_N : OUT   STD_LOGIC;
			DRAM_DQ 	  : INOUT STD_LOGIC_VECTOR(31 DOWNTO 0);
			DRAM_DQM   : OUT   STD_LOGIC_VECTOR ( 3 DOWNTO 0);
			DRAM_CLK, DRAM_RAS_N, DRAM_WE_N   : OUT   STD_LOGIC
			);
END crc_codesign;

ARCHITECTURE Structure OF crc_codesign IS
	COMPONENT embedded_system IS
        PORT (
            crc_out_readdata : out   std_logic_vector(6 downto 0);
            sdram_wire_addr  : out   std_logic_vector(12 downto 0); 
            sdram_wire_ba    : out   std_logic_vector(1 downto 0); 
            sdram_wire_cas_n : out   std_logic; 
            sdram_wire_cke   : out   std_logic; 
            sdram_wire_cs_n  : out   std_logic;
            sdram_wire_dq    : inout std_logic_vector(31 downto 0);
            sdram_wire_dqm   : out   std_logic_vector(3 downto 0);
            sdram_wire_ras_n : out   std_logic;
            sdram_wire_we_n  : out   std_logic;
            clk_clk          : in    std_logic;
            reset_reset      : in    std_logic;
            sdram_clk_clk    : out   std_logic
        );
    END COMPONENT embedded_system;
	
BEGIN
	U0: embedded_system PORT MAP (
            crc_out_readdata => LEDR,
            sdram_wire_addr  => DRAM_ADDR,
            sdram_wire_ba    => DRAM_BA,
            sdram_wire_cas_n => DRAM_CAS_N,
            sdram_wire_cke   => DRAM_CKE,
            sdram_wire_cs_n  => DRAM_CS_N,
            sdram_wire_dq    => DRAM_DQ,
            sdram_wire_dqm   => DRAM_DQM,
            sdram_wire_ras_n => DRAM_RAS_N,
            sdram_wire_we_n  => DRAM_WE_N,
            clk_clk          => CLOCK_50,
            reset_reset      => KEY(0),
            sdram_clk_clk    => DRAM_CLK
        );
END Structure;
