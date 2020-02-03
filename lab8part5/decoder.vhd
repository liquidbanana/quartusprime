LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY DECODER IS 
	PORT(w, x, y, z: IN STD_LOGIC;
		hex: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
END DECODER;


ARCHITECTURE BEHAVIOR OF DECODER IS
BEGIN

	-- 0
	hex(0) <= (not(w) and not(x) and not(y) and z) or (
	not(w) and x and not(y) and not(z)) or (w and x and not(y) and z) or (w and not(x) and y and z); 
	
	hex(1) <= (not(w) and x and not(y) and z) or 
	(w and x and not(z)) or (w and y and z)  or (x and y and  not(z));
	
	hex(2) <= (not(w) and not(x) and y and not(z)) or (w and x and not(z)) or (w and x and y); 
	
	hex(3) <= (not(w) and not(x) and not(y) and z) or (not(w) and x and not(y) 
	and not(z)) or (x and y and z) or (w and not(x) and y and not(z));
	
	hex(4) <= (not(w) and z) or (not(w) and x and not(y)) or (not(x) and not(y) and z); 
	
	hex(5) <= (not(w) and not(x) and z) or (not(w) and not(x) and y) 
	or (not(w) and y and z) or (w and x and not(y) and z);  
	
	hex(6) <= (not(w) and not(x) and not(y)) or (w and x and not(y) and not(z)) or (not(w) and x and y and z); 
	
	

END BEHAVIOR;