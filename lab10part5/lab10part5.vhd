LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LAB10PART5 IS
	PORT(CLOCK_50: IN STD_LOGIC;
	HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
END LAB10PART5;


ARCHITECTURE BEHAVIOR OF LAB10PART5 IS

	SIGNAL CLK: STD_LOGIC_VECTOR(0 TO 24);
	SIGNAL COUNT: STD_LOGIC_VECTOR(0 TO 2);
	
BEGIN

	PROCESS(CLOCK_50)
	BEGIN
	IF (CLOCK_50'EVENT AND CLOCK_50 = '1') THEN
		CLK <= CLK + 1;
		
		IF (CLOCK_50'EVENT AND CLOCK_50 = '1') THEN
			
			IF (CLK=0) THEN
				COUNT <= COUNT + 1;
			ELSIF (COUNT = "110") THEN
				COUNT <= "000";
			
			END IF;
		END IF;	
	END IF;
	END PROCESS;

	
	HEX5 <=	"1111111" WHEN COUNT = "000" ELSE
				"1111111" WHEN COUNT = "001" ELSE
				"0100001" WHEN COUNT = "010" ELSE
				"0000110" WHEN COUNT = "011" ELSE
				"1111001" WHEN COUNT = "100" ELSE
				"1000000";
	
	HEX4 <=	"1111111" WHEN COUNT = "000" ELSE
				"0100001" WHEN COUNT = "001" ELSE
				"0000110" WHEN COUNT = "010" ELSE
				"1111001" WHEN COUNT = "011" ELSE
				"1000000" WHEN COUNT = "100" ELSE
				"1111111";	
	
	HEX3 <=	"0100001" WHEN COUNT = "000" ELSE
				"0000110" WHEN COUNT = "001" ELSE
				"1111001" WHEN COUNT = "010" ELSE
				"1000000" WHEN COUNT = "011" ELSE
				"1111111" WHEN COUNT = "100" ELSE
				"1111111";	

	HEX2 <=	"0000110" WHEN COUNT = "000" ELSE
				"1111001" WHEN COUNT = "001" ELSE
				"1000000" WHEN COUNT = "010" ELSE
				"1111111" WHEN COUNT = "011" ELSE
				"1111111" WHEN COUNT = "100" ELSE
				"0100001";	
				

	HEX1 <=	"1111001" WHEN COUNT = "000" ELSE
				"1000000" WHEN COUNT = "001" ELSE
				"1111111" WHEN COUNT = "010" ELSE
				"1111111" WHEN COUNT = "011" ELSE
				"0100001" WHEN COUNT = "100" ELSE
				"0000110";
				
	HEX0 <=	"1000000" WHEN COUNT = "000" ELSE
				"1111111" WHEN COUNT = "001" ELSE
				"1111111" WHEN COUNT = "010" ELSE
				"0100001" WHEN COUNT = "011" ELSE
				"0000110" WHEN COUNT = "100" ELSE
				"1111001";					
				
				
		--"0100001" -- D
		--"0000110" -- E
		--"1111001" -- 1
		--"1000000" -- 0
		--"1111111" -- NOTHING		
				
END BEHAVIOR;