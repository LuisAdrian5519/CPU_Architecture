-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    21/02/2024 11:33:54
-- Project Name:   TTL74194
-- Module Name:    TTL74194.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity TTL74194 is
   port(ABCD : in std_logic_vector(3 downto 0);
		QABCD : out std_logic_vector(3 downto 0);
		SR, SL, S0, S1, CLK, CLR : in std_logic);
end TTL74194;

architecture arq1 of TTL74194 is
begin

process(SR, SL, S0, S1, CLK, CLR)
	variable tmp : std_logic_vector(3 downto 0);
begin
	if CLR = '0' then
		tmp := "0000";
	elsif rising_edge(CLK) then --rising edge es cuando cambia la salida de CLK de 0 a 1
		if S1 = '1' and S0 = '1' then
			tmp := ABCD;
	elsif S1 = '0' and S0 = '1' then
			tmp:= SR & tmp(3 downto 1);
	elsif S1 = '1' and S0 = '0' then
			tmp:= tmp(2 downto 0) & SL;
		end if;
	end if;

	QABCD <= tmp;
end process;

end arq1;
