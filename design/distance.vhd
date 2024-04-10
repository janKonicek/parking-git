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

    Port ( CLK100MHZ : in STD_LOGIC;
           ECHO1 : in STD_LOGIC;
           dist : out STD_LOGIC_VECTOR (8 downto 0):= (others => '0'));
           
    signal sig_count : std_logic_vector (8 downto 0) := (others => '0'); 
    signal neg_edge : std_logic;
    signal ECHO1_delayed : std_logic;
       
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

    clk: component clock_enable
    generic map(    PERIOD => 5880)
    port map(   clk => CLK100MHZ,
                rst => '0',
                pulse => clk_en);
    
    -- delayed signal to determinatate falling edge
    delay: process (CLK100MHZ)
    begin  
        if rising_edge (CLK100MHZ) then
            ECHO1_delayed <= ECHO1;        
        end if;    
    end process;   
    
    -- falling edge
    neg_edge <= '1' when (ECHO1 = '0' and ECHO1_delayed = '1') else '0';  
           
    -- counter in cm
    count: process (clk_en) is
    begin
       if rising_edge(clk_en) then
          if echo1='1' then
             sig_count <= sig_count + 1;
          -- counter reset   
          elsif echo1='0' then
             sig_count <= (others => '0');
          end if;
       end if;
    end process;

    -- update dist after new distance is measured
    process (CLK100MHZ) 
    begin 
        if neg_edge = '1' then
            dist <= sig_count;
        end if;
    end process;
    
end Behavioral;
