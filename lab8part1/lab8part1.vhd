--A gated RS latch desribed the hard way
LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY lab8part1 IS
PORT ( Clk, D: IN STD_LOGIC;
Q : OUT STD_LOGIC);
END lab8part1;
ARCHITECTURE Structural OF lab8part1 IS
SIGNAL R_g, S_g, Qa, Qb : STD_LOGIC ;
ATTRIBUTE KEEP : BOOLEAN;
ATTRIBUTE KEEP OF R_g, S_g, Qa, Qb : SIGNAL IS TRUE;
BEGIN
R_g <= NOT(D) NAND Clk;
S_g <= D NAND Clk;
Qa <= NOT (S_g AND Qb);
Qb <= NOT (R_g AND Qa);
Q <= Qa;
END Structural;