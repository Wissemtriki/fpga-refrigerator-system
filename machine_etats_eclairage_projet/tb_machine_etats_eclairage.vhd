library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_machine_etats_eclairage is
end tb_machine_etats_eclairage;

architecture behavior of tb_machine_etats_eclairage is

    -- declaration de composant
    component machine_etats_eclairage
    Port (
        clk               : in  STD_LOGIC;
        reset             : in  STD_LOGIC;
        presence_detectee : in  STD_LOGIC;
        luminosite        : in  STD_LOGIC_VECTOR(7 downto 0);
        mode_automatique  : in  STD_LOGIC;
        etat_eclairage    : out STD_LOGIC_VECTOR(1 downto 0)
    );
    end component;

    -- connection de signaux
    signal clk               : STD_LOGIC := '0';
    signal reset             : STD_LOGIC := '0';
    signal presence_detectee : STD_LOGIC := '0';
    signal luminosite        : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal mode_automatique  : STD_LOGIC := '0';
    signal etat_eclairage    : STD_LOGIC_VECTOR(1 downto 0);

    constant clk_period : time := 10 ns;

begin

    -- instantition de uut
    uut: machine_etats_eclairage
        port map (
            clk => clk,
            reset => reset,
            presence_detectee => presence_detectee,
            luminosite => luminosite,
            mode_automatique => mode_automatique,
            etat_eclairage => etat_eclairage
        );

    -- process de l'horloge
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

    -- process de simulation 
    stim_proc: process
    begin

        reset <= '1';
        wait for clk_period;
        reset <= '0';

        --test cas 1 Presence detected, luminosity low, automatic mode
        presence_detectee <= '1';
        luminosite <= "00001111"; -- Low luminosity
        mode_automatique <= '1';
        wait for clk_period;

        --test cas 2 Presence detected, luminosity high
        luminosite <= "11111111"; -- High luminosity
        wait for clk_period;

        --test cas 3 No presence detected
        presence_detectee <= '0';
        wait for clk_period;

        --test cas 4 Automatic mode activated, luminosity low
        presence_detectee <= '1'; -- Presence detected again
        luminosite <= "00001111"; -- Low luminosity
        wait for clk_period;

        --test cas 5: Check inactive state
        presence_detectee <= '0';
        wait for clk_period;
        wait;
    end process;

end behavior;
