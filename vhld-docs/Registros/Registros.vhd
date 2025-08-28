-------------------------------------------------------------------------------
--
-- Company : Cetys
-- Engineer: JP
-- 
-- Create Date:    03/05/2024 12:16:39
-- Project Name:   Registros
-- Module Name:    Registros.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Registros is
   port(CLK : in std_logic;
		LDR1, LDR2, LDR3 : in std_logic;
		X : in std_logic_vector(3 downto 0);
		MUX1, MUX2 : in std_logic_vector(1 downto 0);
		OUT1, OUT2 : out std_logic_vector(3 downto 0)
		);
----------registros es registros, mux y los switches.?
end Registros;

architecture arq1 of Registros is
	signal R1, R2, R3 : std_logic_vector(3 downto 0) := "0000";
begin

Reg1 : process(LDR1, CLK, R1)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
	if rising_edge(CLK) and LDR1 ='1' then
		tmp := X;
	end if;
	R1 <= tmp;
end process;

Reg2 : process(LDR2, CLK, R2)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
	if rising_edge(CLK) and LDR2 ='1' then
		tmp := X;
	end if;
	R2<= tmp;
end process;

Reg3 : process(LDR3, CLK, R3)
variable tmp : std_logic_vector(3 downto 0) := "0000";
begin
	if rising_edge(CLK) and LDR3 ='1' then
		tmp := X;
	end if;
	R3 <= tmp;
end process;

Process(MUX1, MUX2, X, R1, R2, R3)
begin
case MUX1 is
when "00" =>
 OUT1<=X;
when "01" =>
 OUT1<=R1;
when "10" =>
 OUT1<=R2;
when "11" =>
 OUT1<=R3;
when others =>
 OUT1<="0000";
end case;

case MUX2 is
when "00" =>
 OUT2<=X;
when "01" =>
 OUT2<=R1;
when "10" =>
 OUT2<=R2;
when "11" =>
 OUT2<=R3;
when others =>
 OUT2<="0000";
end case;
end process;

end arq1;
 -- OUT1 y OUT2 no cambian??
