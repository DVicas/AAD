LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY flipFlopDPET IS
  PORT (clk, D: IN STD_LOGIC;
        nRst: IN STD_LOGIC;
        Q, nQ : OUT STD_LOGIC);
END flipFlopDPET;

ARCHITECTURE behavior OF flipFlopDPET IS
BEGIN
  PROCESS (clk, nRst)
  BEGIN
    IF (nRst = '0')
	    THEN 
				Q <= '0';
				nQ <= '1';
	    ELSIF (clk = '1') AND (clk'EVENT)
	        THEN 
					 Q <= D;
					 nQ <= not D;
	 END IF;
  END PROCESS;
END behavior;