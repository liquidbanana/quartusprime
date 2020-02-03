--A gated RS latch desribed the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab8part2 IS
PORT (SW: IN std_logic_vector(1 downto 0);
		LEDR: OUT std_logic_vector(9 downto 0);
		-- D: IN STD_LOGIC;
		Q : OUT STD_LOGIC);
END lab8part2;
ARCHITECTURE Structural OF lab8part2 IS
SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;

SIGNAL D, Clk: std_logic;

	
ATTRIBUTE KEEP : BOOLEAN;
ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN

-- d = sw 0, clk = 1
D <= SW(0);
Clk <= SW(1);

R_g <= NOT(D) NAND Clk;
S_g <= D NAND Clk;
Qa <= NOT (S_g AND Qb);
Qb <= NOT (R_g AND Qa);
Q <= Qa;







END Structural;