----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.03.2024 09:47:06
-- Design Name: 
-- Module Name: clock_enable - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.math_real.all;


entity clock_enable is
    generic (
        PERIOD : integer := 6
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end clock_enable;

architecture behavioral of clock_enable is
    --! Get number for needed bits for PERIOD value
    constant bits_needed : integer := integer(ceil(log2(real(PERIOD + 1))));

    --! Local counter with needed number of bits
    signal sig_count : std_logic_vector(bits_needed - 1 downto 0);
begin

    --! Generate clock enable signal. By default, enable signal
    --! is low and generated pulse is always one clock long.
    p_clk_enable : process (clk) is
    begin

        -- Synchronous proces
        if (rising_edge(clk)) then
            -- if high-active reset then
            if rst = '1' then    
                -- Clear all bits of local counter
                sig_count <= (others => '0');
                -- Set output `pulse` to low
                pulse <= '0';
            
            -- elsif sig_count is PERIOD-1 then
            elsif sig_count = PERIOD-1 then
                -- Clear all bits of local counter
                sig_count <= (others => '0');
                -- Set output `pulse` to high
                pulse <= '1';
            
            -- else
            else
                -- Increment local counter
                sig_count <= sig_count +1;
                -- Set output `pulse` to low
                pulse <= '0';
            end if;
            -- Each `if` must end by `end if`
        end if;

    end process p_clk_enable;
    
end Behavioral;
