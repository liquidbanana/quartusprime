LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY TFLIPFLOP IS
	PORT(T, CLOCK, CLEAR: IN STD_LOGIC;
	Q: OUT STD_LOGIC);
END TFLIPFLOP;

ARCHITECTURE BEHAVIOR OF TFLIPFLOP IS
	SIGNAL COUNTER: STD_LOGIC := '0';
BEGIN

	PROCESS(CLOCK)
	BEGIN
	IF (CLOCK'EVENT AND CLOCK = '1') THEN 
		IF (CLEAR = '0') THEN
			COUNTER <= '0';
		ELSIF (T = '1') THEN
			COUNTER <= NOT(COUNTER);
		END IF;
	END IF;
	END PROCESS;
	
	Q <= COUNTER;
	
END BEHAVIOR;