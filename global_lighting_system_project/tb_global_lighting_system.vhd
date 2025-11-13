library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_global_lighting_system is
end tb_global_lighting_system;

architecture Behavioral of tb_global_lighting_system is
    -- Declaration de composant de global lighting system
    component global_lighting_system is
        Port (
            clk                : in  std_logic;
            reset              : in  std_logic;
            capteur_mouvement  : in  std_logic;
            valeur_luminosite  : in  std_logic_vector(7 downto 0);
            mode_automatique   : in  std_logic;
            etat_eclairage     : out std_logic_vector(1 downto 0)
        );
    end component;

    -- Les signaux de testbench
    signal clk                : std_logic := '0';
    signal reset              : std_logic := '0';
    signal capteur_mouvement  : std_logic := '0';
    signal valeur_luminosite  : std_logic_vector(7 downto 0) := (others => '0');
    signal mode_automatique   : std_logic := '0';
    signal etat_eclairage     : std_logic_vector(1 downto 0);

    -- generation de clock
    constant clk_period : time := 10 ns;

begin
    -- Instantiation de global lighting system
    uut: global_lighting_system
        Port map (
            clk                => clk,
            reset              => reset,
            capteur_mouvement  => capteur_mouvement,
            valeur_luminosite  => valeur_luminosite,
            mode_automatique   => mode_automatique,
            etat_eclairage     => etat_eclairage
        );

    -- Process de CLK
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period / 2;
        clk <= '1';
        wait for clk_period / 2;
    end process;

    -- process de simulation
    stimulus_process : process
    begin
        -- Reset de system
        reset <= '1';
        wait for clk_period;
        reset <= '0';
        wait for clk_period;

        -- Test cas 1: No presence detected, high light level
        capteur_mouvement <= '0';
        valeur_luminosite <= "11111111"; -- High light
        wait for clk_period * 5;

        -- Test cas 2: Presence detected, low light level
        capteur_mouvement <= '1';
        valeur_luminosite <= "00000000"; -- Low light
        wait for clk_period * 5;

        -- Test cas 3: Presence detected, automatic mode
        mode_automatique <= '1';
        wait for clk_period * 5;

        -- Test cas 4: Presence not detected, switch to inactive state
        capteur_mouvement <= '0';
        wait for clk_period * 5;

        -- Test cas 5: Change luminosity to high, check automatic mode
        valeur_luminosite <= "11111111"; -- High light
        wait for clk_period * 5;

        -- Test cas 6: Enable automatic mode again
        mode_automatique <= '1';
        wait for clk_period * 5;

        -- fin de simulation
        wait;
    end process;

end Behavioral;
