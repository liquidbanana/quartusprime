LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY lab7part3 IS

	PORT ( SW : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
	HEX0: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX1: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX2: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX3: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX4: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX5: OUT STD_LOGIC_VECTOR(0 TO 6));
	


END lab7part3;
ARCHITECTURE struct OF lab7part3 IS
	
	COMPONENT FULLADDER
	PORT (A, B, C: IN STD_LOGIC;
	S, C0: OUT STD_LOGIC);
	END COMPONENT;

	SIGNAL S3: STD_LOGIC;
	SIGNAL S2: STD_LOGIC;
	SIGNAL S1: STD_LOGIC;
	SIGNAL S0: STD_LOGIC;
	
	SIGNAL C1: STD_LOGIC;
	SIGNAL C2: STD_LOGIC;
	SIGNAL C3: STD_LOGIC;
	SIGNAL Cout: STD_LOGIC;
	
BEGIN	
	
	F0: FULLADDER PORT MAP(A => SW(4), B => SW(0), C => SW(8), S => S0, C0 => C1);
	F1: FULLADDER PORT MAP(A => SW(5), B => SW(1), C => C1, S => S1, C0 => C2);
	F2: FULLADDER PORT MAP(A => SW(6), B => SW(2), C => C2, S => S2, C0 => C3);
	F3: FULLADDER PORT MAP(A => SW(7), B => SW(3), C => C3, S => S3, C0 => Cout);

	HEX0(0) <= S0;
	HEX0(1) <='0';
	HEX0(2) <='0';
	HEX0(3) <= S0;
	HEX0(4) <= S0;
	HEX0(5) <= S0;
	HEX0(6) <='1';
	
	HEX1(0) <= S1;
	HEX1(1) <='0';
	HEX1(2) <='0';
	HEX1(3) <= S1;
	HEX1(4) <= S1;
	HEX1(5) <= S1;
	HEX1(6) <='1';
	
	
	HEX2(0) <= S2;
	HEX2(1) <='0';
	HEX2(2) <='0';
	HEX2(3) <= S2;
	HEX2(4) <= S2;
	HEX2(5) <= S2;
	HEX2(6) <='1';
	
	
	HEX3(0) <= S3;
	HEX3(1) <='0';
	HEX3(2) <='0';
	HEX3(3) <= S3;
	HEX3(4) <= S3;
	HEX3(5) <= S3;
	HEX3(6) <='1';
	
	
	HEX4(0) <= Cout;
	HEX4(1) <='0';
	HEX4(2) <='0';
	HEX4(3) <= Cout;
	HEX4(4) <= Cout;
	HEX4(5) <= Cout;
	HEX4(6) <='1';
	


END struct;
