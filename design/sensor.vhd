----------------------------------------------------------------------------------
-- Company: Team
-- Engineer: Jan Konicek
-- 
-- Create Date: 28.03.2024 09:16:46
-- Design Name: sensor
-- Module Name: sensor - Behavioral
-- Project Name: Smart parking system
-- Target Devices: Nexys A7-50T
-- Tool Versions: Vivado 2023.2
-- Description: Component for reading incomming messages from connected sensor
-- 
-- Dependencies: 
--      IEEE.STD_LOGIC_1164.ALL 
--      IEEE.NUMERIC_STD.all 
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all; -- Package for data types conversion


entity sensor is
        Port ( 
           clk : in STD_LOGIC;            -- device clock (100 MHz)  
           enable : in STD_LOGIC;         -- on/off triggering sensor
           trig : out STD_LOGIC           -- output trigger signal
        );
end sensor;

architecture Behavioral of sensor is

    component clock_enable is
        generic (
            PERIOD : integer := 200000
        );
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               pulse : out STD_LOGIC);
    end component clock_enable;
   
    signal sig_clk_60m : STD_LOGIC; 
    signal sig_clk_10u : STD_LOGIC;
   
    signal sig_trig : std_logic := '1';
    signal is_pulse : integer := 1;
begin

    -- component for generating 60ms pulse
    CLK_60M : clock_enable
    generic map (
        PERIOD => 6000000
    )
    port map (
        clk => clk,
        rst => '0',
        pulse => sig_clk_60m
    );

    -- component for generating 60ms pulse
    CLK_10U : clock_enable
    generic map (
        PERIOD => 1000
    )
    port map (
        clk => clk,
        rst => '0',
        pulse => sig_clk_10u
    );
    
    -- creates 10us pulse every 60ms
    trigger : process (clk) is
    begin
        if rising_edge(clk) then
            if sig_clk_60m = '1' then
                sig_trig <= '1';
                is_pulse <= 1;
            end if;
            
            if sig_clk_10u = '1' and is_pulse = 1 then
                sig_trig <= '0';
                is_pulse <= 0;
            end if;
            
            if enable = '0' then
                sig_trig <= '0';
            end if;
        end if;

    end process trigger;
    
    
    trig <= sig_trig;


end Behavioral;
