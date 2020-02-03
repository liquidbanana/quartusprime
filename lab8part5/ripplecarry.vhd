LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ripplecarry IS
PORT (A, B, C: IN STD_LOGIC;
		S, C0: OUT STD_LOGIC);
END ripplecarry;


ARCHITECTURE ripplecarry1 OF ripplecarry IS

	SIGNAL ABXOR: STD_LOGIC;
	SIGNAL CXOR: STD_LOGIC;


BEGIN 
	
	C0 <= (NOT(ABXOR) AND B) OR (C AND ABXOR);
	ABXOR <= A XOR B;
	S <= C XOR ABXOR;

END ripplecarry1;