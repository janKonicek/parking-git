----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.04.2024 09:21:22
-- Design Name: 
-- Module Name: led - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led is
    
    Port ( dist : in STD_LOGIC_VECTOR (8 downto 0):= (others => '0');
           LED_A : out STD_LOGIC_VECTOR (7 downto 0):= (others => '0'));
end led;

architecture Behavioral of led is


begin

--LED_A(7) <= not(dist(8)) and not(dist(7));
--LED_A(6) <= not(dist(7));
--LED_A(5) <= not(dist(6));
--LED_A(4) <= not(dist(5));
--LED_A(3) <= not(dist(4));
--LED_A(2) <= not(dist(3));
--LED_A(1) <= not(dist(2));
--LED_A(0) <= not(dist(1));

--if dist(1) = '1' then
--    LED_A(7 downto 0) <= (others => '1');
--end if;

begin
LED : process(dist) is
begin
if dist(8) = '1' then

LED_A(7) <= '0';
LED_A(6) <= '0';
LED_A(5) <= '0';
LED_A(4) <= '0';
LED_A(3) <= '0';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(7) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '0';
LED_A(5) <= '0';
LED_A(4) <= '0';
LED_A(3) <= '0';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(6) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '0';
LED_A(4) <= '0';
LED_A(3) <= '0';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(5) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '0';
LED_A(3) <= '0';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(4) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '1';
LED_A(3) <= '0';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(3) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '1';
LED_A(3) <= '1';
LED_A(2) <= '0';
LED_A(1) <= '0';
LED_A(0) <= '0';

else if dist(2) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '1';
LED_A(3) <= '1';
LED_A(2) <= '1';
LED_A(1) <= '0';
LED_A(0) <= '0';


else if dist(1) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '1';
LED_A(3) <= '1';
LED_A(2) <= '1';
LED_A(1) <= '1';
LED_A(0) <= '0';

else if dist(0) = '1' then

LED_A(7) <= '1';
LED_A(6) <= '1';
LED_A(5) <= '1';
LED_A(4) <= '1';
LED_A(3) <= '1';
LED_A(2) <= '1';
LED_A(1) <= '1';
LED_A(0) <= '1';
end if; 

end process LED;
end Behavioral;
