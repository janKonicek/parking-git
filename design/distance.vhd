----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.04.2024 16:47:44
-- Design Name: 
-- Module Name: distance - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity distance is

    Port ( clk  : in STD_LOGIC;
           echo : in STD_LOGIC;
           dist : out STD_LOGIC_VECTOR (8 downto 0):= (others => '0'));
           
    signal sig_count : std_logic_vector (8 downto 0) := (others => '0'); 
    signal neg_edge  : std_logic;
    signal echo_delayed : std_logic;
       
end distance;

architecture Behavioral of distance is

    component clock_enable is
        generic (PERIOD : integer := 5880);
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               pulse : out STD_LOGIC);
    end component ;
    
    signal clk_en : std_logic;       
    
begin

    clock: component clock_enable
    generic map(    PERIOD => 5880)
    port map(   clk => clk,
                rst => '0',
                pulse => clk_en);
    
    -- delayed signal to determinatate falling edge
    delay: process (clk)
    begin  
        if rising_edge (clk) then
            echo_delayed <= echo;        
        end if;    
    end process;   
    
    -- falling edge
    neg_edge <= '1' when (echo = '0' and echo_delayed = '1') else '0';  
           
    -- counter in cm
    count: process (clk) is
    begin
       if rising_edge(clk) then
          if clk_en='1' then
            if echo='1' then
               sig_count <= sig_count + 1;
            -- counter reset   
            elsif echo='0' then
               sig_count <= (others => '0');
            end if;
          end if;
       end if;
    end process;

    -- update dist after new distance is measured
    process (clk) 
    begin 
        if neg_edge = '1' then
            dist <= sig_count;
        end if;
    end process;
    
end Behavioral;
