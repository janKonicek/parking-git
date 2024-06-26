-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 11.4.2024 08:05:21 UTC

library ieee;
use ieee.std_logic_1164.all;

entity tb_led is
end tb_led;

architecture tb of tb_led is

    component led
        port (dist  : in std_logic_vector (8 downto 0);
              LED_A : out std_logic_vector (7 downto 0));
    end component;

    signal dist  : std_logic_vector (8 downto 0);
    signal LED_A : std_logic_vector (7 downto 0);

begin

    dut : led
    port map (dist  => dist,
              LED_A => LED_A);

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed 
        dist <= "111000111";
        wait for 100ns;
        dist <= "011000111";
        wait for 100ns;
        dist <= "001010111";
        wait for 100ns;
        dist <= "000100110";
        wait for 100ns;
        dist <= "000010001";
        wait for 100ns;
        dist <= "000001010";
        wait for 100ns;
        dist <= "000000110";
        wait for 100ns;
        dist <= "000000010";
        wait for 100ns;
        dist <= "000000001";
        wait for 100ns;
        dist <= "000000000";
        wait for 100ns;
        -- EDIT Add stimuli here
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_led of tb_led is
    for tb
    end for;
end cfg_tb_led;