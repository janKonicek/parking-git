----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 22:03:27
-- Design Name: 
-- Module Name: top_level - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
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

    component distance
        port (
            clk       : in std_logic;
            echo      : in std_logic;
            dist      : out std_logic_vector (8 downto 0):= (others => '0'));
    end component;

    
    component sensor
        port ( 
            clk    : in std_logic; 
            trig   : out std_logic
            );
    end component;


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
    
    -- internal distance signals
    signal dist1, dist2 : std_logic_vector (8 downto 0);
    
begin

    -- distance trigger 1
    TRIGGER1 : sensor
    Port map(   clk => CLK100MHZ,
                trig => TRIG(0)      
            );
            
    -- distance trigger 2
    TRIGGER2 : sensor
    Port map(   clk => CLK100MHZ,
                trig => TRIG(1)      
            );

    -- distance sensor 1
    DISTANCE1 : distance
    Port map(   clk => CLK100MHZ,
                echo => ECHO(0),
                dist => dist1
    );

    -- distance sensor 2
    DISTANCE2 : distance
    Port map(   clk => CLK100MHZ,
                echo => ECHO(1),
                dist => dist2
    );

    -- display
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


end Behavioral;
