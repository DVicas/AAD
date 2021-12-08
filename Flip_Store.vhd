LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity Flip_Store is
	port (	clk : in std_logic;
				nRst	:	in std_logic;
				in1, in2, in3, in4 :	in	std_logic;
				out1, out2, out3, out4 : out std_logic
			);
end Flip_Store;

architecture structural of Flip_Store is 
	component flipFlopDPET is
		port (	clk 	: 	in std_logic;
					D		:	in std_logic;
					nRst 	:	in std_logic;
					Q		:	out	std_logic
				);
	end component;
begin
	ff1:	flipFlopDPET	port map (clk, in1, nRst, out1);
	ff2:	flipFlopDPET	port map (clk, in2, nRst, out2);
	ff3:	flipFlopDPET	port map (clk, in3, nRst, out3);
	ff4:	flipFlopDPET	port map (clk, in4, nRst, out4);
end structural;