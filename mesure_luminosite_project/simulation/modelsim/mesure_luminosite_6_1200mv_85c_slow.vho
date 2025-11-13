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

-- DATE "10/06/2024 11:32:31"

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

ENTITY 	mesure_luminosite IS
    PORT (
	valeur_luminosite : IN std_logic_vector(7 DOWNTO 0);
	clk : IN std_logic;
	reset : IN std_logic;
	niveau_lumiere : OUT std_logic
	);
END mesure_luminosite;

-- Design Ports Information
-- niveau_lumiere	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[6]	=>  Location: PIN_38,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[5]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[4]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[3]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[2]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[1]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[0]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- valeur_luminosite[7]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mesure_luminosite IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_valeur_luminosite : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_niveau_lumiere : std_logic;
SIGNAL \valeur_luminosite[6]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[5]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[4]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[3]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[2]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[1]~input_o\ : std_logic;
SIGNAL \valeur_luminosite[0]~input_o\ : std_logic;
SIGNAL \niveau_lumiere~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \valeur_luminosite[7]~input_o\ : std_logic;
SIGNAL \internal_luminosite~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \internal_luminosite~q\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_valeur_luminosite <= valeur_luminosite;
ww_clk <= clk;
ww_reset <= reset;
niveau_lumiere <= ww_niveau_lumiere;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X32_Y0_N9
\niveau_lumiere~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \internal_luminosite~q\,
	devoe => ww_devoe,
	o => \niveau_lumiere~output_o\);

-- Location: IOIBUF_X32_Y0_N22
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\valeur_luminosite[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(7),
	o => \valeur_luminosite[7]~input_o\);

-- Location: LCCOMB_X31_Y3_N16
\internal_luminosite~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \internal_luminosite~0_combout\ = !\valeur_luminosite[7]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \valeur_luminosite[7]~input_o\,
	combout => \internal_luminosite~0_combout\);

-- Location: IOIBUF_X18_Y0_N15
\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: FF_X31_Y3_N17
internal_luminosite : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \internal_luminosite~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \internal_luminosite~q\);

-- Location: IOIBUF_X1_Y0_N22
\valeur_luminosite[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(6),
	o => \valeur_luminosite[6]~input_o\);

-- Location: IOIBUF_X21_Y0_N8
\valeur_luminosite[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(5),
	o => \valeur_luminosite[5]~input_o\);

-- Location: IOIBUF_X23_Y24_N1
\valeur_luminosite[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(4),
	o => \valeur_luminosite[4]~input_o\);

-- Location: IOIBUF_X16_Y0_N22
\valeur_luminosite[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(3),
	o => \valeur_luminosite[3]~input_o\);

-- Location: IOIBUF_X1_Y0_N15
\valeur_luminosite[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(2),
	o => \valeur_luminosite[2]~input_o\);

-- Location: IOIBUF_X16_Y0_N8
\valeur_luminosite[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(1),
	o => \valeur_luminosite[1]~input_o\);

-- Location: IOIBUF_X18_Y24_N15
\valeur_luminosite[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_valeur_luminosite(0),
	o => \valeur_luminosite[0]~input_o\);

ww_niveau_lumiere <= \niveau_lumiere~output_o\;
END structure;


