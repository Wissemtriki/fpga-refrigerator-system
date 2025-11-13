library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_detection_presence is
end tb_detection_presence;

architecture Behavioral of tb_detection_presence is
    
    signal capteur_mouvement : std_logic := '0';
    signal clk               : std_logic := '0';
    signal reset             : std_logic := '1';
    signal presence_detectee : std_logic;

begin
    -- T= 20 ns
    clk_process : process
    begin
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
    end process;

    
    DUT: entity work.detection_presence
    port map (
        capteur_mouvement => capteur_mouvement,
        clk               => clk,
        reset             => reset,
        presence_detectee => presence_detectee
    );

    -- Stimulus process to provide test inputs
    stim_proc: process
    begin
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        
        -- cas1: No motion detected
        capteur_mouvement <= '0';
        wait for 100 ns;

        --cas2: Motion detected
        capteur_mouvement <= '1';
        wait for 100 ns;

        -- cas3: No motion after detection
        capteur_mouvement <= '0';
        wait for 100 ns;
        -- cas5: Reset the system after detecting motion
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        
        wait;
    end process;

end Behavioral;
