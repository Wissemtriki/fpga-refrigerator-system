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
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "11/25/2024 00:22:03"

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

ENTITY 	global_lighting_system IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	capteur_mouvement : IN std_logic;
	valeur_luminosite : IN std_logic_vector(7 DOWNTO 0);
	mode_automatique : IN std_logic;
	etat_eclairage : OUT std_logic_vector(1 DOWNTO 0)
	);
END global_lighting_system;

-- Design Ports Information
-- etat_eclairage[0]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- etat_eclairage[1]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[6]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[5]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[4]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[3]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[2]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[1]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[0]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mode_automatique	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- capteur_mouvement	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[7]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF global_lighting_system IS
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
SIGNAL ww_capteur_mouvement : std_logic;
SIGNAL ww_valeur_luminosite : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_mode_automatique : std_logic;
SIGNAL ww_etat_eclairage : std_logic_vector(1 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \valeur_luminosite[6]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[5]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[4]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[3]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[2]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[1]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[0]~input_o\ : std_logic;
SIGNAL \etat_eclairage[0]~output_o\ : std_logic;
SIGNAL \etat_eclairage[1]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \capteur_mouvement~input_o\ : std_logic;
SIGNAL \presence_det_inst|detect_state~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \presence_det_inst|detect_state~q\ : std_logic;
SIGNAL \valeur_luminosite[7]~input_o\ : std_logic;
SIGNAL \luminosity_inst|internal_luminosite~0_combout\ : std_logic;
SIGNAL \luminosity_inst|internal_luminosite~q\ : std_logic;
SIGNAL \mode_automatique~input_o\ : std_logic;
SIGNAL \state_machine_inst|Selector2~0_combout\ : std_logic;
SIGNAL \state_machine_inst|Selector2~1_combout\ : std_logic;
SIGNAL \state_machine_inst|current_state.Eclairage_Automatique~q\ : std_logic;
SIGNAL \state_machine_inst|Selector0~0_combout\ : std_logic;
SIGNAL \state_machine_inst|Selector0~1_combout\ : std_logic;
SIGNAL \state_machine_inst|current_state.Eclairage_Active~q\ : std_logic;
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_capteur_mouvement <= capteur_mouvement;
ww_valeur_luminosite <= valeur_luminosite;
ww_mode_automatique <= mode_automatique;
etat_eclairage <= ww_etat_eclairage;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;

-- Location: IOOBUF_X13_Y0_N16
\etat_eclairage[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state_machine_inst|current_state.Eclairage_Active~q\,
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
	i => \state_machine_inst|current_state.Eclairage_Automatique~q\,
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

-- Location: IOIBUF_X5_Y0_N22
\capteur_mouvement~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_capteur_mouvement,
	o => \capteur_mouvement~input_o\);

-- Location: LCCOMB_X5_Y1_N24
\presence_det_inst|detect_state~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \presence_det_inst|detect_state~feeder_combout\ = \capteur_mouvement~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \capteur_mouvement~input_o\,
	combout => \presence_det_inst|detect_state~feeder_combout\);

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

-- Location: FF_X5_Y1_N25
\presence_det_inst|detect_state\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \presence_det_inst|detect_state~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \presence_det_inst|detect_state~q\);

-- Location: IOIBUF_X7_Y0_N1
\valeur_luminosite[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(7),
	o => \valeur_luminosite[7]~input_o\);

-- Location: LCCOMB_X5_Y1_N14
\luminosity_inst|internal_luminosite~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \luminosity_inst|internal_luminosite~0_combout\ = !\valeur_luminosite[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \valeur_luminosite[7]~input_o\,
	combout => \luminosity_inst|internal_luminosite~0_combout\);

-- Location: FF_X5_Y1_N15
\luminosity_inst|internal_luminosite\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \luminosity_inst|internal_luminosite~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \luminosity_inst|internal_luminosite~q\);

-- Location: IOIBUF_X5_Y0_N15
\mode_automatique~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_mode_automatique,
	o => \mode_automatique~input_o\);

-- Location: LCCOMB_X5_Y1_N18
\state_machine_inst|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine_inst|Selector2~0_combout\ = (\state_machine_inst|current_state.Eclairage_Active~q\ & (\mode_automatique~input_o\ & (!\luminosity_inst|internal_luminosite~q\ & \presence_det_inst|detect_state~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state_machine_inst|current_state.Eclairage_Active~q\,
	datab => \mode_automatique~input_o\,
	datac => \luminosity_inst|internal_luminosite~q\,
	datad => \presence_det_inst|detect_state~q\,
	combout => \state_machine_inst|Selector2~0_combout\);

-- Location: LCCOMB_X5_Y1_N30
\state_machine_inst|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine_inst|Selector2~1_combout\ = (\state_machine_inst|Selector2~0_combout\) # ((!\presence_det_inst|detect_state~q\ & (!\luminosity_inst|internal_luminosite~q\ & \state_machine_inst|current_state.Eclairage_Automatique~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \presence_det_inst|detect_state~q\,
	datab => \luminosity_inst|internal_luminosite~q\,
	datac => \state_machine_inst|current_state.Eclairage_Automatique~q\,
	datad => \state_machine_inst|Selector2~0_combout\,
	combout => \state_machine_inst|Selector2~1_combout\);

-- Location: FF_X5_Y1_N31
\state_machine_inst|current_state.Eclairage_Automatique\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state_machine_inst|Selector2~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_machine_inst|current_state.Eclairage_Automatique~q\);

-- Location: LCCOMB_X5_Y1_N16
\state_machine_inst|Selector0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine_inst|Selector0~0_combout\ = (\luminosity_inst|internal_luminosite~q\ & ((!\state_machine_inst|current_state.Eclairage_Automatique~q\))) # (!\luminosity_inst|internal_luminosite~q\ & (!\mode_automatique~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \mode_automatique~input_o\,
	datac => \state_machine_inst|current_state.Eclairage_Automatique~q\,
	datad => \luminosity_inst|internal_luminosite~q\,
	combout => \state_machine_inst|Selector0~0_combout\);

-- Location: LCCOMB_X5_Y1_N12
\state_machine_inst|Selector0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine_inst|Selector0~1_combout\ = (\presence_det_inst|detect_state~q\ & ((\state_machine_inst|Selector0~0_combout\) # (\luminosity_inst|internal_luminosite~q\ $ (!\state_machine_inst|current_state.Eclairage_Active~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \presence_det_inst|detect_state~q\,
	datab => \luminosity_inst|internal_luminosite~q\,
	datac => \state_machine_inst|current_state.Eclairage_Active~q\,
	datad => \state_machine_inst|Selector0~0_combout\,
	combout => \state_machine_inst|Selector0~1_combout\);

-- Location: FF_X5_Y1_N13
\state_machine_inst|current_state.Eclairage_Active\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state_machine_inst|Selector0~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state_machine_inst|current_state.Eclairage_Active~q\);

-- Location: IOIBUF_X34_Y4_N22
\valeur_luminosite[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(6),
	o => \valeur_luminosite[6]~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\valeur_luminosite[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(5),
	o => \valeur_luminosite[5]~input_o\);

-- Location: IOIBUF_X28_Y24_N22
\valeur_luminosite[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(4),
	o => \valeur_luminosite[4]~input_o\);

-- Location: IOIBUF_X13_Y24_N15
\valeur_luminosite[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(3),
	o => \valeur_luminosite[3]~input_o\);

-- Location: IOIBUF_X23_Y24_N15
\valeur_luminosite[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(2),
	o => \valeur_luminosite[2]~input_o\);

-- Location: IOIBUF_X0_Y18_N15
\valeur_luminosite[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(1),
	o => \valeur_luminosite[1]~input_o\);

-- Location: IOIBUF_X7_Y24_N1
\valeur_luminosite[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(0),
	o => \valeur_luminosite[0]~input_o\);

ww_etat_eclairage(0) <= \etat_eclairage[0]~output_o\;

ww_etat_eclairage(1) <= \etat_eclairage[1]~output_o\;
END structure;


