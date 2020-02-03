LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;


ENTITY lab7part1 IS
PORT (SW: IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		LEDR: OUT STD_LOGIC_VECTOR(9 DOWNTO 0);
		HEX0: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX1: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX2: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX3: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX4: OUT STD_LOGIC_VECTOR(0 TO 6);
		HEX5: OUT STD_LOGIC_VECTOR(0 TO 6));	
END lab7part1;



ARCHITECTURE behavior OF lab7part1 IS
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
	LEDR <= SW;
	-- 0
	-- SIGNAL AnotC: STD_LOGIC;
	-- SIGNAL AnotBD: STD_LOGIC;
	-- SIGNAL BnotCnotDnot: STD_LOGIC;
	-- SIGNAL ABnotCnot: STD_LOGIC;
	AnotC <= NOT(SW(3)) AND SW(1);
	AnotBD <= NOT(SW(3)) AND SW(2) AND SW(0);
	BnotCnotDnot <= NOT(SW(2)) AND NOT(SW(1)) AND NOT(SW(0));
	ABnotCnot <= SW(3) AND NOT(SW(2)) AND NOT(SW(1));
	HEX0(0) <= NOT(AnotC OR AnotBD OR BnotCnotDnot OR ABnotCnot);
	
	-- 1
	--SIGNAL AnotBnot: STD_LOGIC;
	--SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotCD: STD_LOGIC;
	AnotBnot <= NOT(SW(3)) AND NOT(SW(2));
	BnotCnot <= NOT(SW(2)) AND NOT(SW(1));
	AnotCnotDnot <= NOT(SW(3)) AND NOT(SW(1)) AND NOT(SW(0));
	AnotCD <= NOT(SW(3)) AND SW(1) AND SW(0);
	HEX0(1) <= NOT(AnotBnot OR BnotCnot OR AnotCnotDnot OR AnotCD);
	
	
	-- 2
	--SIGNAL AnotB: STD_LOGIC;
	-- reused: SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotD: STD_LOGIC;
	AnotB <= NOT(SW(3)) AND SW(2);
	AnotD <= NOT(SW(3)) AND SW(0);
	HEX0(2) <= NOT(AnotB OR BnotCnot OR AnotD);
	
	
	-- 3
	--SIGNAL AnotBCnotD: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotBnotC: STD_LOGIC;
	--SIGNAL AnotCDnot: STD_LOGIC;
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	AnotBCnotD <= NOT(SW(3)) AND SW(2) AND NOT(SW(1)) AND SW(0);
	AnotBnotC <= NOT(SW(3)) AND NOT(SW(2)) AND SW(1);
	AnotCDnot <= NOT(SW(3)) AND SW(1) AND NOT(SW(0));
	HEX0(3) <= NOT(AnotBCnotD OR BnotCnotDnot OR AnotBnotC OR AnotCDnot OR ABnotCnot);
	
	
	-- 4
	-- reused: SIGNAL AnotCDnot: STD_LOGIC;
	--SIGNAL AnotBnotDnot: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	AnotBnotDnot <= NOT(SW(3)) AND NOT(SW(2)) AND NOT(SW(0));
	HEX0(4) <= NOT(AnotCDnot OR AnotBnotDnot OR BnotCnotDnot);
	
	-- 5
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	--SIGNAL AnotBDnot: STD_LOGIC;
	--SIGNAL AnotBCnot: STD_LOGIC;
	-- reused: SIGNAL AnotCnotDnot: STD_LOGIC;
	AnotBDnot <= NOT(SW(3)) AND SW(2) AND NOT(SW(0));
	AnotBCnot <= NOT(SW(3)) AND SW(2) AND NOT(SW(1));
	HEX0(5) <= NOT(ABnotCnot OR AnotBDnot OR AnotBCnot OR AnotCnotDnot);
	
	-- 6
	HEX0(6) <= NOT(AnotBCnot OR ABnotCnot OR AnotBnotC OR AnotCDnot);
	
	-- SW 4 -7
	-- 0
	-- SIGNAL AnotC: STD_LOGIC;
	-- SIGNAL AnotBD: STD_LOGIC;
	-- SIGNAL BnotCnotDnot: STD_LOGIC;
	-- SIGNAL ABnotCnot: STD_LOGIC;
	AnotC2 <= NOT(SW(7)) AND SW(5);
	AnotBD2 <= NOT(SW(7)) AND SW(6) AND SW(4);
	BnotCnotDnot2 <= NOT(SW(6)) AND NOT(SW(5)) AND NOT(SW(4));
	ABnotCnot2 <= SW(7) AND NOT(SW(6)) AND NOT(SW(5));
	HEX1(0) <= NOT(AnotC2 OR AnotBD2 OR BnotCnotDnot2 OR ABnotCnot2);
	
	-- 1
	--SIGNAL AnotBnot: STD_LOGIC;
	--SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotCD: STD_LOGIC;
	AnotBnot2 <= NOT(SW(7)) AND NOT(SW(6));
	BnotCnot2 <= NOT(SW(6)) AND NOT(SW(5));
	AnotCnotDnot2 <= NOT(SW(7)) AND NOT(SW(5)) AND NOT(SW(4));
	AnotCD2 <= NOT(SW(7)) AND SW(5) AND SW(4);
	HEX1(1) <= NOT(AnotBnot2 OR BnotCnot2 OR AnotCnotDnot2 OR AnotCD2);
	
	-- 2
	--SIGNAL AnotB: STD_LOGIC;
	-- reused: SIGNAL BnotCnot: STD_LOGIC;
	--SIGNAL AnotD: STD_LOGIC;
	AnotB2 <= NOT(SW(7)) AND SW(6);
	AnotD2 <= NOT(SW(7)) AND SW(4);
	HEX1(2) <= NOT(AnotB2 OR BnotCnot2 OR AnotD2);
	
	-- 3
	--SIGNAL AnotBCnotD: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	--SIGNAL AnotBnotC: STD_LOGIC;
	--SIGNAL AnotCDnot: STD_LOGIC;
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	AnotBCnotD2 <= NOT(SW(7)) AND SW(6) AND NOT(SW(5)) AND SW(4);
	AnotBnotC2 <= NOT(SW(7)) AND NOT(SW(6)) AND SW(5);
	AnotCDnot2 <= NOT(SW(7)) AND SW(5) AND NOT(SW(4));
	HEX1(3) <= NOT(AnotBCnotD2 OR BnotCnotDnot2 OR AnotBnotC2 OR AnotCDnot2 OR ABnotCnot2);
	
	-- 4
	-- reused: SIGNAL AnotCDnot: STD_LOGIC;
	--SIGNAL AnotBnotDnot: STD_LOGIC;
	-- reused: SIGNAL BnotCnotDnot: STD_LOGIC;
	AnotBnotDnot2 <= NOT(SW(7)) AND NOT(SW(6)) AND NOT(SW(4));
	HEX1(4) <= NOT(AnotCDnot2 OR AnotBnotDnot2 OR BnotCnotDnot2);
	
	-- 5
	-- reused: SIGNAL ABnotCnot: STD_LOGIC;
	--SIGNAL AnotBDnot: STD_LOGIC;
	--SIGNAL AnotBCnot: STD_LOGIC;
	-- reused: SIGNAL AnotCnotDnot: STD_LOGIC;
	AnotBDnot2 <= NOT(SW(7)) AND SW(6) AND NOT(SW(4));
	AnotBCnot2 <= NOT(SW(7)) AND SW(6) AND NOT(SW(5));
	HEX1(5) <= NOT(ABnotCnot2 OR AnotBDnot2 OR AnotBCnot2 OR AnotCnotDnot2);
	
	-- 6
	HEX1(6) <= NOT(AnotBCnot2 OR ABnotCnot2 OR AnotBnotC2 OR AnotCDnot2);
END behavior;