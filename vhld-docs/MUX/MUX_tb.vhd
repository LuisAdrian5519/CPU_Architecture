-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 11:48:36
-- Project Name:   MUX
-- Module Name:    MUX_tb.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end mux_tb;

architecture Behavioral of mux_tb is
    component TTL74157_4to1_Mux is
        port (
        S, D0, D1, D2, D3, G0, G1, G2, G3 : in std_logic;  
        Y : out std_logic_vector(3 downto 0)              
    );
    end component;

    signal D0_tb, D1_tb, D2_tb, D3_tb, G0_tb, G1_tb, G2_tb, G3_tb : std_logic := '0'; -- Test data inputs
    signal S_tb : std_logic := '0'; -- Test select inputs
    signal Y_tb : std_logic_vector(3 downto 0) := "0000";                              -- Test output

begin
    -- Instantiate the multiplexer
    UUT: TTL74157_4to1_Mux
        port map (
            D0 => D0_tb,
            D1 => D1_tb,
            D2 => D2_tb,
            D3 => D3_tb,
            G0 => G0_tb,
            G1 => G1_tb,
            G2 => G2_tb,
            G3 => G3_tb,
            S => S_tb,
            Y => Y_tb
        );

    -- Stimulus process
    stimulus: process
    begin
        -- Test case 1: Select input 0000
        D0_tb <= '1'; D1_tb <= '0'; D2_tb <= '0'; D3_tb <= '0';
		G0_tb <= '0'; G1_tb <= '0'; G2_tb <= '1'; G3_tb <= '1';
        S_tb <= '0';
        wait for 100 ns;
        D0_tb <= '0'; D1_tb <= '0'; D2_tb <= '0'; D3_tb <= '1';
		G0_tb <= '0'; G1_tb <= '1'; G2_tb <= '0'; G3_tb <= '1';
        S_tb <= '1';
        wait for 100 ns;
        D0_tb <= '0'; D1_tb <= '0'; D2_tb <= '0'; D3_tb <= '1';
		G0_tb <= '0'; G1_tb <= '1'; G2_tb <= '0'; G3_tb <= '1';
        S_tb <= '0';

        wait;
    end process;
end Behavioral;
