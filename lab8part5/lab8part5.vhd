LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;


ENTITY LAB8PART5 IS 
	PORT(RESET, CLK: IN STD_LOGIC; 
	SW: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	LEDR: OUT STD_LOGIC;
	HEX0: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX4: OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX5: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	
	
END LAB8PART5;


ARCHITECTURE BEHAVIOR OF LAB8PART5 IS 
-- SIGNALS GO HERE	
	
	COMPONENT ripplecarry IS
	PORT (A, B, C: IN STD_LOGIC;
		S, C0: OUT STD_LOGIC);
	END COMPONENT;
	
	COMPONENT DECODER IS 
	PORT(w, x, y, z: IN STD_LOGIC;
		hex: OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
	END COMPONENT;
	
	SIGNAL REG: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL ADDER_OUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL CARRY_OUT: STD_LOGIC_VECTOR(7 DOWNTO 0);
	
	
BEGIN

	PROCESS(REG, SW)
	BEGIN
	
	IF (RESET = '1') THEN
		IF (CLK'EVENT AND CLK = '1') THEN
			REG <= SW;
		END IF;
	ELSE
		REG(0) <= '0';
		REG(1) <= '0';
		REG(2) <= '0';
		REG(3) <= '0';
		REG(4) <= '0';
		REG(5) <= '0';
		REG(6) <= '0';
	END IF;
	END PROCESS;


	r0: ripplecarry PORT MAP(A => SW(0), B => REG(0), C => '0', S => ADDER_OUT(0), C0 => CARRY_OUT(0));
	r1: ripplecarry PORT MAP(A => SW(1), B => REG(1), C => CARRY_OUT(0), S => ADDER_OUT(1), C0 => CARRY_OUT(1));
	r2: ripplecarry PORT MAP(A => SW(2), B => REG(2), C => CARRY_OUT(1), S => ADDER_OUT(2), C0 => CARRY_OUT(2));
	r3: ripplecarry PORT MAP(A => SW(3), B => REG(3), C => CARRY_OUT(2), S => ADDER_OUT(3), C0 => CARRY_OUT(3));
	r4: ripplecarry PORT MAP(A => SW(4), B => REG(4), C => CARRY_OUT(3), S => ADDER_OUT(4), C0 => CARRY_OUT(4));
	r5: ripplecarry PORT MAP(A => SW(5), B => REG(5), C => CARRY_OUT(4), S => ADDER_OUT(5), C0 => CARRY_OUT(5));
	r6: ripplecarry PORT MAP(A => SW(6), B => REG(6), C => CARRY_OUT(5), S => ADDER_OUT(6), C0 => CARRY_OUT(6));
	r7: ripplecarry PORT MAP(A => SW(7), B => REG(7), C => CARRY_OUT(6), S => ADDER_OUT(7), C0 => CARRY_OUT(7));

	LEDR <= CARRY_OUT(7);
	
	h0: decoder PORT MAP(w => SW(3), x => SW(2), y => SW(1), z => SW(0), hex => HEX0);
	h1: decoder PORT MAP(w => SW(7), x => SW(6), y => SW(5), z => SW(4), hex => HEX1);
	h2: decoder PORT MAP(w => REG(3), x => REG(2), y => REG(1), z => REG(0), hex => HEX2);
	h3: decoder PORT MAP(w => REG(7), x => REG(6), y => REG(5), z => REG(4), hex => HEX3);
	h4: decoder PORT MAP(w => ADDER_OUT(3), x => ADDER_OUT(2), y => ADDER_OUT(1), z => ADDER_OUT(0), hex => HEX4);
	h5: decoder PORT MAP(w => ADDER_OUT(7), x => ADDER_OUT(6), y => ADDER_OUT(5), z => ADDER_OUT(4), hex => HEX5);
	

	

END BEHAVIOR;