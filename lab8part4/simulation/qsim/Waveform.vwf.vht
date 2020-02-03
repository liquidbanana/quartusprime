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
-- Generated on "11/08/2019 00:39:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          lab8part4
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY lab8part4_vhd_vec_tst IS
END lab8part4_vhd_vec_tst;
ARCHITECTURE lab8part4_arch OF lab8part4_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL D : STD_LOGIC;
SIGNAL Q : STD_LOGIC;
COMPONENT lab8part4
	PORT (
	CLK : IN STD_LOGIC;
	D : IN STD_LOGIC;
	Q : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : lab8part4
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	D => D,
	Q => Q
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
	CLK <= '1';
	WAIT FOR 20000 ps;
	CLK <= '0';
	WAIT FOR 170000 ps;
	CLK <= '1';
	WAIT FOR 210000 ps;
	CLK <= '0';
	WAIT FOR 210000 ps;
	CLK <= '1';
	WAIT FOR 190000 ps;
	CLK <= '0';
WAIT;
END PROCESS t_prcs_CLK;

-- D
t_prcs_D: PROCESS
BEGIN
	D <= '0';
	WAIT FOR 130000 ps;
	D <= '1';
	WAIT FOR 110000 ps;
	D <= '0';
	WAIT FOR 70000 ps;
	D <= '1';
	WAIT FOR 30000 ps;
	D <= '0';
	WAIT FOR 80000 ps;
	D <= '1';
	WAIT FOR 60000 ps;
	D <= '0';
	WAIT FOR 60000 ps;
	D <= '1';
	WAIT FOR 20000 ps;
	D <= '0';
	WAIT FOR 90000 ps;
	D <= '1';
	WAIT FOR 20000 ps;
	D <= '0';
	WAIT FOR 70000 ps;
	D <= '1';
	WAIT FOR 120000 ps;
	D <= '0';
WAIT;
END PROCESS t_prcs_D;
END lab8part4_arch;
