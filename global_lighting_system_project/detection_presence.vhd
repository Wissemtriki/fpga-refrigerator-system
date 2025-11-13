library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity detection_presence is
    Port (
        capteur_mouvement : in std_logic;  -- entree du capteur
        clk               : in std_logic;  
        reset             : in std_logic;  
        presence_detectee : out std_logic  
    );
end detection_presence;

architecture Behavioral of detection_presence is
    signal detect_state : std_logic := '0';  -- signal interne pour presence_detectee
begin
    process(clk, reset)
    begin
        if reset = '1' then
            detect_state <= '0';  -- pas de detection
        elsif rising_edge(clk) then
            if capteur_mouvement = '1' then
                detect_state <= '1';  -- presence detecter
            else
                detect_state <= '0';  -- pas de detection
            end if;
        end if;
    end process;

    -- affecter la sortie avec le signal
    presence_detectee <= detect_state;

end Behavioral;
