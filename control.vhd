LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity control is 
	port (clk	:	in std_logic;
			rst 	:	in std_logic;
			state :	out std_logic_vector(7 downto 0);
			counterbits : out std_logic_vector(3 downto 0)
			);
end control;

architecture structural of control is 
signal s_counter : std_logic_vector(3 downto 0);
signal s_clk : std_logic;

component counter_4bit is 
	port (clk 		: in std_logic;
			nRst 		: in std_logic;
			counterout : out std_logic_vector(3 downto 0)
			);
end component;

component rom is
	port	(a : in std_logic_vector(3 downto 0);
			 state : out std_logic_vector(7 downto 0)
			);
end component;

begin
	s_clk <= clk;
	
	counter : counter_4bit port map (s_clk, rst, s_counter);
	rom1 : rom port map(s_counter, state);
	
	counterbits <= s_counter;
end structural;
