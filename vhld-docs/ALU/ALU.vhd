-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    09/04/2024 11:36:41
-- Project Name:   ALU
-- Module Name:    ALU.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity ALU is
   port(A, B : in std_logic_vector(3 downto 0);
		R : out std_logic_vector (3 downto 0);
		Oper : in std_logic_vector(2 downto 0);
		Cin : in std_logic;
		Cout : out std_logic);
end ALU;

architecture arq1 of ALU is
begin


process (A, B, Oper, Cin)
	variable At,Bt,Rt : std_logic_vector (4 downto 0);
	variable RMt : std_logic_vector(9 downto 0);
begin
	At := '0' & A;
	Bt := '0' & B;
		case Oper is 
	when "000" =>
		Rt := std_logic_vector(unsigned(At) + unsigned(Bt));
		Cout <= Rt(4);
	when "001" =>
		Rt := std_logic_vector(unsigned(At) - unsigned(Bt));
		Cout <= '0';
	when "010" =>
		RMt := std_logic_vector(unsigned(At) * unsigned(Bt));
		Rt := RMt(4 downto 0);--solo multiplica hasta "15" como resultado
		Cout <= '0';
	when "011" =>
		Rt := std_logic_vector(unsigned(At) / unsigned(Bt));
		Cout <= '0';
	when "100" =>
		Rt := At AND Bt;
		Cout <= '0';
	when "101" =>
		Rt := At OR Bt;
		Cout <= '0';
	when "110" =>
		Rt := At XOR Bt;
		Cout <= '0';
	when "111" =>
		Rt := NOT At;
		Cout <= '0';
	when others =>
		Rt :="ZZZZZ";
end case;
R <= Rt(3 downto 0);
end process;
end arq1;
