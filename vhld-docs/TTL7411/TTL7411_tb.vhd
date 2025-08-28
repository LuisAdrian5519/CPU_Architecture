-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:53:27
-- Project Name:   TTL7411
-- Module Name:    TTL7411_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

-- Test bench for 3-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ttl7411_tb is
end ttl7411_tb;

architecture Behavioral of ttl7411_tb is

    -- Component declaration for the AND3 gate
    component AND3
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               C : in STD_LOGIC;
               F : out STD_LOGIC);
    end component;

    -- Signal declarations
    signal A_tb, B_tb, C_tb : STD_LOGIC;
    signal F_tb : STD_LOGIC;

begin

    -- Instantiate the AND3 gate
    UUT: AND3 port map (A => A_tb, B => B_tb, C => C_tb, F => F_tb);

    -- Stimulus process
    stimulus : process
    begin
        -- Test case 1: All inputs are '0'
        A_tb <= '0';
        B_tb <= '0';
        C_tb <= '0';
        wait for 10 ns;

        -- Test case 2: All inputs are '1'
        A_tb <= '1';
        B_tb <= '1';
        C_tb <= '1';
        wait for 10 ns;

        -- Test case 3: A = '1', B = '0', C = '1'
        A_tb <= '1';
        B_tb <= '0';
        C_tb <= '1';
        wait for 10 ns;

        -- Test case 4: A = '0', B = '1', C = '1'
        A_tb <= '0';
        B_tb <= '1';
        C_tb <= '1';
        wait for 10 ns;

        -- Test case 5: A = '1', B = '1', C = '0'
        A_tb <= '1';
        B_tb <= '1';
        C_tb <= '0';
        wait for 10 ns;

        -- Test case 6: A = '1', B = '0', C = '0'
        A_tb <= '1';
        B_tb <= '0';
        C_tb <= '0';
        wait for 10 ns;

        -- Test case 7: A = '0', B = '1', C = '0'
        A_tb <= '0';
        B_tb <= '1';
        C_tb <= '0';
        wait for 10 ns;

        -- Test case 8: A = '0', B = '0', C = '1'
        A_tb <= '0';
        B_tb <= '0';
        C_tb <= '1';
        wait for 10 ns;

        -- End of test cases
        wait;
    end process;

end Behavioral;

