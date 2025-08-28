-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 11:48:36
-- Project Name:   MUX
-- Module Name:    MUX.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity TTL74157_4to1_Mux is
    port (
        S, D0, D1, D2, D3, G0, G1, G2, G3 : in std_logic;  
        Y : out std_logic_vector(3 downto 0)             
    );
end TTL74157_4to1_Mux;

architecture Behavioral of TTL74157_4to1_Mux is
begin
    process (D0, D1, D2, D3, G0, G1, G2, G3, S)
    begin
        case S is
            when '0' =>
                Y(3) <= D0;
				Y(2) <= D1;
                Y(1) <= D2;
                Y(0) <= D3;
            when '1' =>
                Y(3) <= G0;
				Y(2) <= G1;
                Y(1) <= G2;
                Y(0) <= G3;
            when others =>
                Y <= "0000"; -- Output is undefined for other select inputs
        end case;
    end process;
end Behavioral;
