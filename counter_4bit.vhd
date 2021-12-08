LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity counter_4bit is
	port(	clk: in std_logic;
			nRst: in std_logic;
			counterout: out std_logic_vector(3 downto 0));
end counter_4bit;
architecture structural of counter_4bit is

component flipFlopDPET is
	port (clk, D: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        Q, nQ: OUT STD_LOGIC);
end component;

signal s_Q1, S_Q2, S_Q3, S_Q4 : STD_LOGIC;
begin
	ffD1: flipFlopDPET port map (clk,S_Q1,nRst,counterout(0),s_Q1);
	ffD2: flipFlopDPET port map (s_Q1,S_Q2,nRst,counterout(1),S_Q2);
	ffD3: flipFlopDPET port map (s_Q2,S_Q3,nRst,counterout(2),S_Q3);
	ffD4: flipFlopDPET port map (s_Q3,S_Q4,nRst,counterout(3),S_Q4);
end structural;