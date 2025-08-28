-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 20:00:06
-- Project Name:   TTL7408
-- Module Name:    TTL7408_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

-- Test bench for 2-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ttl7408_tb is
end ttl7408_tb;

architecture Behavioral of ttl7408_tb is

    -- Component declaration for the AND gate
    component AND_GATE
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               F : out STD_LOGIC);
    end component;

    -- Signal declarations
    signal A_tb, B_tb : STD_LOGIC;
    signal F_tb : STD_LOGIC;

begin

    -- Instantiate the AND gate
    UUT: AND_GATE port map (A => A_tb, B => B_tb, F => F_tb);

    -- Stimulus process
    stimulus : process
    begin
        -- Test case 1: A = '0', B = '0'
        A_tb <= '0';
        B_tb <= '0';
        wait for 10 ns;

        -- Test case 2: A = '0', B = '1'
        A_tb <= '0';
        B_tb <= '1';
        wait for 10 ns;

        -- Test case 3: A = '1', B = '0'
        A_tb <= '1';
        B_tb <= '0';
        wait for 10 ns;

        -- Test case 4: A = '1', B = '1'
        A_tb <= '1';
        B_tb <= '1';
        wait for 10 ns;

        -- End of test cases
        wait;
    end process;

end Behavioral;
