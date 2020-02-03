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
	SIGNAL AnotCD: STD_LOGIC;
	
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



	
	














