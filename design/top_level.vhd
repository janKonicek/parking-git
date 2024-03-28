----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.03.2024 10:32:57
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_level is
    Port ( 
           CLK100MHZ : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           LED16_B : out std_logic;
           LED : out std_logic_vector (3 downto 0)
    );
end top_level;

architecture Behavioral of top_level is
    -- Component declaration for clock enable
    component clock_enable is
        generic (
            PERIOD : integer := 200000
        );
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               pulse : out STD_LOGIC);
    end component clock_enable;

    -- Component declaration for simple counter
    component simple_counter is
        generic (
           N : integer := 4
        );
    
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               en : in STD_LOGIC;
               count : out STD_LOGIC_VECTOR (N-1 downto 0));
    end component simple_counter;
    
    -- component
   component debounce is
        Port (clk     : in std_logic;
              rst     : in std_logic;
              en      : in std_logic;
              bouncey : in std_logic;
              clean   : out std_logic;
              pos_edge : out std_logic;
              neg_edge : out std_logic);
    end component debounce;
    
    -- Signals
    signal sig_en_2ms : std_logic;
    signal sig_event : std_logic;
    signal sig_open : std_logic;
begin

    -- Component instantiation of clock enable for 250 ms
    CLK_EN : clock_enable
    Port map (
        clk => CLK100MHz,
        rst => BTNC,
        pulse => sig_en_2ms
    );

    -- Component instantiation of 4-bit simple counter
    COUNTER : simple_counter
    Port map (
        clk => CLK100MHz,
        rst => BTNC,
        en => sig_event,
        count => LED
    );
    
    DEBOUNCE_M : debounce
    Port map (
        clk => CLK100MHz,
        rst => BTNC,
        bouncey => sig_event,
        en => sig_en_2ms,
        pos_edge => sig_event,
        neg_edge => sig_open,
        clean => LED16_B
    );


end Behavioral;
