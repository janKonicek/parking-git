-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 07:33:25 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_sensor is
end tb_sensor;

architecture tb of tb_sensor is

    component sensor
        port (clk  : in std_logic;
              trig : out std_logic);
    end component;

    signal clk  : std_logic;
    signal trig : std_logic;

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : sensor
    port map (clk  => clk,
              trig => trig);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed

        -- EDIT Add stimuli here
        wait for 14000000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_sensor of tb_sensor is
    for tb
    end for;
end cfg_tb_sensor;