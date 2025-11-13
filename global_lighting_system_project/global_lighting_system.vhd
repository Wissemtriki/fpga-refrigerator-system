library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity global_lighting_system is
    Port (
        clk                : in  std_logic;                 -- Clock signal
        reset              : in  std_logic;                 -- Reset signal
        capteur_mouvement  : in  std_logic;                 -- Movement sensor input
        valeur_luminosite  : in  std_logic_Vector(7 downto 0); -- Luminosity input
        mode_automatique   : in  std_logic;                 -- Automatic mode input
        etat_eclairage     : out std_logic_vector(1 downto 0)  -- Lighting state output
    );
end global_lighting_system;

architecture Behavioral of global_lighting_system is
    signal presence_detectee : std_logic;                  -- sortie de detection
    signal niveau_lumiere    : std_logic;                  -- sortie de mesure de luminosité

    -- Component declarations for the modules
    component detection_presence is
        Port (
            capteur_mouvement : in std_logic;
            clk               : in std_logic;
            reset             : in std_logic;
            presence_detectee : out std_logic
        );
    end component;

    component mesure_luminosite is
        Port (
            valeur_luminosite : in std_logic_vector(7 downto 0);
            clk               : in std_logic;
            reset             : in std_logic;
            niveau_lumiere    : out std_logic
        );
    end component;

    component machine_etats_eclairage is
        Port (
            clk               : in  std_logic;
            reset             : in  std_logic;
            presence_detectee : in  std_logic;
            luminosite        : in  std_logic;
            mode_automatique  : in  std_logic;
            etat_eclairage    : out std_logic_vector(1 downto 0)
        );
    end component;

begin
    -- Instantiation de module de detection de presence
    presence_det_inst: detection_presence
        Port map (
            capteur_mouvement  => capteur_mouvement,
            clk                => clk,
            reset              => reset,
            presence_detectee  => presence_detectee
        );

    -- Instantiation de module de mesure de luminosite
    luminosity_inst: mesure_luminosite
        Port map (
            valeur_luminosite  => valeur_luminosite,
            clk                => clk,
            reset              => reset,
            niveau_lumiere     => niveau_lumiere
        );

    -- Instantiation de module de machine d'etat pour le controle d'éclairage
    state_machine_inst: machine_etats_eclairage
        Port map (
            clk                => clk,
            reset              => reset,
            presence_detectee  => presence_detectee,
            luminosite         => niveau_lumiere, -- connection de l'input de valeur de luminosité directement au machine d'état
            mode_automatique   => mode_automatique,
            etat_eclairage     => etat_eclairage
        );

end Behavioral;