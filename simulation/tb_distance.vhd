-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 10.4.2024 16:14:58 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_distance is
end tb_distance;

architecture tb of tb_distance is

    component distance
        port (clk : in std_logic;
              echo     : in std_logic;
              dist      : out std_logic_vector (8 downto 0):= (others => '0'));
    end component;

    signal clk : std_logic;
    signal echo      : std_logic;
    signal dist      : std_logic_vector (8 downto 0):= (others => '0');

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : distance
    port map (clk => clk,
              echo     => echo,
              dist      => dist);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK100MHZ is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
       
        -- for k in 0 to 20 loop
        --    echo <= '0';        
        --    wait for 200 us;
        --    echo <= '1';
        --    wait for 200 us;
        -- end loop;
        -- echo <= '0';
               
        echo <= '1';
        wait for 600 us;
        echo <= '0';
        wait for 100 us;
        echo <= '1';
        wait for 400 us;
        echo <= '0';
        wait for 100 us;
        echo <= '1';
        wait for 8600 us;
        echo <= '0';
        
        -- Stop the cl 
        -- Stop the clock and hence terminate the simulation
        -- TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_distance of tb_distance is
    for tb
    end for;
end cfg_tb_distance;