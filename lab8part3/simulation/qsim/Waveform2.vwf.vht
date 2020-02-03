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
-- Generated on "11/07/2019 01:07:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          LAB8PART3
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY LAB8PART3_vhd_vec_tst IS
END LAB8PART3_vhd_vec_tst;
ARCHITECTURE LAB8PART3_arch OF LAB8PART3_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
COMPONENT LAB8PART3
	PORT (
	CLK : IN STD_LOGIC;
	D : IN STD_LOGIC;
	Q : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : LAB8PART3
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	D => D,
	Q => Q
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		CLK <= '0';
		WAIT FOR 40000 ps;
		CLK <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	CLK <= '0';
WAIT;
END PROCESS t_prcs_CLK;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 50000 ps;
	D <= '0';
	WAIT FOR 150000 ps;
	D <= '1';
	WAIT FOR 160000 ps;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;
END LAB8PART3_arch;
