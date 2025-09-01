-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "08/31/2025 18:49:44"

-- 
-- Device: Altera 10CL006YE144A7G Package TQFP144
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONE10LP;
LIBRARY IEEE;
USE CYCLONE10LP.CYCLONE10LP_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONE10LP;
LIBRARY IEEE;
USE CYCLONE10LP.CYCLONE10LP_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	SumaRestaBCD IS
    PORT (
	A : IN std_logic_vector(7 DOWNTO 0);
	B : IN std_logic_vector(7 DOWNTO 0);
	SR : IN std_logic;
	ans1 : OUT std_logic_vector(3 DOWNTO 0);
	ans2 : OUT std_logic_vector(3 DOWNTO 0);
	COUT : OUT std_logic
	);
END SumaRestaBCD;

-- Design Ports Information
-- ans1[0]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans1[1]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans1[2]	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans1[3]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans2[0]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans2[1]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans2[2]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ans2[3]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- COUT	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[7]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[5]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[6]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SR	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[7]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[6]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[5]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[4]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[4]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[3]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[1]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[2]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[3]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[2]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[1]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B[0]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A[0]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF SumaRestaBCD IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SR : std_logic;
SIGNAL ww_ans1 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_ans2 : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_COUT : std_logic;
SIGNAL \ans1[0]~output_o\ : std_logic;
SIGNAL \ans1[1]~output_o\ : std_logic;
SIGNAL \ans1[2]~output_o\ : std_logic;
SIGNAL \ans1[3]~output_o\ : std_logic;
SIGNAL \ans2[0]~output_o\ : std_logic;
SIGNAL \ans2[1]~output_o\ : std_logic;
SIGNAL \ans2[2]~output_o\ : std_logic;
SIGNAL \ans2[3]~output_o\ : std_logic;
SIGNAL \COUT~output_o\ : std_logic;
SIGNAL \B[5]~input_o\ : std_logic;
SIGNAL \B[6]~input_o\ : std_logic;
SIGNAL \SR~input_o\ : std_logic;
SIGNAL \B_adj_decenas[2]~1_combout\ : std_logic;
SIGNAL \A[6]~input_o\ : std_logic;
SIGNAL \A[5]~input_o\ : std_logic;
SIGNAL \A[4]~input_o\ : std_logic;
SIGNAL \B[4]~input_o\ : std_logic;
SIGNAL \B_adj_decenas[0]~2_combout\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \B_adj_unidades[3]~0_combout\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B_adj_unidades[2]~1_combout\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \B_adj_unidades[0]~2_combout\ : std_logic;
SIGNAL \suma_unidades|Add0~1_cout\ : std_logic;
SIGNAL \suma_unidades|Add0~3\ : std_logic;
SIGNAL \suma_unidades|Add0~5\ : std_logic;
SIGNAL \suma_unidades|Add0~7\ : std_logic;
SIGNAL \suma_unidades|Add0~9\ : std_logic;
SIGNAL \suma_unidades|Add0~10_combout\ : std_logic;
SIGNAL \suma_decenas|Add0~1_cout\ : std_logic;
SIGNAL \suma_decenas|Add0~3\ : std_logic;
SIGNAL \suma_decenas|Add0~5\ : std_logic;
SIGNAL \suma_decenas|Add0~6_combout\ : std_logic;
SIGNAL \suma_decenas|Add0~4_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \A[7]~input_o\ : std_logic;
SIGNAL \B[7]~input_o\ : std_logic;
SIGNAL \B_adj_decenas[3]~0_combout\ : std_logic;
SIGNAL \suma_decenas|Add0~7\ : std_logic;
SIGNAL \suma_decenas|Add0~8_combout\ : std_logic;
SIGNAL \suma_decenas|Add0~2_combout\ : std_logic;
SIGNAL \suma_unidades|Add0~8_combout\ : std_logic;
SIGNAL \suma_unidades|Add0~6_combout\ : std_logic;
SIGNAL \suma_unidades|Add0~4_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~1\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~3\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~5\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~7\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~9\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~11\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~13\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~14_combout\ : std_logic;
SIGNAL \suma_decenas|Add0~9\ : std_logic;
SIGNAL \suma_decenas|Add0~10_combout\ : std_logic;
SIGNAL \corr_decenas~combout\ : std_logic;
SIGNAL \suma_unidades|Add0~2_combout\ : std_logic;
SIGNAL \ans1~0_combout\ : std_logic;
SIGNAL \corr_unidades~0_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~0_combout\ : std_logic;
SIGNAL \final_unidades[1]~0_combout\ : std_logic;
SIGNAL \cout_final~0_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~2_combout\ : std_logic;
SIGNAL \final_unidades[2]~1_combout\ : std_logic;
SIGNAL \ans1~1_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~4_combout\ : std_logic;
SIGNAL \final_unidades[3]~2_combout\ : std_logic;
SIGNAL \ans1~2_combout\ : std_logic;
SIGNAL \ans1~3_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~6_combout\ : std_logic;
SIGNAL \ans2~0_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~8_combout\ : std_logic;
SIGNAL \final_decenas[1]~0_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~10_combout\ : std_logic;
SIGNAL \final_decenas[2]~1_combout\ : std_logic;
SIGNAL \ans2~1_combout\ : std_logic;
SIGNAL \suma_corr_unidades|Add0~12_combout\ : std_logic;
SIGNAL \final_decenas[3]~2_combout\ : std_logic;
SIGNAL \ans2~2_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_A <= A;
ww_B <= B;
ww_SR <= SR;
ans1 <= ww_ans1;
ans2 <= ww_ans2;
COUT <= ww_COUT;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y3_N23
\ans1[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans1~0_combout\,
	devoe => ww_devoe,
	o => \ans1[0]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\ans1[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \final_unidades[1]~0_combout\,
	devoe => ww_devoe,
	o => \ans1[1]~output_o\);

-- Location: IOOBUF_X34_Y2_N23
\ans1[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans1~1_combout\,
	devoe => ww_devoe,
	o => \ans1[2]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\ans1[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans1~3_combout\,
	devoe => ww_devoe,
	o => \ans1[3]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\ans2[0]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans2~0_combout\,
	devoe => ww_devoe,
	o => \ans2[0]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\ans2[1]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \final_decenas[1]~0_combout\,
	devoe => ww_devoe,
	o => \ans2[1]~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\ans2[2]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans2~1_combout\,
	devoe => ww_devoe,
	o => \ans2[2]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\ans2[3]~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ans2~2_combout\,
	devoe => ww_devoe,
	o => \ans2[3]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\COUT~output\ : cyclone10lp_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cout_final~0_combout\,
	devoe => ww_devoe,
	o => \COUT~output_o\);

-- Location: IOIBUF_X30_Y0_N8
\B[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(5),
	o => \B[5]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\B[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(6),
	o => \B[6]~input_o\);

-- Location: IOIBUF_X34_Y10_N8
\SR~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SR,
	o => \SR~input_o\);

-- Location: LCCOMB_X30_Y13_N10
\B_adj_decenas[2]~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_decenas[2]~1_combout\ = \B[6]~input_o\ $ (((\B[5]~input_o\ & \SR~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B[5]~input_o\,
	datac => \B[6]~input_o\,
	datad => \SR~input_o\,
	combout => \B_adj_decenas[2]~1_combout\);

-- Location: IOIBUF_X34_Y17_N1
\A[6]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(6),
	o => \A[6]~input_o\);

-- Location: IOIBUF_X34_Y9_N15
\A[5]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(5),
	o => \A[5]~input_o\);

-- Location: IOIBUF_X34_Y18_N15
\A[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(4),
	o => \A[4]~input_o\);

-- Location: IOIBUF_X34_Y9_N8
\B[4]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(4),
	o => \B[4]~input_o\);

-- Location: LCCOMB_X32_Y13_N24
\B_adj_decenas[0]~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_decenas[0]~2_combout\ = \B[4]~input_o\ $ (\SR~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \B[4]~input_o\,
	datad => \SR~input_o\,
	combout => \B_adj_decenas[0]~2_combout\);

-- Location: IOIBUF_X32_Y0_N15
\B[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

-- Location: IOIBUF_X34_Y2_N15
\B[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

-- Location: IOIBUF_X34_Y17_N22
\B[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

-- Location: LCCOMB_X32_Y13_N26
\B_adj_unidades[3]~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_unidades[3]~0_combout\ = (\SR~input_o\ & (!\B[3]~input_o\ & (!\B[2]~input_o\ & !\B[1]~input_o\))) # (!\SR~input_o\ & (\B[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datab => \B[3]~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[1]~input_o\,
	combout => \B_adj_unidades[3]~0_combout\);

-- Location: IOIBUF_X34_Y12_N8
\A[3]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\A[2]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

-- Location: LCCOMB_X32_Y13_N28
\B_adj_unidades[2]~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_unidades[2]~1_combout\ = \B[2]~input_o\ $ (((\SR~input_o\ & \B[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datac => \B[2]~input_o\,
	datad => \B[1]~input_o\,
	combout => \B_adj_unidades[2]~1_combout\);

-- Location: IOIBUF_X30_Y24_N22
\A[1]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

-- Location: IOIBUF_X34_Y4_N15
\A[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

-- Location: IOIBUF_X34_Y19_N15
\B[0]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

-- Location: LCCOMB_X32_Y13_N18
\B_adj_unidades[0]~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_unidades[0]~2_combout\ = \SR~input_o\ $ (\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datac => \B[0]~input_o\,
	combout => \B_adj_unidades[0]~2_combout\);

-- Location: LCCOMB_X32_Y13_N6
\suma_unidades|Add0~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~1_cout\ = CARRY(\SR~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datad => VCC,
	cout => \suma_unidades|Add0~1_cout\);

-- Location: LCCOMB_X32_Y13_N8
\suma_unidades|Add0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~2_combout\ = (\A[0]~input_o\ & ((\B_adj_unidades[0]~2_combout\ & (\suma_unidades|Add0~1_cout\ & VCC)) # (!\B_adj_unidades[0]~2_combout\ & (!\suma_unidades|Add0~1_cout\)))) # (!\A[0]~input_o\ & ((\B_adj_unidades[0]~2_combout\ & 
-- (!\suma_unidades|Add0~1_cout\)) # (!\B_adj_unidades[0]~2_combout\ & ((\suma_unidades|Add0~1_cout\) # (GND)))))
-- \suma_unidades|Add0~3\ = CARRY((\A[0]~input_o\ & (!\B_adj_unidades[0]~2_combout\ & !\suma_unidades|Add0~1_cout\)) # (!\A[0]~input_o\ & ((!\suma_unidades|Add0~1_cout\) # (!\B_adj_unidades[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \B_adj_unidades[0]~2_combout\,
	datad => VCC,
	cin => \suma_unidades|Add0~1_cout\,
	combout => \suma_unidades|Add0~2_combout\,
	cout => \suma_unidades|Add0~3\);

-- Location: LCCOMB_X32_Y13_N10
\suma_unidades|Add0~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~4_combout\ = ((\B[1]~input_o\ $ (\A[1]~input_o\ $ (!\suma_unidades|Add0~3\)))) # (GND)
-- \suma_unidades|Add0~5\ = CARRY((\B[1]~input_o\ & ((\A[1]~input_o\) # (!\suma_unidades|Add0~3\))) # (!\B[1]~input_o\ & (\A[1]~input_o\ & !\suma_unidades|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \A[1]~input_o\,
	datad => VCC,
	cin => \suma_unidades|Add0~3\,
	combout => \suma_unidades|Add0~4_combout\,
	cout => \suma_unidades|Add0~5\);

-- Location: LCCOMB_X32_Y13_N12
\suma_unidades|Add0~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~6_combout\ = (\A[2]~input_o\ & ((\B_adj_unidades[2]~1_combout\ & (\suma_unidades|Add0~5\ & VCC)) # (!\B_adj_unidades[2]~1_combout\ & (!\suma_unidades|Add0~5\)))) # (!\A[2]~input_o\ & ((\B_adj_unidades[2]~1_combout\ & 
-- (!\suma_unidades|Add0~5\)) # (!\B_adj_unidades[2]~1_combout\ & ((\suma_unidades|Add0~5\) # (GND)))))
-- \suma_unidades|Add0~7\ = CARRY((\A[2]~input_o\ & (!\B_adj_unidades[2]~1_combout\ & !\suma_unidades|Add0~5\)) # (!\A[2]~input_o\ & ((!\suma_unidades|Add0~5\) # (!\B_adj_unidades[2]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[2]~input_o\,
	datab => \B_adj_unidades[2]~1_combout\,
	datad => VCC,
	cin => \suma_unidades|Add0~5\,
	combout => \suma_unidades|Add0~6_combout\,
	cout => \suma_unidades|Add0~7\);

-- Location: LCCOMB_X32_Y13_N14
\suma_unidades|Add0~8\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~8_combout\ = ((\B_adj_unidades[3]~0_combout\ $ (\A[3]~input_o\ $ (!\suma_unidades|Add0~7\)))) # (GND)
-- \suma_unidades|Add0~9\ = CARRY((\B_adj_unidades[3]~0_combout\ & ((\A[3]~input_o\) # (!\suma_unidades|Add0~7\))) # (!\B_adj_unidades[3]~0_combout\ & (\A[3]~input_o\ & !\suma_unidades|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B_adj_unidades[3]~0_combout\,
	datab => \A[3]~input_o\,
	datad => VCC,
	cin => \suma_unidades|Add0~7\,
	combout => \suma_unidades|Add0~8_combout\,
	cout => \suma_unidades|Add0~9\);

-- Location: LCCOMB_X32_Y13_N16
\suma_unidades|Add0~10\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_unidades|Add0~10_combout\ = \suma_unidades|Add0~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \suma_unidades|Add0~9\,
	combout => \suma_unidades|Add0~10_combout\);

-- Location: LCCOMB_X30_Y13_N12
\suma_decenas|Add0~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~1_cout\ = CARRY(\suma_unidades|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_unidades|Add0~10_combout\,
	datad => VCC,
	cout => \suma_decenas|Add0~1_cout\);

-- Location: LCCOMB_X30_Y13_N14
\suma_decenas|Add0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~2_combout\ = (\A[4]~input_o\ & ((\B_adj_decenas[0]~2_combout\ & (\suma_decenas|Add0~1_cout\ & VCC)) # (!\B_adj_decenas[0]~2_combout\ & (!\suma_decenas|Add0~1_cout\)))) # (!\A[4]~input_o\ & ((\B_adj_decenas[0]~2_combout\ & 
-- (!\suma_decenas|Add0~1_cout\)) # (!\B_adj_decenas[0]~2_combout\ & ((\suma_decenas|Add0~1_cout\) # (GND)))))
-- \suma_decenas|Add0~3\ = CARRY((\A[4]~input_o\ & (!\B_adj_decenas[0]~2_combout\ & !\suma_decenas|Add0~1_cout\)) # (!\A[4]~input_o\ & ((!\suma_decenas|Add0~1_cout\) # (!\B_adj_decenas[0]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[4]~input_o\,
	datab => \B_adj_decenas[0]~2_combout\,
	datad => VCC,
	cin => \suma_decenas|Add0~1_cout\,
	combout => \suma_decenas|Add0~2_combout\,
	cout => \suma_decenas|Add0~3\);

-- Location: LCCOMB_X30_Y13_N16
\suma_decenas|Add0~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~4_combout\ = ((\A[5]~input_o\ $ (\B[5]~input_o\ $ (!\suma_decenas|Add0~3\)))) # (GND)
-- \suma_decenas|Add0~5\ = CARRY((\A[5]~input_o\ & ((\B[5]~input_o\) # (!\suma_decenas|Add0~3\))) # (!\A[5]~input_o\ & (\B[5]~input_o\ & !\suma_decenas|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[5]~input_o\,
	datab => \B[5]~input_o\,
	datad => VCC,
	cin => \suma_decenas|Add0~3\,
	combout => \suma_decenas|Add0~4_combout\,
	cout => \suma_decenas|Add0~5\);

-- Location: LCCOMB_X30_Y13_N18
\suma_decenas|Add0~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~6_combout\ = (\B_adj_decenas[2]~1_combout\ & ((\A[6]~input_o\ & (\suma_decenas|Add0~5\ & VCC)) # (!\A[6]~input_o\ & (!\suma_decenas|Add0~5\)))) # (!\B_adj_decenas[2]~1_combout\ & ((\A[6]~input_o\ & (!\suma_decenas|Add0~5\)) # 
-- (!\A[6]~input_o\ & ((\suma_decenas|Add0~5\) # (GND)))))
-- \suma_decenas|Add0~7\ = CARRY((\B_adj_decenas[2]~1_combout\ & (!\A[6]~input_o\ & !\suma_decenas|Add0~5\)) # (!\B_adj_decenas[2]~1_combout\ & ((!\suma_decenas|Add0~5\) # (!\A[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \B_adj_decenas[2]~1_combout\,
	datab => \A[6]~input_o\,
	datad => VCC,
	cin => \suma_decenas|Add0~5\,
	combout => \suma_decenas|Add0~6_combout\,
	cout => \suma_decenas|Add0~7\);

-- Location: LCCOMB_X29_Y13_N26
\LessThan1~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (\suma_decenas|Add0~6_combout\) # (\suma_decenas|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \suma_decenas|Add0~6_combout\,
	datad => \suma_decenas|Add0~4_combout\,
	combout => \LessThan1~0_combout\);

-- Location: IOIBUF_X34_Y9_N1
\A[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(7),
	o => \A[7]~input_o\);

-- Location: IOIBUF_X34_Y17_N15
\B[7]~input\ : cyclone10lp_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(7),
	o => \B[7]~input_o\);

-- Location: LCCOMB_X30_Y13_N8
\B_adj_decenas[3]~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \B_adj_decenas[3]~0_combout\ = (\SR~input_o\ & (!\B[5]~input_o\ & (!\B[6]~input_o\ & !\B[7]~input_o\))) # (!\SR~input_o\ & (((\B[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datab => \B[5]~input_o\,
	datac => \B[6]~input_o\,
	datad => \B[7]~input_o\,
	combout => \B_adj_decenas[3]~0_combout\);

-- Location: LCCOMB_X30_Y13_N20
\suma_decenas|Add0~8\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~8_combout\ = ((\A[7]~input_o\ $ (\B_adj_decenas[3]~0_combout\ $ (!\suma_decenas|Add0~7\)))) # (GND)
-- \suma_decenas|Add0~9\ = CARRY((\A[7]~input_o\ & ((\B_adj_decenas[3]~0_combout\) # (!\suma_decenas|Add0~7\))) # (!\A[7]~input_o\ & (\B_adj_decenas[3]~0_combout\ & !\suma_decenas|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A[7]~input_o\,
	datab => \B_adj_decenas[3]~0_combout\,
	datad => VCC,
	cin => \suma_decenas|Add0~7\,
	combout => \suma_decenas|Add0~8_combout\,
	cout => \suma_decenas|Add0~9\);

-- Location: LCCOMB_X29_Y13_N4
\suma_corr_unidades|Add0~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~0_combout\ = \suma_unidades|Add0~4_combout\ $ (VCC)
-- \suma_corr_unidades|Add0~1\ = CARRY(\suma_unidades|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_unidades|Add0~4_combout\,
	datad => VCC,
	combout => \suma_corr_unidades|Add0~0_combout\,
	cout => \suma_corr_unidades|Add0~1\);

-- Location: LCCOMB_X29_Y13_N6
\suma_corr_unidades|Add0~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~2_combout\ = (\suma_unidades|Add0~6_combout\ & (\suma_corr_unidades|Add0~1\ & VCC)) # (!\suma_unidades|Add0~6_combout\ & (!\suma_corr_unidades|Add0~1\))
-- \suma_corr_unidades|Add0~3\ = CARRY((!\suma_unidades|Add0~6_combout\ & !\suma_corr_unidades|Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \suma_unidades|Add0~6_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~1\,
	combout => \suma_corr_unidades|Add0~2_combout\,
	cout => \suma_corr_unidades|Add0~3\);

-- Location: LCCOMB_X29_Y13_N8
\suma_corr_unidades|Add0~4\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~4_combout\ = (\suma_unidades|Add0~8_combout\ & (\suma_corr_unidades|Add0~3\ $ (GND))) # (!\suma_unidades|Add0~8_combout\ & (!\suma_corr_unidades|Add0~3\ & VCC))
-- \suma_corr_unidades|Add0~5\ = CARRY((\suma_unidades|Add0~8_combout\ & !\suma_corr_unidades|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \suma_unidades|Add0~8_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~3\,
	combout => \suma_corr_unidades|Add0~4_combout\,
	cout => \suma_corr_unidades|Add0~5\);

-- Location: LCCOMB_X29_Y13_N10
\suma_corr_unidades|Add0~6\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~6_combout\ = (\suma_decenas|Add0~2_combout\ & (!\suma_corr_unidades|Add0~5\)) # (!\suma_decenas|Add0~2_combout\ & ((\suma_corr_unidades|Add0~5\) # (GND)))
-- \suma_corr_unidades|Add0~7\ = CARRY((!\suma_corr_unidades|Add0~5\) # (!\suma_decenas|Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \suma_decenas|Add0~2_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~5\,
	combout => \suma_corr_unidades|Add0~6_combout\,
	cout => \suma_corr_unidades|Add0~7\);

-- Location: LCCOMB_X29_Y13_N12
\suma_corr_unidades|Add0~8\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~8_combout\ = (\suma_decenas|Add0~4_combout\ & (!\suma_corr_unidades|Add0~7\ & VCC)) # (!\suma_decenas|Add0~4_combout\ & (\suma_corr_unidades|Add0~7\ $ (GND)))
-- \suma_corr_unidades|Add0~9\ = CARRY((!\suma_decenas|Add0~4_combout\ & !\suma_corr_unidades|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \suma_decenas|Add0~4_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~7\,
	combout => \suma_corr_unidades|Add0~8_combout\,
	cout => \suma_corr_unidades|Add0~9\);

-- Location: LCCOMB_X29_Y13_N14
\suma_corr_unidades|Add0~10\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~10_combout\ = (\suma_corr_unidades|Add0~9\ & (\suma_decenas|Add0~6_combout\ $ ((\suma_decenas|Add0~4_combout\)))) # (!\suma_corr_unidades|Add0~9\ & ((\suma_decenas|Add0~6_combout\ $ (!\suma_decenas|Add0~4_combout\)) # (GND)))
-- \suma_corr_unidades|Add0~11\ = CARRY((\suma_decenas|Add0~6_combout\ $ (\suma_decenas|Add0~4_combout\)) # (!\suma_corr_unidades|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \suma_decenas|Add0~6_combout\,
	datab => \suma_decenas|Add0~4_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~9\,
	combout => \suma_corr_unidades|Add0~10_combout\,
	cout => \suma_corr_unidades|Add0~11\);

-- Location: LCCOMB_X29_Y13_N16
\suma_corr_unidades|Add0~12\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~12_combout\ = (\suma_corr_unidades|Add0~11\ & ((\LessThan1~0_combout\ $ (\suma_decenas|Add0~8_combout\)))) # (!\suma_corr_unidades|Add0~11\ & (\LessThan1~0_combout\ $ (\suma_decenas|Add0~8_combout\ $ (VCC))))
-- \suma_corr_unidades|Add0~13\ = CARRY((!\suma_corr_unidades|Add0~11\ & (\LessThan1~0_combout\ $ (\suma_decenas|Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100000110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \suma_decenas|Add0~8_combout\,
	datad => VCC,
	cin => \suma_corr_unidades|Add0~11\,
	combout => \suma_corr_unidades|Add0~12_combout\,
	cout => \suma_corr_unidades|Add0~13\);

-- Location: LCCOMB_X29_Y13_N18
\suma_corr_unidades|Add0~14\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_corr_unidades|Add0~14_combout\ = \suma_corr_unidades|Add0~13\ $ (((\LessThan1~0_combout\ & \suma_decenas|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datad => \suma_decenas|Add0~8_combout\,
	cin => \suma_corr_unidades|Add0~13\,
	combout => \suma_corr_unidades|Add0~14_combout\);

-- Location: LCCOMB_X30_Y13_N22
\suma_decenas|Add0~10\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \suma_decenas|Add0~10_combout\ = \suma_decenas|Add0~9\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \suma_decenas|Add0~9\,
	combout => \suma_decenas|Add0~10_combout\);

-- Location: LCCOMB_X29_Y13_N24
corr_decenas : cyclone10lp_lcell_comb
-- Equation(s):
-- \corr_decenas~combout\ = (\suma_decenas|Add0~10_combout\) # ((\suma_decenas|Add0~8_combout\ & ((\suma_decenas|Add0~6_combout\) # (\suma_decenas|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_decenas|Add0~6_combout\,
	datab => \suma_decenas|Add0~10_combout\,
	datac => \suma_decenas|Add0~8_combout\,
	datad => \suma_decenas|Add0~4_combout\,
	combout => \corr_decenas~combout\);

-- Location: LCCOMB_X32_Y13_N4
\ans1~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans1~0_combout\ = \suma_unidades|Add0~2_combout\ $ (((\SR~input_o\ & ((!\corr_decenas~combout\) # (!\suma_corr_unidades|Add0~14_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_corr_unidades|Add0~14_combout\,
	datab => \corr_decenas~combout\,
	datac => \suma_unidades|Add0~2_combout\,
	datad => \SR~input_o\,
	combout => \ans1~0_combout\);

-- Location: LCCOMB_X29_Y13_N28
\corr_unidades~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \corr_unidades~0_combout\ = (\suma_unidades|Add0~10_combout\) # ((\suma_unidades|Add0~8_combout\ & ((\suma_unidades|Add0~6_combout\) # (\suma_unidades|Add0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_unidades|Add0~8_combout\,
	datab => \suma_unidades|Add0~10_combout\,
	datac => \suma_unidades|Add0~6_combout\,
	datad => \suma_unidades|Add0~4_combout\,
	combout => \corr_unidades~0_combout\);

-- Location: LCCOMB_X30_Y13_N28
\final_unidades[1]~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_unidades[1]~0_combout\ = (\corr_unidades~0_combout\ & (\suma_corr_unidades|Add0~0_combout\)) # (!\corr_unidades~0_combout\ & ((\suma_unidades|Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_unidades~0_combout\,
	datac => \suma_corr_unidades|Add0~0_combout\,
	datad => \suma_unidades|Add0~4_combout\,
	combout => \final_unidades[1]~0_combout\);

-- Location: LCCOMB_X29_Y13_N0
\cout_final~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \cout_final~0_combout\ = (\suma_corr_unidades|Add0~14_combout\ & ((\suma_decenas|Add0~10_combout\) # ((\LessThan1~0_combout\ & \suma_decenas|Add0~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~0_combout\,
	datab => \suma_decenas|Add0~10_combout\,
	datac => \suma_corr_unidades|Add0~14_combout\,
	datad => \suma_decenas|Add0~8_combout\,
	combout => \cout_final~0_combout\);

-- Location: LCCOMB_X29_Y13_N30
\final_unidades[2]~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_unidades[2]~1_combout\ = (\corr_unidades~0_combout\ & ((\suma_corr_unidades|Add0~2_combout\))) # (!\corr_unidades~0_combout\ & (\suma_unidades|Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_unidades~0_combout\,
	datac => \suma_unidades|Add0~6_combout\,
	datad => \suma_corr_unidades|Add0~2_combout\,
	combout => \final_unidades[2]~1_combout\);

-- Location: LCCOMB_X30_Y13_N6
\ans1~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans1~1_combout\ = \final_unidades[2]~1_combout\ $ (((!\cout_final~0_combout\ & (\final_unidades[1]~0_combout\ & \SR~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cout_final~0_combout\,
	datab => \final_unidades[1]~0_combout\,
	datac => \final_unidades[2]~1_combout\,
	datad => \SR~input_o\,
	combout => \ans1~1_combout\);

-- Location: LCCOMB_X29_Y13_N2
\final_unidades[3]~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_unidades[3]~2_combout\ = (\corr_unidades~0_combout\ & (\suma_corr_unidades|Add0~4_combout\)) # (!\corr_unidades~0_combout\ & ((\suma_unidades|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_unidades~0_combout\,
	datac => \suma_corr_unidades|Add0~4_combout\,
	datad => \suma_unidades|Add0~8_combout\,
	combout => \final_unidades[3]~2_combout\);

-- Location: LCCOMB_X30_Y13_N24
\ans1~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans1~2_combout\ = (\SR~input_o\ & ((!\suma_corr_unidades|Add0~14_combout\) # (!\corr_decenas~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_decenas~combout\,
	datac => \suma_corr_unidades|Add0~14_combout\,
	datad => \SR~input_o\,
	combout => \ans1~2_combout\);

-- Location: LCCOMB_X30_Y13_N26
\ans1~3\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans1~3_combout\ = (\final_unidades[3]~2_combout\ & (((!\ans1~2_combout\)))) # (!\final_unidades[3]~2_combout\ & (!\final_unidades[1]~0_combout\ & (!\final_unidades[2]~1_combout\ & \ans1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \final_unidades[3]~2_combout\,
	datab => \final_unidades[1]~0_combout\,
	datac => \final_unidades[2]~1_combout\,
	datad => \ans1~2_combout\,
	combout => \ans1~3_combout\);

-- Location: LCCOMB_X29_Y13_N20
\ans2~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans2~0_combout\ = \ans1~2_combout\ $ (((\corr_decenas~combout\ & (\suma_corr_unidades|Add0~6_combout\)) # (!\corr_decenas~combout\ & ((\suma_decenas|Add0~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_corr_unidades|Add0~6_combout\,
	datab => \corr_decenas~combout\,
	datac => \suma_decenas|Add0~2_combout\,
	datad => \ans1~2_combout\,
	combout => \ans2~0_combout\);

-- Location: LCCOMB_X30_Y13_N0
\final_decenas[1]~0\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_decenas[1]~0_combout\ = (\corr_decenas~combout\ & (\suma_corr_unidades|Add0~8_combout\)) # (!\corr_decenas~combout\ & ((\suma_decenas|Add0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \suma_corr_unidades|Add0~8_combout\,
	datab => \corr_decenas~combout\,
	datad => \suma_decenas|Add0~4_combout\,
	combout => \final_decenas[1]~0_combout\);

-- Location: LCCOMB_X29_Y13_N22
\final_decenas[2]~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_decenas[2]~1_combout\ = (\corr_decenas~combout\ & (\suma_corr_unidades|Add0~10_combout\)) # (!\corr_decenas~combout\ & ((\suma_decenas|Add0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_decenas~combout\,
	datac => \suma_corr_unidades|Add0~10_combout\,
	datad => \suma_decenas|Add0~6_combout\,
	combout => \final_decenas[2]~1_combout\);

-- Location: LCCOMB_X30_Y13_N2
\ans2~1\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans2~1_combout\ = \final_decenas[2]~1_combout\ $ (((\SR~input_o\ & (!\cout_final~0_combout\ & \final_decenas[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100011011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SR~input_o\,
	datab => \final_decenas[2]~1_combout\,
	datac => \cout_final~0_combout\,
	datad => \final_decenas[1]~0_combout\,
	combout => \ans2~1_combout\);

-- Location: LCCOMB_X30_Y13_N4
\final_decenas[3]~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \final_decenas[3]~2_combout\ = (\corr_decenas~combout\ & (\suma_corr_unidades|Add0~12_combout\)) # (!\corr_decenas~combout\ & ((\suma_decenas|Add0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \corr_decenas~combout\,
	datac => \suma_corr_unidades|Add0~12_combout\,
	datad => \suma_decenas|Add0~8_combout\,
	combout => \final_decenas[3]~2_combout\);

-- Location: LCCOMB_X30_Y13_N30
\ans2~2\ : cyclone10lp_lcell_comb
-- Equation(s):
-- \ans2~2_combout\ = (\final_decenas[3]~2_combout\ & (((!\ans1~2_combout\)))) # (!\final_decenas[3]~2_combout\ & (!\final_decenas[2]~1_combout\ & (!\final_decenas[1]~0_combout\ & \ans1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \final_decenas[2]~1_combout\,
	datab => \final_decenas[1]~0_combout\,
	datac => \final_decenas[3]~2_combout\,
	datad => \ans1~2_combout\,
	combout => \ans2~2_combout\);

ww_ans1(0) <= \ans1[0]~output_o\;

ww_ans1(1) <= \ans1[1]~output_o\;

ww_ans1(2) <= \ans1[2]~output_o\;

ww_ans1(3) <= \ans1[3]~output_o\;

ww_ans2(0) <= \ans2[0]~output_o\;

ww_ans2(1) <= \ans2[1]~output_o\;

ww_ans2(2) <= \ans2[2]~output_o\;

ww_ans2(3) <= \ans2[3]~output_o\;

ww_COUT <= \COUT~output_o\;
END structure;


