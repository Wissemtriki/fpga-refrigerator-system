library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity mesure_luminosite is
    Port (
        valeur_luminosite : in std_logic_vector(7 downto 0);  --entree sur 8bits de capteur
        clk               : in std_logic;
        reset             : in std_logic;
        niveau_lumiere    : out std_logic                     -- sortie pour le niveaux de lumiere
    );
end mesure_luminosite;

architecture Behavioral of mesure_luminosite is
    signal internal_luminosite : std_logic;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            internal_luminosite <= '0';
        elsif rising_edge(clk) then
            if valeur_luminosite < "10000000" then  -- test pour low light
                internal_luminosite <= '1';  -- Low light level
            else
                internal_luminosite <= '0';  --High light level
            end if;
        end if;
    end process;

    niveau_lumiere <= internal_luminosite;
end Behavioral;
