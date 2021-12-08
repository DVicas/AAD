LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY SimpleLogic;
USE SimpleLogic.all;


ENTITY Encoder_bitserial IS 
	PORT( m : IN STD_LOGIC;
			rst : in STD_LOGIC;
			clk : in STD_LOGIC;
			control_signals : out STD_LOGIC_VECTOR(7 downto 0);
			x : OUT STD_LOGIC;
			counterbits : out std_logic_vector(3 downto 0)
		  );
			
END Encoder_bitserial;

architecture structural of Encoder_bitserial is
	signal s_message, s_outmessage , s_clk, s_rst : std_logic;
	signal s_control : std_logic_vector(7 downto 0);
	signal s_xor1,s_xor2,s_xor3,s_xor4 : std_logic;
	signal s_flipxor1, s_flipxor2,s_flipxor3,s_flipxor4 : std_logic; 
	signal s_xorflip1, s_xorflip2,s_xorflip3,s_xorflip4 : std_logic;
	signal s_mux4 : std_logic;
	signal s_counterbits : std_logic_vector(3 downto 0);

	component xor_4 IS
	  PORT (	in1, in2, in3, in4 :	in	std_logic;
				in1_1, in2_2, in3_3, in4_4 :	in	std_logic;
				out1, out2, out3, out4 : out std_logic);
	END component;

	component And_4 IS
	  PORT 	(in1, in2, in3, in4 :	in	std_logic;
				 in1_1, in2_2, in3_3, in4_4 :	in	std_logic;
				 out1, out2, out3, out4 : out std_logic);
	END component;

	component Flip_Store is
		PORT (clk : in std_logic;
				nRst : in std_logic;
				in1,in2,in3,in4 : in std_logic;
				out1,out2,out3,out4 : out std_logic
				);
	end component;
	
	component mux_2to1 is
		port (SEL : in std_logic;
				A, B : in std_logic;
				X : out std_logic
				);
	end component;

	component mux_4to1 is
		Port (SEL 	  : in std_logic_vector(1 downto 0);
				A,B,C,D : in	std_logic;
				X 		  : out	std_logic
				);
	end component;

	component rom is
		port (a 			: in std_logic_vector(3 downto 0);
				control  : out std_logic_vector(7 downto 0)
				);
	end component;

	component control is
		port (clk : in std_logic;
				rst : in std_logic;
				state : out std_logic_vector(7 downto 0);
				counterbits : out std_logic_vector(3 downto 0)
				);
	end component;

begin

	control_unit : control port map(s_clk, s_rst, s_control, s_counterbits);
	
	andBundle: And_4 port map(s_message,s_message,s_message,s_message,s_control(6),s_control(5),s_control(4),s_control(3),s_xor1,s_xor2,s_xor3,s_xor4 );
	xorBundle: xor_4 port map(s_xor1,s_xor2,s_xor3,s_xor4,s_flipxor1,s_flipxor2,s_flipxor3,s_flipxor4,s_xorflip1,s_xorflip2,s_xorflip3,s_xorflip4 );
	flipBundle: Flip_Store port map(s_clk, not s_control(7), s_xorflip1,s_xorflip2,s_xorflip3,s_xorflip4,s_flipxor1,s_flipxor2,s_flipxor3,s_flipxor4);
	mux1st : mux_4to1 port map(s_control(1 downto 0), s_flipxor1,s_flipxor2,s_flipxor3,s_flipxor4, s_mux4);
	mux2nd : mux_2to1 port map(s_control(2), s_message, s_mux4, s_outmessage);
	
	
	s_rst <= rst;
	s_clk <= clk;
	s_message <= m;
	counterbits <= s_counterbits;
	control_signals <= s_control;
	x <= s_outmessage;

end structural;
	
