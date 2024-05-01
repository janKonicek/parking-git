----------------------------------------------------------------------------------
-- Company: Team
-- Engineer: Jan Konicek
-- 
-- Create Date: 28.03.2024 10:30:40
-- Design Name: display
-- Module Name: display - Behavioral
-- Project Name: Smart parking system
-- Target Devices: Nexys A7-50T
-- Tool Versions: Vivado 2023.2
-- Description: Display distance on two 4 digit 7 segement displays 
-- 
-- Dependencies: 
--      IEEE.STD_LOGIC_1164
--      IEEE.NUMERIC_STD
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;        
use IEEE.NUMERIC_STD.ALL;


entity display is
    Port ( 
        clk : in STD_LOGIC;                                     -- device clock (100 MHz)
        dist1 : in STD_LOGIC_VECTOR (8 downto 0);               -- distance vector from first sensor
        dist2 : in STD_LOGIC_VECTOR (8 downto 0);               -- distance vector from second sensor
        CA : out STD_LOGIC;
        CB : out STD_LOGIC;
        CC : out STD_LOGIC;
        CD : out STD_LOGIC;
        CE : out STD_LOGIC;
        CF : out STD_LOGIC;
        CG : out STD_LOGIC;
        DP : out STD_LOGIC := '1';
        AN : out STD_LOGIC_VECTOR (7 downto 0) := "11111110"
    );
end display;

architecture Behavioral of display is

    -- Component bin2seg declaration
    component bin2seg is
        Port ( clear : in STD_LOGIC;
                bin : in STD_LOGIC_VECTOR (3 downto 0);
                seg : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    -- Component clock_enable declaration for 25 ms
    component clock_enable is
        generic (
            PERIOD : integer := 2500
        );
        Port ( clk : in STD_LOGIC;
               rst : in STD_LOGIC;
               pulse : out STD_LOGIC);
    end component clock_enable;

    -- number integer signal
    signal number : integer := 0;
    signal number2 : integer := 0;

    -- digit signals
    signal digit0 : integer := 0;
    signal digit1 : integer := 0;
    signal digit2 : integer := 0;

    signal digit01 : integer := 0;
    signal digit11 : integer := 0;
    signal digit21 : integer := 0;
    
    signal digit : integer := 0;

    signal digitOut : std_logic_vector (3 downto 0);

    -- signal for 25 ms
    signal sig_en_25ms : std_logic;  

    -- signal for current digit
    signal currentDigit : integer range 0 to 6 := 0;


begin
   
    -- Component instantiation of clock enable for 25 ms
    CLK_EN : clock_enable
    Port map (
        clk => clk,
        rst => '0',
        pulse => sig_en_25ms
    );

    -- Component instantiation of bin2seg for digit
    SEGMENT : bin2seg
    Port map(   clear => '0',
                bin => digitOut,
                seg(6) => CA,
                seg(5) => CB,
                seg(4) => CC,
                seg(3) => CD,
                seg(2) => CE,
                seg(1) => CF,
                seg(0) => CG
    );

    show_digit : process (clk) is
    begin
    
        if (rising_edge(clk)) then
            if sig_en_25ms = '1' then

                -- convert distance to integer
                number <= to_integer(unsigned(dist1));
                number2 <= to_integer(unsigned(dist2));
            
                -- split number into digits
                digit0 <= number mod 10;
                digit1 <= ((number - digit0) / 10) mod 10;
                digit2 <= (((number - digit0) / 10 - digit1) /10) mod 10;

                digit01 <= number2 mod 10;
                digit11 <= ((number2  - digit01) / 10) mod 10;
                digit21 <= (((number2 - digit01) / 10 - digit11) /10) mod 10;
                
                
                -- show digit
                case currentDigit is
                    when 0 =>
                        digitOut <= std_logic_vector(to_unsigned(digit0, 4));
                        AN <= "11111110";
                        DP <= '1';
                        currentDigit <= 1;
                    when 1 =>
                        digitOut <= std_logic_vector(to_unsigned(digit1, 4));
                        AN <= "11111101";
                        DP <= '1';
                        currentDigit <= 2;
                    when 2 =>
                        digitOut <= std_logic_vector(to_unsigned(digit2, 4));
                        AN <= "11111011";
                        DP <= '1';
                        currentDigit <= 3;
                    when 3 =>
                        digitOut <= std_logic_vector(to_unsigned(digit01, 4));
                        AN <= "11101111";
                        DP <= '1';
                        currentDigit <= 4;
                    when 4 =>
                        digitOut <= std_logic_vector(to_unsigned(digit11, 4));
                        AN <= "11011111";
                        DP <= '1';
                        currentDigit <= 5;
                    when 5 =>
                        digitOut <= std_logic_vector(to_unsigned(digit21, 4));
                        AN <= "10111111";
                        DP <= '1';
                        currentDigit <= 0;
                    when others =>
                        currentDigit <= 0;
                        
                end case;
            end if;
           
        end if;

    end process show_digit;

end Behavioral;
