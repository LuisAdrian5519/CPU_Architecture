-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    16/04/2024 12:02:20
-- Project Name:   Memoria
-- Module Name:    Memoria.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Memoria is
   port(Dir, Din : in std_logic_vector(3 downto 0);
		Dout : out std_logic_vector(3 downto 0);
		Rd, Wr, Clk : in std_logic );
end Memoria;

architecture arq1 of Memoria is
	type RAM is array (0 to 15) of std_logic_vector(3 downto 0);
	signal contenido : RAM := ("1100","0010","0001","0000",
								"1100","0010","0001","0000",
								"1100","0010","0001","0000",
								"1100","0010","0001","0000");
signal palabra : integer range 0 to 15 := 0;
signal tmp : std_logic_vector(3 downto 0) := "0000";
begin


process( Dir, Din, Rd, Wr, Clk)
begin
	palabra <= to_integer(unsigned(Dir));
	if rising_edge(Clk) then
		if Rd = '1' then
			Dout <= contenido(palabra);
		elsif Wr = '1' then
			contenido(palabra) <= Din;
			Dout <= "ZZZZ";
		else
		Dout <= "ZZZZ";
		end if;
	end if;
end process;

end arq1;
