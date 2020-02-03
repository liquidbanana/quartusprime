LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LAB11PART1 IS
	PORT(SW0, SW1, KEY0: IN STD_LOGIC;
	LEDR0, LEDR1, LEDR9: OUT STD_LOGIC);
END LAB11PART1;

ARCHITECTURE BEHAVIOR OF LAB11PART1 IS

	COMPONENT DFLIPFLOP
		PORT(D, CLK, CLEAR: IN STD_LOGIC;
		Q: OUT STD_LOGIC);
	END COMPONENT;
	SIGNAL Y1, Y_1, Y2, Y_2: STD_LOGIC;
	SIGNAL ORGATE: STD_LOGIC;
	
BEGIN
	D0: DFLIPFLOP PORT MAP(D => Y_2, CLK => KEY0, CLEAR => SW0, Q => Y2);
	D1: DFLIPFLOP PORT MAP(D => Y_1, CLK => KEY0, CLEAR => SW0, Q => Y1);
	
	ORGATE <= Y1 OR Y2;
	Y_2 <= ORGATE AND SW1;
	Y_1 <= SW1 AND NOT(Y1) AND NOT(Y2);
	
	LEDR9 <= Y2;
	LEDR1 <= Y2;
	LEDR0 <= Y1;
	
END BEHAVIOR;
