-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/06/2019 21:27:27"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          lab8part1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab8part1_vhd_vec_tst IS
END lab8part1_vhd_vec_tst;
ARCHITECTURE lab8part1_arch OF lab8part1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clk : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
SIGNAL R : STD_LOGIC;
SIGNAL S : STD_LOGIC;
COMPONENT lab8part1
	PORT (
	Clk : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC;
	R : IN STD_LOGIC;
	S : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lab8part1
	PORT MAP (
-- list connections between master ports and signals
	Clk => Clk,
	Q => Q,
	R => R,
	S => S
	);

-- Clk
t_prcs_Clk: PROCESS
BEGIN
	Clk <= '1';
	WAIT FOR 10000 ps;
	Clk <= '0';
	WAIT FOR 10000 ps;
	FOR i IN 1 TO 4
	LOOP
		Clk <= '1';
		WAIT FOR 10000 ps;
		Clk <= '0';
		WAIT FOR 10000 ps;
	END LOOP;
	Clk <= '1';
	WAIT FOR 10000 ps;
	Clk <= '0';
WAIT;
END PROCESS t_prcs_Clk;

-- R
t_prcs_R: PROCESS
BEGIN
	R <= '1';
	WAIT FOR 10000 ps;
	R <= '0';
	WAIT FOR 60000 ps;
	R <= '1';
	WAIT FOR 20000 ps;
	R <= '0';
WAIT;
END PROCESS t_prcs_R;

-- S
t_prcs_S: PROCESS
BEGIN
	S <= '0';
	WAIT FOR 30000 ps;
	S <= '1';
	WAIT FOR 20000 ps;
	S <= '0';
WAIT;
END PROCESS t_prcs_S;
END lab8part1_arch;
