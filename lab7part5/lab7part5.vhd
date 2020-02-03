LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE IEEE.NUMERIC_STD.ALL;


ENTITY LAB7PART5 IS
	PORT (SW: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	LEDR: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
	HEX0: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX1: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX3: OUT STD_LOGIC_VECTOR(0 TO 6);
	HEX5: OUT STD_LOGIC_VECTOR(0 TO 6));
END LAB7PART5;



ARCHITECTURE STRUCT OF LAB7PART5 IS

COMPONENT DECODER IS
	PORT (A,B,C,D: IN STD_LOGIC;
	HEXDISPLAY: OUT STD_LOGIC_VECTOR(0 TO 6));
	END COMPONENT;

	COMPONENT FULLADDER IS
	PORT (A, B, C: IN STD_LOGIC;
		S, C0: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT MUX
	PORT (I0, I1, S: IN STD_LOGIC;
	MUXOUT: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT CIRCA
	PORT (R,S,T,U: IN STD_LOGIC;
	ROUT, SOUT, TOUT, UOUT: OUT STD_LOGIC);
	END COMPONENT;

	COMPONENT CIRCB
	PORT (R,S,T,U: IN STD_LOGIC;
	ROUT, SOUT, TOUT, UOUT: OUT STD_LOGIC);
	END COMPONENT;
	

	SIGNAL S3: STD_LOGIC;
	SIGNAL S2: STD_LOGIC;
	SIGNAL S1: STD_LOGIC;
	SIGNAL S0: STD_LOGIC;
	
	SIGNAL C1: STD_LOGIC;
	SIGNAL C2: STD_LOGIC;
	SIGNAL C3: STD_LOGIC;
	SIGNAL Cout: STD_LOGIC;
	
	
	SIGNAL COMP3: STD_LOGIC;
	SIGNAL COMP2: STD_LOGIC;
	SIGNAL COMP1: STD_LOGIC;
	SIGNAL COMP0: STD_LOGIC;
	SIGNAL COMPARATOR: STD_LOGIC;
	SIGNAL Z: INTEGER;
	
	SIGNAL A3OUT: STD_LOGIC;
	SIGNAL A2OUT: STD_LOGIC;
	SIGNAL A1OUT: STD_LOGIC;
	SIGNAL A0OUT: STD_LOGIC;
	
	SIGNAL B3OUT: STD_LOGIC;
	SIGNAL B2OUT: STD_LOGIC;
	SIGNAL B1OUT: STD_LOGIC;
	SIGNAL B0OUT: STD_LOGIC;
	
	SIGNAL COMP7: STD_LOGIC;
	SIGNAL COMP6: STD_LOGIC;
	SIGNAL COMP5: STD_LOGIC;
	SIGNAL COMP4: STD_LOGIC;
	
	SIGNAL COMP11: STD_LOGIC;
	SIGNAL COMP10: STD_LOGIC;
	SIGNAL COMP9: STD_LOGIC;
	SIGNAL COMP8: STD_LOGIC;


BEGIN


	-- HEX 5, 3
	H5: DECODER PORT MAP(A => SW(7), B => SW(6), C => SW(5), D => SW(4), HEXDISPLAY => HEX5);
	H3: DECODER PORT MAP(A => SW(3), B => SW(2), C => SW(1), D => SW(0), HEXDISPLAY => HEX3);
	
	-- HEX 1
	F0: FULLADDER PORT MAP(A => SW(4), B => SW(0), C => SW(8), S => S0, C0 => C1);
	F1: FULLADDER PORT MAP(A => SW(5), B => SW(1), C => C1, S => S1, C0 => C2);
	F2: FULLADDER PORT MAP(A => SW(6), B => SW(2), C => C2, S => S2, C0 => C3);
	F3: FULLADDER PORT MAP(A => SW(7), B => SW(3), C => C3, S => S3, C0 => Cout);
	
	
	M3: MUX PORT MAP(I0 => S3, I1 => '1', S => Cout, MUXOUT => COMP3);
	M2: MUX PORT MAP(I0 => S2, I1 => '1', S => Cout, MUXOUT => COMP2);
	M1: MUX PORT MAP(I0 => S1, I1 => '1', S => Cout, MUXOUT => COMP1);
	M0: MUX PORT MAP(I0 => S0, I1 => '1', S => Cout, MUXOUT => COMP0);

	COMPARATOR <= (COMP3 AND COMP2) OR (COMP3 AND COMP1);
	HEX1(0) <= COMPARATOR;
	HEX1(1) <= '0';
	HEX1(2) <= '0';
	HEX1(3) <= COMPARATOR;
	HEX1(4) <= COMPARATOR;
	HEX1(5) <= COMPARATOR;
	HEX1(6) <= '1';
	Z <= (COMP3 AND COMP2) OR (COMP3 AND COMP1);
	
	PROCESS(SW, Z);
	BEGIN
	IF Z = '1' THEN
	COMP4 <= '1';
	COMP5 <= '1';
	COMP6 <= '1';
	COMP7 <= '1';
	ELSIF Z = '0' THEN
	COMP4 <= '0';
	COMP5 <= '0';
	COMP6 <= '0';
	COMP7 <= '0';
	ELSE
	COMP4 <= '0';
	COMP5 <= '0';
	COMP6 <= '0';
	COMP7 <= '0';
	END IF;
	END PROCESS;
	H0: DECODER PORT MAP(A => COMP4, B => COMP5, C => COMP6, D => COMP7, HEXDISPLAY => HEX0);
END STRUCT;		
	

	-- HEX 0
	--A0: CIRCA PORT MAP(R => S3, S => S2, T => S1, U => S0, ROUT => A3OUT, SOUT => A2OUT, TOUT => A1OUT, UOUT => A0OUT);
	--B0: CIRCB PORT MAP(R => S3, S => S2, T => S1, U => S0, ROUT => B3OUT, SOUT => B2OUT, TOUT => B1OUT, UOUT => B0OUT);
	
	--M7: MUX PORT MAP(I0 => A3OUT, I1 => B3OUT, S => Cout, MUXOUT => COMP7);
	--M6: MUX PORT MAP(I0 => A2OUT, I1 => B2OUT, S => Cout, MUXOUT => COMP6);
	--M5: MUX PORT MAP(I0 => A1OUT, I1 => B1OUT, S => Cout, MUXOUT => COMP5);
	--M4: MUX PORT MAP(I0 => A0OUT, I1 => B0OUT, S => Cout, MUXOUT => COMP4);
	
	
	--M11: MUX PORT MAP(I0 => S3, I1 => COMP7, S => COMPARATOR, MUXOUT => COMP11);
	--M10: MUX PORT MAP(I0 => S2, I1 => COMP6, S => COMPARATOR, MUXOUT => COMP10);
	--M9: MUX PORT MAP(I0 => S1, I1 => COMP5, S => COMPARATOR, MUXOUT => COMP9);
	--M8: MUX PORT MAP(I0 => S0, I1 => COMP4, S => COMPARATOR, MUXOUT => COMP8);
	
	
	


-- END BEHAVIOR;

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY DECODER IS
	PORT (A,B,C,D: IN STD_LOGIC;
	HEXDISPLAY: OUT STD_LOGIC_VECTOR(0 TO 6));
	
END DECODER;


ARCHITECTURE BEHAVIOR OF DECODER IS
	-- 0
	SIGNAL AnotC: STD_LOGIC;
	SIGNAL AnotBD: STD_LOGIC;
	SIGNAL BnotCnotDnot: STD_LOGIC;
	SIGNAL ABnotCnot: STD_LOGIC;

	-- 1
	SIGNAL AnotBnot: STD_LOGIC;
	SIGNAL BnotCnot: STD_LOGIC;
	SIGNAL AnotCnotDnot: STD_LOGIC;
	SIGNAL AnotCD: STD_LOGIC;s
	
	-- 2
	SIGNAL AnotB: STD_LOGIC;
	-- reused: SIGNAL BnotCnot: STD_LOGIC;
	SIGNAL AnotD: STD_LOGIC;
	
	-- 3
	SIGNAL AnotBCnotD: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	SIGNAL AnotBnotC: STD_LOGIC;
	SIGNAL AnotCDnot: STD_LOGIC;
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	
	-- 4
	-- reused: SIGNAL AnotCDnot: STD_LOGIC;
	SIGNAL AnotBnotDnot: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;

	-- 5
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	SIGNAL AnotBDnot: STD_LOGIC;
	SIGNAL AnotBCnot: STD_LOGIC;
	-- reused: SIGNAL AnotCnotDnot: STD_LOGIC;
	

	
	-- HEX1
	-- 0
	SIGNAL AnotC2: STD_LOGIC;
	SIGNAL AnotBD2: STD_LOGIC;
	SIGNAL BnotCnotDnot2: STD_LOGIC;
	SIGNAL ABnotCnot2: STD_LOGIC;

	-- 1
	SIGNAL AnotBnot2: STD_LOGIC;
	SIGNAL BnotCnot2: STD_LOGIC;
	SIGNAL AnotCnotDnot2: STD_LOGIC;
	SIGNAL AnotCD2: STD_LOGIC;
	
	-- 2
	SIGNAL AnotB2: STD_LOGIC;
	-- reused: SIGNAL BnotCnot: STD_LOGIC;
	SIGNAL AnotD2: STD_LOGIC;
	
	-- 3
	SIGNAL AnotBCnotD2: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	SIGNAL AnotBnotC2: STD_LOGIC;
	SIGNAL AnotCDnot2: STD_LOGIC;
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	
	-- 4
	-- reused: SIGNAL AnotCDnot: STD_LOGIC;
	SIGNAL AnotBnotDnot2: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;

	-- 5
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	SIGNAL AnotBDnot2: STD_LOGIC;
	SIGNAL AnotBCnot2: STD_LOGIC;
	-- reused: SIGNAL AnotCnotDnot: STD_LOGIC;
	

BEGIN 
	-- 0
	-- SIGNAL AnotC: STD_LOGIC;
	-- SIGNAL AnotBD: STD_LOGIC;
	-- SIGNAL BnotCnotDnot: STD_LOGIC;
	-- SIGNAL ABnotCnot: STD_LOGIC;
	AnotC <= NOT(A) AND C;
	AnotBD <= NOT(A) AND B AND D;
	BnotCnotDnot <= NOT(B) AND NOT(C) AND NOT(D);
	ABnotCnot <= A AND NOT(B) AND NOT(C);
	HEXDISPLAY(0) <= NOT(AnotC OR AnotBD OR BnotCnotDnot OR ABnotCnot);
	
	
	
	-- 1
	--SIGNAL AnotBnot: STD_LOGIC;
	--SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotCD: STD_LOGIC;
	AnotBnot <= NOT(A) AND NOT(B);
	BnotCnot <= NOT(B) AND NOT(C);
	AnotCnotDnot <= NOT(A) AND NOT(C) AND NOT(D);
	AnotCD <= NOT(A) AND C AND D;
	HEXDISPLAY(1) <= NOT(AnotBnot OR BnotCnot OR AnotCnotDnot OR AnotCD);
	
	
	-- 2
	--SIGNAL AnotB: STD_LOGIC;
	-- reused: SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotD: STD_LOGIC;
	AnotB <= NOT(A) AND B;
	AnotD <= NOT(A) AND D;
	HEXDISPLAY(2) <= NOT(AnotB OR BnotCnot OR AnotD);
	
	
	-- 3
	--SIGNAL AnotBCnotD: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotBnotC: STD_LOGIC;
	--SIGNAL AnotCDnot: STD_LOGIC;
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	AnotBCnotD <= NOT(A) AND B AND NOT(C) AND D;
	AnotBnotC <= NOT(A) AND NOT(B) AND C;
	AnotCDnot <= NOT(A) AND C AND NOT(D);
	HEXDISPLAY(3) <= NOT(AnotBCnotD OR BnotCnotDnot OR AnotBnotC OR AnotCDnot OR ABnotCnot);
	
	
	-- 4
	-- reused: SIGNAL AnotCDnot: STD_LOGIC;
	--SIGNAL AnotBnotDnot: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	AnotBnotDnot <= NOT(A) AND NOT(B) AND NOT(D);
	HEXDISPLAY(4) <= NOT(AnotCDnot OR AnotBnotDnot OR BnotCnotDnot);
	
	-- 5
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	--SIGNAL AnotBDnot: STD_LOGIC;
	--SIGNAL AnotBCnot: STD_LOGIC;
	-- reused: SIGNAL AnotCnotDnot: STD_LOGIC;
	AnotBDnot <= NOT(A) AND B AND NOT(D);
	AnotBCnot <= NOT(A) AND B AND NOT(C);
	HEXDISPLAY(5) <= NOT(ABnotCnot OR AnotBDnot OR AnotBCnot OR AnotCnotDnot);
	
	
	-- 6
	HEXDISPLAY(6) <= NOT(AnotBCnot OR ABnotCnot OR AnotBnotC OR AnotCDnot);

	

END BEHAVIOR;

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY FULLADDER IS
PORT (A, B, C: IN STD_LOGIC;
		S, C0: OUT STD_LOGIC);
END FULLADDER;


ARCHITECTURE FULLADDER1 OF FULLADDER IS

	SIGNAL ABXOR: STD_LOGIC;
	SIGNAL CXOR: STD_LOGIC;


BEGIN 
	
	C0 <= (NOT(ABXOR) AND B) OR (C AND ABXOR);
	ABXOR <= A XOR B;
	S <= C XOR ABXOR;

END FULLADDER1;

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY CIRCA IS
	PORT (R,S,T,U: IN STD_LOGIC;
	ROUT, SOUT, TOUT, UOUT: OUT STD_LOGIC);

END CIRCA;

ARCHITECTURE BEHAVIOR OF CIRCA IS
BEGIN 

		ROUT <= '0';
		SOUT <= R AND S AND T;
		TOUT <= R AND S AND NOT(T);
		UOUT <= (R AND S AND U) OR (R AND T AND U);



END BEHAVIOR;

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY CIRCB IS
	PORT (R,S,T,U: IN STD_LOGIC;
	ROUT, SOUT, TOUT, UOUT: OUT STD_LOGIC);

END CIRCB;

ARCHITECTURE BEHAVIOR OF CIRCB IS

	
BEGIN 

	ROUT <= NOT(R) AND NOT(S) AND T;
	SOUT <= NOT(R) AND NOT(S) AND NOT(T);
	TOUT <= NOT(R) AND NOT(S) AND NOT(T);
	UOUT <= NOT(R) AND NOT(S) AND U;


END BEHAVIOR;

LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY MUX IS
	PORT (I0, I1, S: IN STD_LOGIC;
	MUXOUT: OUT STD_LOGIC);
END MUX;


ARCHITECTURE BEHAVIOR OF MUX IS
BEGIN 
	MUXOUT <= (I0 AND NOT(S)) OR (I1 AND S);

END BEHAVIOR;