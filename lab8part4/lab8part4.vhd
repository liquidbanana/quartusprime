LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY lab8part4 IS
	PORT (D, CLK: IN STD_LOGIC;
			Q: OUT STD_LOGIC);
			
END lab8part4;
			
ARCHITECTURE BEHAVIOR OF lab8part4 IS


BEGIN
	
	PROCESS(D, CLK)
	BEGIN
		IF CLK = '1' THEN
		Q <= D;
		END IF;
	END PROCESS;

END BEHAVIOR;