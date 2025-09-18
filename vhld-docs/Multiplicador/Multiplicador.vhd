-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    20/03/2024 11:15:10
-- Project Name:   Multiplicador
-- Module Name:    Multiplicador.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Multiplicador is
     port(Multiplicando, Multiplicador : in std_logic_vector(3 downto 0);
			Producto : out std_logic_vector(7 downto 0);
			clk : std_logic);

end Multiplicador;

architecture arq1 of Multiplicador is
	signal C : integer := 10;
begin


process (C, Multiplicando, Multiplicador, clk)
	variable tA, tM, tQ : std_logic_vector(4 downto 0) := "00000";
begin
	if rising_edge(clk) then 
		case C is
			when 10 => 
				tA := "00000"; -- := es para variables
				tM := '0' & Multiplicador;
				tQ := '0' & Multiplicando;
				C <= C-1;
			when 9|7|5|3 => 
				if tQ(0) = '1' then
					tA := std_logic_vector(unsigned(tA) + unsigned(tM));
				end if;
				C <= C-1;
			when 8|6|4|2 =>
				tQ := tA(0) & tQ(4 downto 1);
				tA := '0'& tA(4 downto 1);
				C <= C-1;
			when others =>
				Producto <= tA(3 downto 0) & tQ(4 downto 1);
		end case;
	end if;
end process;

end arq1;
