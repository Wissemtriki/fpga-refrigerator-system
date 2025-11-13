library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity machine_etats_eclairage is
    Port (
        clk               : in  STD_LOGIC;
        reset             : in  STD_LOGIC;
        presence_detectee : in  STD_LOGIC;
        luminosite        : in  STD_LOGIC_VECTOR(7 downto 0); -- luminosité sur 8 bits
        mode_automatique  : in  STD_LOGIC;
        etat_eclairage    : out STD_LOGIC_VECTOR(1 downto 0) -- l'etat déclairage sur 2 bits 1 ou 0
    );
end machine_etats_eclairage;

architecture behavioral of machine_etats_eclairage is

    type state_type is (Eclairage_Active, Eclairage_Inactif, Eclairage_Automatique);
    signal current_state : state_type := Eclairage_Inactif; 
    signal next_state   : state_type;

begin

    -- process de transition
    process(clk, reset)
    begin
        if reset = '1' then
            current_state <= Eclairage_Inactif;  
        elsif rising_edge(clk) then
            current_state <= next_state;  
        end if;
    end process;

    -- process pour next state
    process(current_state, presence_detectee, luminosite, mode_automatique)
    begin
        case current_state is
            when Eclairage_Active =>
                if presence_detectee = '0' then
                    next_state <= Eclairage_Inactif;
                elsif mode_automatique = '1' and luminosite < "00111111" then
                    next_state <= Eclairage_Automatique;
                else
                    next_state <= Eclairage_Active; -- loop pour eclairage active
                end if;

            when Eclairage_Inactif =>
                if presence_detectee = '1' then
                    next_state <= Eclairage_Active;
                else
                    next_state <= Eclairage_Inactif; -- loop pour eclairage inactive
                end if;

            when Eclairage_Automatique =>
                if luminosite >= "01111111" then
                    next_state <= Eclairage_Inactif;
                elsif presence_detectee = '1' then
                    next_state <= Eclairage_Active;
                else
                    next_state <= Eclairage_Automatique; -- loop pour eclairage automatique
                end if;

            when others =>
                next_state <= Eclairage_Inactif; --etat par defaut
        end case;
    end process;

    -- process pour connaitre les sorties
    process(current_state)
    begin
        case current_state is
            when Eclairage_Active =>
                etat_eclairage <= "01"; -- Active state
            when Eclairage_Inactif =>
                etat_eclairage <= "00"; -- Inactive state
            when Eclairage_Automatique =>
                etat_eclairage <= "10"; -- Automatic state
            when others =>
                etat_eclairage <= "00"; -- inactif par defaut
        end case;
    end process;

end behavioral;
