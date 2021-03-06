LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY LAB11PART4 IS

		PORT(CLOCK, RESET: IN STD_LOGIC;
		COIN: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
		COKE, TEN, FIVE: OUT STD_LOGIC;
		LEDR: OUT STD_LOGIC_VECTOR(8 DOWNTO 4));

END LAB11PART4;

ARCHITECTURE BEHAVIOR OF LAB11PART4 IS

	TYPE STATE_TYPE IS ( S1, S2, S3, S4, S5);
	SIGNAL STATE: STATE_TYPE;
	
BEGIN
	TEN <= COIN(1);
	FIVE <= COIN(0);
	
	PROCESS (CLOCK, RESET, COIN)
	BEGIN
	IF RESET = '0' THEN
	STATE <= S1;
	
	ELSIF (RISING_EDGE(CLOCK)) THEN
	CASE STATE IS
	WHEN S1=>
	IF COIN(1) = '1' THEN
		STATE <= S2;
	ELSIF COIN(0) = '1' THEN
		STATE <= S3;
	ELSE
		STATE <= S1;
	END IF;
		
	WHEN S2=>
	IF COIN(1) = '1' THEN
		STATE <= S5;
	ELSIF COIN(0) = '1'THEN
		STATE <= S4;
    ELSE
		STATE<= S2;
    END IF;
	
	WHEN S3=>
	IF COIN(1) = '1' THEN
		STATE <= S4;
	ELSIF COIN(0) = '1'THEN
		STATE <= S2;
	ELSE
		STATE <= S3;
	END IF;

	WHEN S4 =>
		STATE <= S1;

	WHEN S5=>
		STATE <= S3;
		
	END CASE;
	END IF;
   END PROCESS;

	PROCESS (STATE,COIN)
	BEGIN
	CASE STATE IS
	WHEN S1 =>
		COKE <= '0';
		LEDR <= "00001";
	
	WHEN S2 =>
		COKE <= '0';
		LEDR <= "00010";
		
	WHEN S3 =>
		COKE <= '0';	-- NO COKE :(
		LEDR <= "00100";
		
	WHEN S4 =>
		COKE <= '1';
		LEDR <= "01000";
		
	WHEN S5 =>
		COKE <= '1';	-- GOT THE COKE!!!
		LEDR <= "10000";

    END CASE;
	END PROCESS;
END BEHAVIOR;