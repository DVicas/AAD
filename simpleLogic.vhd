LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd2 IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateAnd2;


ARCHITECTURE logicFunction OF gateAnd2 IS
BEGIN
  y <= x0 AND x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateAnd4 IS
	PORT (x0, x1, x2, x3 : IN STD_LOGIC;
			y : OUT STD_LOGIC);
END gateAnd4;

ARCHITECTURE logicFunction OF gateAnd4 IS
BEGIN
	y <= x0 and x1 and x2 and x3;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
			
ENTITY gateOr2 IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateOr2;

ARCHITECTURE logicFunction OF gateOr2 IS
BEGIN
  y <= x0 OR x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY gateXOr2 IS
  PORT (x0, x1: IN STD_LOGIC;
        y: OUT STD_LOGIC);
END gateXOr2;

ARCHITECTURE logicFunction OF gateXOr2 IS
BEGIN
  y <= x0 XOR x1;
END logicFunction;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_2to1 is
    Port ( SEL : in  STD_LOGIC;
           A , B  : in  STD_LOGIC;
           X   : out STD_LOGIC);
end mux_2to1;

architecture Behavioral of mux_2to1 is
begin
    X <= A when (SEL = '0') else B;
end Behavioral;

LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux_4to1 is
    Port ( SEL 		: in  STD_LOGIC_VECTOR(1 downto 0);
           A,B,C,D   : in  STD_LOGIC;
           X   		: out STD_LOGIC);
end mux_4to1;

architecture Behavioral of mux_4to1 is
begin
process(A,B,C,D,SEL) is
begin
   if (SEL = "00") then
		X<= A;
	elsif (SEL = "01") then
		X<= B;
	elsif (SEL = "10") then
		X<= C;
	else
		X<= D;
	end if;
end process;
end Behavioral;
