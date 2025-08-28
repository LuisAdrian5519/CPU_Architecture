-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    06/03/2024 11:33:24
-- Project Name:   EjemploTransf
-- Module Name:    EjemploTransf.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity EjemploTransf is
   port(DatoEnt : in std_logic_vector(3 downto 0);
		DatoSal : out std_logic_vector(3 downto 0);
		L1, L2, clk : in std_logic);

end EjemploTransf;

architecture arq1 of EjemploTransf is
	signal SalReg1 : std_logic_vector(3 downto 0) := "0000";
begin

reg1 : process(DatoEnt, L1, clk)
	variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
	if rising_edge(clk) and L1 ='1' then
		tmp := DatoEnt;

	end if;
	SalReg1 <= tmp;
end process;

reg2 : process(SalReg1, L2, clk)
	variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
	if rising_edge(clk) and L2 ='1' then
		tmp := SalReg1;

	end if;
	DatoSal <= tmp;
end process;
end arq1;
