LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;


ENTITY Decoder IS 
	PORT( y : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
			m : OUT STD_LOGIC_VECTOR(10 DOWNTO 0));
			
END Decoder;

ARCHITECTURE structural OF Decoder IS
	
	SIGNAL iSig0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL iSig1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL iSig2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	COMPONENT gateXor2
		PORT(x0, x1 : IN STD_LOGIC;
			  y : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	
	-- P1 and P2 1st level equations 
	xor1_1 	: gateXor2 PORT MAP (y(0), y(6), iSig0(0)); 
	xor1_2 	: gateXor2 PORT MAP (y(7), y(10), iSig0(1));
	xor1_3 	: gateXor2 PORT MAP (y(1), y(2), iSig0(2));
	xor1_4 	: gateXor2 PORT MAP (y(8), y(11), iSig0(3));
	xor1_5 	: gateXor2 PORT MAP (y(3), y(4), iSig0(4));
	xor1_6 	: gateXor2 PORT MAP (y(9), y(12), iSig0(5));
	
	-- P3 and P4 1st level equations
	xor1_7 	: gateXor2 PORT MAP (y(5), y(8), iSig0(6)); 
	xor1_8 	: gateXor2 PORT MAP (y(9), y(10), iSig0(7));
	xor1_9 	: gateXor2 PORT MAP (y(1), y(3), iSig0(8));
	xor1_10 	: gateXor2 PORT MAP (y(6), y(13), iSig0(9));
	xor1_11 	: gateXor2 PORT MAP (y(2), y(4), iSig0(10));
	xor1_12 	: gateXor2 PORT MAP (y(7), y(14), iSig0(11));
	
	-- 2nd level equations P1 and P2
	xor2_1 : gateXor2 PORT MAP (iSig0(0), iSig0(1), iSig1(0)); 
	xor2_2 : gateXor2 PORT MAP (iSig0(2), iSig0(3), iSig1(1));
	xor2_3 : gateXor2 PORT MAP (iSig0(4), iSig0(5), iSig1(2));
	
	-- 2nd level equations P3 and P4
	xor2_4 : gateXor2 PORT MAP (iSig0(6), iSig0(7), iSig1(3));
	xor2_5 : gateXor2 PORT MAP (iSig0(8), iSig0(9), iSig1(4));
	xor2_6 : gateXor2 PORT MAP (iSig0(10), iSig0(11), iSig1(5));
	
	-- 3rd level
	xor3_1 : gateXor2 PORT MAP (iSig1(0), iSig1(1), iSig2(0));
	xor3_2 : gateXor2 PORT MAP (iSig1(0), iSig1(2), iSig2(1));
	
	xor3_3 : gateXor2 PORT MAP (iSig1(3), iSig1(4), iSig2(2));
	xor3_4 : gateXor2 PORT MAP (iSig1(3), iSig1(5), iSig2(3));
	
	
	
END structural;