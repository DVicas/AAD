LIBRARY ieee;
USE ieee.std_logic_1164.all;


LIBRARY SimpleLogic;
USE SimpleLogic.all;


entity And_4 is
	port (
				in1, in2, in3, in4 :	in	std_logic;
				in1_1, in2_2, in3_3, in4_4 :	in	std_logic;
				out1, out2, out3, out4 : out std_logic
			);
end And_4;

architecture Structural of And_4 is

component gateAnd2 IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END component;
begin
	and1 : gateAnd2 port map (in1,in1_1,out1);
	and2 : gateAnd2 port map (in2,in2_2,out2);
	and3 : gateAnd2 port map (in3,in3_3,out3);
	and4 : gateAnd2 port map (in4,in4_4,out4);
	
end Structural;
