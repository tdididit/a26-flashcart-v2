----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:54:53 09/21/2018 
-- Design Name: 
-- Module Name:    top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top is
    Port ( atari_a0 : in  STD_LOGIC;
           atari_a1 : in  STD_LOGIC;
           atari_a2 : in  STD_LOGIC;
           atari_a3 : in  STD_LOGIC;
           atari_a4 : in  STD_LOGIC;
           atari_a5 : in  STD_LOGIC;
           atari_a6 : in  STD_LOGIC;
           atari_a7 : in  STD_LOGIC;
           atari_a8 : in  STD_LOGIC;
           atari_a9 : in  STD_LOGIC;
           atari_a10 : in  STD_LOGIC;
           atari_a11 : in  STD_LOGIC;			  
           atari_a12 : in  STD_LOGIC;
			  
           rom_a12 : out  STD_LOGIC;
           rom_a13 : out  STD_LOGIC;
           rom_a14 : out  STD_LOGIC;
           rom_a15 : out  STD_LOGIC;
           rom_a16 : out  STD_LOGIC;
           rom_a17 : out  STD_LOGIC;
           rom_a18 : out  STD_LOGIC;
           rom_n_ce : out  STD_LOGIC;
           rom_n_oe : out  STD_LOGIC;
           rom_n_we : out  STD_LOGIC;
			  
			  clk_in : in	STD_LOGIC;
			  clk_out : out	STD_LOGIC;
			  mode : in	STD_LOGIC);
end top;

architecture Behavioral of top is
    Signal bank_a12 : STD_LOGIC;
    Signal bank_a13 : STD_LOGIC;
    Signal bank_a14 : STD_LOGIC;
    Signal bank_a15 : STD_LOGIC;
    Signal bank_a16 : STD_LOGIC;
    Signal bank_a17 : STD_LOGIC;
    Signal bank_a18 : STD_LOGIC;
	 
begin

process (clk_in, atari_a12, atari_a11, atari_a10, atari_a9, atari_a8, atari_a7, 
			atari_a6, atari_a5, atari_a4, atari_a3, atari_a2, atari_a1, atari_a0, 
			bank_a12, bank_a13, bank_a14, bank_a15, bank_a16, bank_a17, bank_a18)
begin
	rom_a18 <= '0';
	rom_a17 <= '0';
	rom_a16 <= '0';
	rom_a15 <= NOT mode;
	rom_a14 <= bank_a14;
	rom_a13 <= bank_a13;
	rom_a12 <= bank_a12;
	
	rom_n_we <= '1';
	rom_n_ce <= NOT atari_a12;
	rom_n_oe <= '0';
	
	clk_out <= ((atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND atari_a3 AND atari_a2 AND (NOT atari_a1) AND (NOT atari_a0)) OR
-- 1FFC					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND (NOT atari_a1) AND (NOT atari_a0)) OR
-- 1FF4					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND (NOT atari_a1) AND atari_a0) OR
-- 1FF5					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND atari_a1 AND (NOT atari_a0)) OR
-- 1FF6					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND atari_a1 AND atari_a0) OR
-- 1FF7					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND (NOT atari_a1) AND (NOT atari_a0)) OR
-- 1FF8					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND (NOT atari_a1) AND atari_a0) OR
-- 1FF9					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND (NOT atari_a0)) OR
-- 1FFA					
					(atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
					atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND atari_a0)
-- 1FFB					
	);
						
	IF (rising_edge(clk_in)) THEN
--		bank_a18 <= '0';
--		bank_a17 <= '0';
--		bank_a16 <= '0';
--		bank_a15 <= mode;
		
		bank_a14 <= ((atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND (NOT atari_a1) AND (NOT atari_a0)) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND (NOT atari_a1) AND atari_a0) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND (NOT atari_a0)) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND atari_a0)
		);
		bank_a13 <= ((atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND atari_a1 AND (NOT atari_a0)) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND atari_a1 AND atari_a0) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND (NOT atari_a0)) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND atari_a0)
		);
		bank_a12 <= ((atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND (NOT atari_a1) AND atari_a0) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND (NOT atari_a3) AND atari_a2 AND atari_a1 AND atari_a0) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND (NOT atari_a1) AND atari_a0) OR
						 (atari_a12 AND atari_a11 AND atari_a10 AND atari_a9 AND atari_a8 AND atari_a7 AND atari_a6 AND 
						 atari_a5 AND atari_a4 AND atari_a3 AND (NOT atari_a2) AND atari_a1 AND atari_a0)
		);
		
	END IF;
	
end process;

end Behavioral;

