-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 10.4.2024 21:33:44 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_display is
end tb_display;

architecture tb of tb_display is

    component display
        port (clk   : in std_logic;
              dist1 : in std_logic_vector (8 downto 0);
              dist2 : in std_logic_vector (8 downto 0);
              CA    : out std_logic;
              CB    : out std_logic;
              CC    : out std_logic;
              CD    : out std_logic;
              CE    : out std_logic;
              CF    : out std_logic;
              CG    : out std_logic;
              DP    : out std_logic;
              AN    : out std_logic_vector (7 downto 0) := "11111110"
);
    end component;

    signal sig_clk   : std_logic;
    signal sig_dist1 : std_logic_vector (8 downto 0);
    signal sig_dist2 : std_logic_vector (8 downto 0);
    signal sig_CA    : std_logic;
    signal sig_CB    : std_logic;
    signal sig_CC    : std_logic;
    signal sig_CD    : std_logic;
    signal sig_CE    : std_logic;
    signal sig_CF    : std_logic;
    signal sig_CG    : std_logic;
    signal sig_DP    : std_logic;
    signal sig_AN    : std_logic_vector (7 downto 0) := "11111110";

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : display
    port map (clk   => sig_clk,
              dist1 => sig_dist1,
              dist2 => sig_dist2,
              CA    => sig_CA,
              CB    => sig_CB,
              CC    => sig_CC,
              CD    => sig_CD,
              CE    => sig_CE,
              CF    => sig_CF,
              CG    => sig_CG,
              DP    => sig_DP,
              AN    => sig_AN);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that clk is really your main clock signal
    sig_clk <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_dist1 <= (others => '0');
        sig_dist2 <= (others => '0');

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        for i in 0 to 400 loop
          sig_dist1 <= std_logic_vector(to_unsigned(i, 9));
          sig_dist2 <= std_logic_vector(to_unsigned(i, 9));
          wait for 1 ms;
        end loop;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_display of tb_display is
    for tb
    end for;
end cfg_tb_display;