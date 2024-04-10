-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : 4.4.2024 08:42:50 UTC

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity tb_display is
end tb_display;

architecture tb of tb_display is

    component display
        port (CLK100MHZ : in std_logic;
              dist      : in std_logic_vector (8 downto 0);
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

    signal sig_CLK100MHZ : std_logic;
    signal sig_dist      : std_logic_vector (8 downto 0);
    signal sig_CA        : std_logic;
    signal sig_CB        : std_logic;
    signal sig_CC        : std_logic;
    signal sig_CD        : std_logic;
    signal sig_CE        : std_logic;
    signal sig_CF        : std_logic;
    signal sig_CG        : std_logic;
    signal sig_DP        : std_logic;
    signal sig_AN        : std_logic_vector (7 downto 0);

    constant TbPeriod : time := 10 ns; -- EDIT Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : display
    port map (CLK100MHZ => sig_CLK100MHZ,
              dist      => sig_dist,
              CA        => sig_CA,
              CB        => sig_CB,
              CC        => sig_CC,
              CD        => sig_CD,
              CE        => sig_CE,
              CF        => sig_CF,
              CG        => sig_CG,
              DP        => sig_DP,
              AN        => sig_AN);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- EDIT: Check that CLK100MHZ is really your main clock signal
    sig_CLK100MHZ <= TbClock;

    stimuli : process
    begin
        -- EDIT Adapt initialization as needed
        sig_dist <= (others => '0');

        -- EDIT Add stimuli here
        wait for 100 * TbPeriod;

        for i in 0 to 400 loop
          sig_dist <= std_logic_vector(to_unsigned(i, 9));
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