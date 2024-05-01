----------------------------------------------------------------------------------
-- Company: Team
-- Engineer: Martin Koplík
-- 
-- Create Date: 11.04.2024 09:21:22
-- Design Name: led
-- Module Name: led - Behavioral
-- Project Name: Smart parking system
-- Target Devices: Nexys A7-50T
-- Tool Versions: Vivado 2023.2
-- Description: This component is responsible for assigning the obtained distance to the correct LED.
-- 
-- Dependencies: IEEE.STD_LOGIC_1164
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

entity led is
    
    Port ( dist : in STD_LOGIC_VECTOR (8 downto 0):= (others => '0');
           LED : out STD_LOGIC_VECTOR (7 downto 0):= (others => '0'));
end led;

architecture Behavioral of led is


begin

P_LED : process(dist) is
begin
    if dist(8) = '1' then
        LED <= "00000000";
    elsif dist(7) = '1' then
        LED <= "10000000";
    elsif dist(6) = '1' then
        LED <= "11000000";
    elsif dist(5) = '1' then
        LED <= "11100000";
    elsif dist(4) = '1' then
        LED <= "11110000";
    elsif dist(3) = '1' then
        LED <= "11111000";
    elsif dist(2) = '1' then
        LED <= "11111100";
    elsif dist(1) = '1' then
        LED <= "11111110"; 
    elsif dist(0) = '1' then
        LED <= "11111111";
    end if; 

end process P_LED;
end Behavioral;
