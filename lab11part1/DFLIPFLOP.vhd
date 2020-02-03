LIBRARY IEEE;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY dflipflop IS
	PORT(clock, clear, D: IN std_logic;
			Q: OUT std_logic);
END dflipflop;

ARCHITECTURE behavior OF dflipflop IS
	
	signal temp: std_logic;
	
begin

	process(clock)
	begin
	
	if(clock'event AND clock='1') then
		if(clear = '1') then
			temp <= D;
		else
			temp <= '0';
		end if;
	end if;
	
	end process;
	
	Q <= temp;
		
end behavior;
