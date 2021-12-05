library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is 
	Port ( 	a : in STD_LOGIC; 
				b : in STD_LOGIC; 
				c : out STD_LOGIC); 
end xor_2; 

architecture behavioral of xor_2 is 
begin

	c <= (a and not b) or (not a and b);
end behavioral;