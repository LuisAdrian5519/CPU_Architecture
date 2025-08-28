-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    21/03/2024 10:57:19
-- Project Name:   Booth
-- Module Name:    Booth.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Booth is
   port(Multiplicando, Multiplicadr: in std_logic_vector(3 downto 0);
		Producto : out std_logic_vector(7 downto 0);
		clk : std_logic);
end Booth;

architecture arq1 of Booth is
	signal C : integer := 10;
	signal temp : std_logic_vector(3 downto 0) := "0000";
begin

process (C, Multiplicando, Multiplicadr, clk)
	variable tA, tM, tQ, A, B : std_logic_vector(3 downto 0) := "0000";
	variable QM1 : std_logic := '0';
begin
	if rising_edge(clk) then 
		case C is
			when 10 => 
				tA := "0000"; -- := es para variables
				tM := Multiplicadr;
				tQ := Multiplicando;
				C <= C-1;
				QM1 := '0';
			when 9|7|5|3 => 
				if tQ(0) = '1' and QM1 = '0' then
					tA := std_logic_vector(unsigned(tA) - unsigned(tM));
				elsif tQ(0) = '0' and QM1 = '1' then
					tA := std_logic_vector(unsigned(tA) + unsigned(tM));
				end if;
				C <= C-1;
				temp <= tA;
			when 8|6|4|2 =>
				QM1 := tQ(0);
				tQ := tA(0) & tQ(3 downto 1);
				tA := tA(3) & tA(3 downto 1);
				C <= C-1;
			when others =>
				Producto <= tA(3 downto 0) & tQ(3 downto 0);
		end case;
	end if;
end process;

end arq1;
