-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Full Version"

-- DATE "10/06/2024 12:11:00"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	machine_etats_eclairage IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	presence_detectee : IN std_logic;
	luminosite : IN std_logic_vector(7 DOWNTO 0);
	mode_automatique : IN std_logic;
	etat_eclairage : OUT std_logic_vector(1 DOWNTO 0)
	);
END machine_etats_eclairage;

-- Design Ports Information
-- etat_eclairage[0]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- etat_eclairage[1]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- presence_detectee	=>  Location: PIN_34,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[4]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[5]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mode_automatique	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[6]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[7]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[0]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[1]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[2]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- luminosite[3]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF machine_etats_eclairage IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_presence_detectee : std_logic;
SIGNAL ww_luminosite : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_mode_automatique : std_logic;
SIGNAL ww_etat_eclairage : std_logic_vector(1 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \etat_eclairage[0]~output_o\ : std_logic;
SIGNAL \etat_eclairage[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \presence_detectee~input_o\ : std_logic;
SIGNAL \luminosite[2]~input_o\ : std_logic;
SIGNAL \luminosite[0]~input_o\ : std_logic;
SIGNAL \luminosite[1]~input_o\ : std_logic;
SIGNAL \luminosite[3]~input_o\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \luminosite[5]~input_o\ : std_logic;
SIGNAL \luminosite[4]~input_o\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \mode_automatique~input_o\ : std_logic;
SIGNAL \luminosite[7]~input_o\ : std_logic;
SIGNAL \luminosite[6]~input_o\ : std_logic;
SIGNAL \Selector2~0_combout\ : std_logic;
SIGNAL \Selector0~0_combout\ : std_logic;
SIGNAL \Selector2~2_combout\ : std_logic;
SIGNAL \Selector2~3_combout\ : std_logic;
SIGNAL \Selector2~1_combout\ : std_logic;
SIGNAL \Selector2~4_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \current_state.Eclairage_Automatique~q\ : std_logic;
SIGNAL \Selector0~1_combout\ : std_logic;
SIGNAL \Selector0~2_combout\ : std_logic;
SIGNAL \current_state.Eclairage_Active~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_presence_detectee <= presence_detectee;
ww_luminosite <= luminosite;
ww_mode_automatique <= mode_automatique;
etat_eclairage <= ww_etat_eclairage;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X5_Y0_N16
\etat_eclairage[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.Eclairage_Active~q\,
	devoe => ww_devoe,
	o => \etat_eclairage[0]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\etat_eclairage[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \current_state.Eclairage_Automatique~q\,
	devoe => ww_devoe,
	o => \etat_eclairage[1]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y5_N15
\presence_detectee~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_presence_detectee,
	o => \presence_detectee~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\luminosite[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(2),
	o => \luminosite[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N1
\luminosite[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(0),
	o => \luminosite[0]~input_o\);

-- Location: IOIBUF_X13_Y0_N1
\luminosite[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(1),
	o => \luminosite[1]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\luminosite[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(3),
	o => \luminosite[3]~input_o\);

-- Location: LCCOMB_X16_Y1_N4
\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (((!\luminosite[3]~input_o\) # (!\luminosite[1]~input_o\)) # (!\luminosite[0]~input_o\)) # (!\luminosite[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \luminosite[2]~input_o\,
	datab => \luminosite[0]~input_o\,
	datac => \luminosite[1]~input_o\,
	datad => \luminosite[3]~input_o\,
	combout => \LessThan1~1_combout\);

-- Location: IOIBUF_X1_Y0_N22
\luminosite[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(5),
	o => \luminosite[5]~input_o\);

-- Location: IOIBUF_X13_Y0_N15
\luminosite[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(4),
	o => \luminosite[4]~input_o\);

-- Location: LCCOMB_X5_Y1_N8
\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!\luminosite[4]~input_o\) # (!\luminosite[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \luminosite[5]~input_o\,
	datad => \luminosite[4]~input_o\,
	combout => \LessThan1~0_combout\);

-- Location: IOIBUF_X5_Y0_N22
\mode_automatique~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mode_automatique,
	o => \mode_automatique~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\luminosite[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(7),
	o => \luminosite[7]~input_o\);

-- Location: IOIBUF_X7_Y0_N1
\luminosite[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_luminosite(6),
	o => \luminosite[6]~input_o\);

-- Location: LCCOMB_X5_Y1_N22
\Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~0_combout\ = (\mode_automatique~input_o\ & (!\luminosite[7]~input_o\ & !\luminosite[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mode_automatique~input_o\,
	datac => \luminosite[7]~input_o\,
	datad => \luminosite[6]~input_o\,
	combout => \Selector2~0_combout\);

-- Location: LCCOMB_X5_Y1_N0
\Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~0_combout\ = (\LessThan1~1_combout\ & (((\Selector2~0_combout\) # (!\current_state.Eclairage_Active~q\)))) # (!\LessThan1~1_combout\ & (\LessThan1~0_combout\ & ((\Selector2~0_combout\) # (!\current_state.Eclairage_Active~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan1~1_combout\,
	datab => \LessThan1~0_combout\,
	datac => \Selector2~0_combout\,
	datad => \current_state.Eclairage_Active~q\,
	combout => \Selector0~0_combout\);

-- Location: LCCOMB_X5_Y1_N30
\Selector2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~2_combout\ = (\presence_detectee~input_o\ & (\luminosite[5]~input_o\ & ((\luminosite[4]~input_o\)))) # (!\presence_detectee~input_o\ & (((\luminosite[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \luminosite[5]~input_o\,
	datab => \luminosite[6]~input_o\,
	datac => \presence_detectee~input_o\,
	datad => \luminosite[4]~input_o\,
	combout => \Selector2~2_combout\);

-- Location: LCCOMB_X5_Y1_N12
\Selector2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~3_combout\ = (\Selector2~2_combout\ & (!\LessThan1~1_combout\ & ((\presence_detectee~input_o\) # (!\LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~2_combout\,
	datab => \LessThan1~0_combout\,
	datac => \presence_detectee~input_o\,
	datad => \LessThan1~1_combout\,
	combout => \Selector2~3_combout\);

-- Location: LCCOMB_X5_Y1_N28
\Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~1_combout\ = (\presence_detectee~input_o\ & (((\current_state.Eclairage_Active~q\)))) # (!\presence_detectee~input_o\ & (!\luminosite[7]~input_o\ & (\current_state.Eclairage_Automatique~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \presence_detectee~input_o\,
	datab => \luminosite[7]~input_o\,
	datac => \current_state.Eclairage_Automatique~q\,
	datad => \current_state.Eclairage_Active~q\,
	combout => \Selector2~1_combout\);

-- Location: LCCOMB_X5_Y1_N26
\Selector2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector2~4_combout\ = (!\Selector2~3_combout\ & (\Selector2~1_combout\ & ((\Selector2~0_combout\) # (!\presence_detectee~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Selector2~3_combout\,
	datab => \presence_detectee~input_o\,
	datac => \Selector2~0_combout\,
	datad => \Selector2~1_combout\,
	combout => \Selector2~4_combout\);

-- Location: IOIBUF_X0_Y11_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X5_Y1_N27
\current_state.Eclairage_Automatique\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector2~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Eclairage_Automatique~q\);

-- Location: LCCOMB_X5_Y1_N2
\Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~1_combout\ = (\current_state.Eclairage_Automatique~q\ & ((\luminosite[7]~input_o\) # ((\luminosite[6]~input_o\ & !\Selector0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \current_state.Eclairage_Automatique~q\,
	datab => \luminosite[6]~input_o\,
	datac => \luminosite[7]~input_o\,
	datad => \Selector0~0_combout\,
	combout => \Selector0~1_combout\);

-- Location: LCCOMB_X5_Y1_N24
\Selector0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Selector0~2_combout\ = (\presence_detectee~input_o\ & ((\current_state.Eclairage_Active~q\ & (!\Selector0~0_combout\)) # (!\current_state.Eclairage_Active~q\ & ((!\Selector0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \presence_detectee~input_o\,
	datab => \Selector0~0_combout\,
	datac => \current_state.Eclairage_Active~q\,
	datad => \Selector0~1_combout\,
	combout => \Selector0~2_combout\);

-- Location: FF_X5_Y1_N25
\current_state.Eclairage_Active\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Selector0~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \current_state.Eclairage_Active~q\);

ww_etat_eclairage(0) <= \etat_eclairage[0]~output_o\;

ww_etat_eclairage(1) <= \etat_eclairage[1]~output_o\;
END structure;


