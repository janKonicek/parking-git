----------------------------------------------------------------------------------
-- Company: Team
-- Engineer: Jan Konicek, Marek Klvana, Martin Koplik, Vojtech Larva
-- 
-- Create Date: 10.04.2024 22:03:27
-- Design Name: top level
-- Module Name: top_level - Behavioral
-- Project Name: Smart parking system
-- Target Devices: Nexys A7-50T
-- Tool Versions: Vivado 2023.2
-- Description: Top level of all component
-- 
-- Dependencies: 
--      IEEE.STD_LOGIC_1164.ALL
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top_level is
    Port ( 
           CLK100MHZ : in STD_LOGIC;
           TRIG : out STD_LOGIC_VECTOR (1 downto 0);
           ECHO : in STD_LOGIC_VECTOR (1 downto 0);
           SW : in STD_LOGIC_VECTOR (1 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           DP : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           LED_L: out std_logic_vector (7 downto 0);
           LED_R: out std_logic_vector (7 downto 0));
end top_level;

architecture Behavioral of top_level is

    -- Component distance declaration
    component distance
        port (
            clk       : in std_logic;
            echo      : in std_logic;
            dist      : out std_logic_vector (8 downto 0):= (others => '0'));
    end component;

    -- Component sensor declaration
    component sensor
        port ( 
            clk    : in std_logic;
            enable : in std_logic; 
            trig   : out std_logic
            );
    end component;

    -- Component display declaration
    component display
        port (
            clk       : in std_logic;
            dist1     : in std_logic_vector (8 downto 0);
            dist2     : in STD_LOGIC_VECTOR (8 downto 0);
            CA        : out std_logic;
            CB        : out std_logic;
            CC        : out std_logic;
            CD        : out std_logic;
            CE        : out std_logic;
            CF        : out std_logic;
            CG        : out std_logic;
            DP        : out std_logic;
            AN        : out std_logic_vector (7 downto 0)
            );
    end component;
    
    -- Component led declaration
    component led
        port ( 
            dist : in STD_LOGIC_VECTOR (8 downto 0):= (others => '0');
            LED : out STD_LOGIC_VECTOR (7 downto 0):= (others => '0')
            );
    end component;

    -- internal distance signals
    signal dist1, dist2 : std_logic_vector (8 downto 0);
    
begin
        
    -- create trigger signal for sensor 1
    TRIGGER1 : sensor
    Port map(   clk => CLK100MHZ,
                enable => SW(0),
                trig => TRIG(0)      
            );
            
    -- create trigger signal for sensor 2
    TRIGGER2 : sensor
    Port map(   clk => CLK100MHZ,
                enable => SW(1),
                trig => TRIG(1)
            );


    -- reads data from sensor 2
    DISTANCE1 : distance
    Port map(   clk => CLK100MHZ,
                echo => ECHO(0),
                dist => dist1
    );

    -- reads data from sensor 2
    DISTANCE2 : distance
    Port map(   clk => CLK100MHZ,
                echo => ECHO(1),
                dist => dist2
    );

    -- displays data from sensors
    DISPLAY_OUTPUT : display
    Port map(   clk => CLK100MHZ,
                dist1 => dist1,
                dist2 => dist2,
                CA => CA,
                CB => CB,
                CC => CC,
                CD => CD,
                CE => CE,
                CF => CF,
                CG => CG,
                DP => DP,
                AN => AN
    );

    -- LEDs
    LED_LEFT : led
    Port map(   dist => dist1,
                LED => LED_R
    );

    LED_RIGHT : led
    Port map(   dist => dist2,
                LED => LED_L
    );


end Behavioral;
