library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rom is 
	port (a		: 	in std_logic_vector(3 downto 0);
			state :	out std_logic_vector(7 downto 0)
			);
end rom;

architecture behavioral of rom is
	subtype ROM_WORD is STD_LOGIC_VECTOR (7 downto 0);

	type ROM_TABLE is array (15 downto 0) of ROM_WORD;
	
	signal s_state : ROM_TABLE;
	signal s_sel : integer;
	
begin
	process(s_sel, s_state,a)
	begin
	
	s_sel <= to_integer(unsigned(a));
	s_state <= (--"10000000",
--						 "01100000",
--						 "01010000",
--						 "01001000",
--						 "00110000",
--						 "00101000",
--						 "00011000",
--						 "01110000",
--						 "01101000",
--						 
--						 "01011000",
--						 "00111000",
--						 "01111000",
--						 "00000100",
--						 "00000101",
--						 "00000110",
--						 "00000111"
						"10000000",
						"00000111",
						"00000110",
						"00000101",
						"00000100",
						"01111000",
						"00111000",
						"01011000",
						"01101000",
						"01110000",
						"00011000",
						"00101000",
						"00110000",
						"01001000",
						"01010000",
						"01100000"
						);
						

						
	state <= s_state(s_sel);
	end process;
end behavioral;