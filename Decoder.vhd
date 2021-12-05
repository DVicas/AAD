LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY simpleLogic;
USE simpleLogic.all;


ENTITY Decoder IS 
	PORT( y : IN STD_LOGIC_VECTOR(14 DOWNTO 0);
			m : OUT STD_LOGIC_VECTOR(10 DOWNTO 0);
			tmp : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
			
END Decoder;

ARCHITECTURE structural OF Decoder IS
	
	SIGNAL iSig0 : STD_LOGIC_VECTOR(11 DOWNTO 0);
	SIGNAL iSig1 : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL iSig2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL corr  : STD_LOGIC_VECTOR(10 DOWNTO 0);
	
	COMPONENT gateXor2
		PORT(x0, x1 : IN STD_LOGIC;
			  y : OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT gateAnd4
		PORT(x0,x1,x2,x3 : IN STD_LOGIC;
			  y : OUT STD_LOGIC);
	END COMPONENT;
	
BEGIN
	
	-- P1 and P2 1st level equations 
	xor1_1 	: gateXor2 PORT MAP (y(14), y(8), iSig0(0)); 
	xor1_2 	: gateXor2 PORT MAP (y(7), y(4), iSig0(1));
	xor1_3 	: gateXor2 PORT MAP (y(13), y(12), iSig0(2));
	xor1_4 	: gateXor2 PORT MAP (y(6), y(3), iSig0(3));
	xor1_5 	: gateXor2 PORT MAP (y(11), y(10), iSig0(4));
	xor1_6 	: gateXor2 PORT MAP (y(5), y(2), iSig0(5));
	
	-- P3 and P4 1st level equations
	xor1_7 	: gateXor2 PORT MAP (y(9), y(6), iSig0(6)); 
	xor1_8 	: gateXor2 PORT MAP (y(5), y(4), iSig0(7));
	xor1_9 	: gateXor2 PORT MAP (y(13), y(11), iSig0(8));
	xor1_10 	: gateXor2 PORT MAP (y(8), y(1), iSig0(9));
	xor1_11 	: gateXor2 PORT MAP (y(12), y(10), iSig0(10));
	xor1_12 	: gateXor2 PORT MAP (y(7), y(0), iSig0(11));
	
	-- 2nd level equations P1 and P2
	xor2_1 : gateXor2 PORT MAP (iSig0(0), iSig0(1), iSig1(0)); 
	xor2_2 : gateXor2 PORT MAP (iSig0(2), iSig0(3), iSig1(1));
	xor2_3 : gateXor2 PORT MAP (iSig0(4), iSig0(5), iSig1(2));
	
	-- 2nd level equations P3 and P4
	xor2_4 : gateXor2 PORT MAP (iSig0(6), iSig0(7), iSig1(3));
	xor2_5 : gateXor2 PORT MAP (iSig0(8), iSig0(9), iSig1(4));
	xor2_6 : gateXor2 PORT MAP (iSig0(10), iSig0(11), iSig1(5));
	
	-- 3rd level
	xor3_1 : gateXor2 PORT MAP (iSig1(0), iSig1(1), iSig2(3)); --p1
	xor3_2 : gateXor2 PORT MAP (iSig1(0), iSig1(2), iSig2(2)); --p2
	
	xor3_3 : gateXor2 PORT MAP (iSig1(3), iSig1(4), iSig2(1)); --p3
	xor3_4 : gateXor2 PORT MAP (iSig1(3), iSig1(5), iSig2(0)); --p4
	
	tmp <= iSig2;
	
	-- bit 1 error
	and4_1  : gateAnd4 PORT MAP (iSig2(3), iSig2(2), not iSig2(1), not iSig2(0), corr(10));
	-- bit 2 error
	and4_2  : gateAnd4 PORT MAP (iSig2(3), not iSig2(2), iSig2(1), not iSig2(0), corr(9));
	-- bit 3 error
	and4_3  : gateAnd4 PORT MAP (iSig2(3), not iSig2(2), not iSig2(1), iSig2(0), corr(8));
	-- bit 4 error
	and4_4  : gateAnd4 PORT MAP (not iSig2(3), iSig2(2), iSig2(1), not iSig2(0), corr(7));
	-- bit 5 error
	and4_5  : gateAnd4 PORT MAP (not iSig2(3), iSig2(2), not iSig2(1), iSig2(0), corr(6));
	-- bit 6 error
	and4_6  : gateAnd4 PORT MAP (not iSig2(3), not iSig2(2), iSig2(1), iSig2(0), corr(5));
	-- bit 7 error
	and4_7  : gateAnd4 PORT MAP (iSig2(3), iSig2(2), iSig2(1), not iSig2(0), corr(4));
	-- bit 8 error
	and4_8  : gateAnd4 PORT MAP (iSig2(3), iSig2(2), not iSig2(1), iSig2(0), corr(3));
	-- bit 9 error
	and4_9  : gateAnd4 PORT MAP (iSig2(3), not iSig2(2), iSig2(1), iSig2(0), corr(2));
	-- bit 10 error
	and4_10 : gateAnd4 PORT MAP (not iSig2(3), iSig2(2), iSig2(1), iSig2(0), corr(1));
	-- bit 11 error
	and4_11 : gateAnd4 PORT MAP (iSig2(3), iSig2(2), iSig2(1), iSig2(0), corr(0));
	
	
	corr1  : gateXor2 PORT MAP (y(14) , corr(10), m(10));
	corr2  : gateXor2 PORT MAP (y(13) , corr(9), m(9));
	corr3  : gateXor2 PORT MAP (y(12) , corr(8), m(8));
	corr4  : gateXor2 PORT MAP (y(11) , corr(7), m(7));
	corr5  : gateXor2 PORT MAP (y(10) , corr(6), m(6));
	corr6  : gateXor2 PORT MAP (y(9) , corr(5), m(5));
	corr7  : gateXor2 PORT MAP (y(8) , corr(4), m(4));
	corr8  : gateXor2 PORT MAP (y(7) , corr(3), m(3));
	corr9  : gateXor2 PORT MAP (y(6) , corr(2), m(2));
	corr10 : gateXor2 PORT MAP (y(5) , corr(1), m(1));
	corr11 : gateXor2 PORT MAP (y(4) , corr(0), m(0));

	
	
END structural;