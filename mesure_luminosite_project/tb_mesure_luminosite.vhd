library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_mesure_luminosite is
end tb_mesure_luminosite;

architecture Behavioral of tb_mesure_luminosite is
    signal valeur_luminosite : std_logic_vector(7 downto 0) := "00000000";
    signal clk               : std_logic := '0';
    signal reset             : std_logic := '1';
    signal niveau_lumiere    : std_logic;
    
begin
    
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    -- UUT
    UUT: entity work.mesure_luminosite
    port map (
        valeur_luminosite => valeur_luminosite,
        clk               => clk,
        reset             => reset,
        niveau_lumiere    => niveau_lumiere
    );
    
    -- process de simulation
    stim_proc: process
    begin
        reset <= '1';  
        wait for 100 ns;
        reset <= '0';  
        valeur_luminosite <= "01000000";  -- simulation de niveaux de lumiere moyen
        wait for 50 ns;
        valeur_luminosite <= "11000000";  --simulation de niveaux de lumiere elevée
        wait for 100 ns;
        wait;
    end process;
end Behavioral;
