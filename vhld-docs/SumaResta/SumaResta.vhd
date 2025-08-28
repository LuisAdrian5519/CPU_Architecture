-------------------------------------------------------------------------------
--
-- Company : Cetys
-- Engineer: Jorge Polanco
-- 
-- Create Date:    16/02/2024 11:55:32
-- Project Name:   SumaResta
-- Module Name:    SumaResta.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity SumaResta is
	port(A, B : in std_logic_vector(3 downto 0);
	SR : in std_logic;
	Resultado : out std_logic_vector (3 downto 0);
	Cout : out std_logic); 

end SumaResta;

architecture arq1 of SumaResta is
	component TTL7483
   port(a0, a1, a2, a3, b0, b1, b2, b3, cin : in std_logic;
		s0, s1, s2, s3, cout : out std_logic);
   end component;

component TTL7486
	port(ent1a, ent1b, ent2a, ent2b, ent3a, ent3b, ent4a, ent4b : in std_logic;
	sal1, sal2, sal3, sal4 : out std_logic);
   end component;
	

signal T1 : std_logic_vector( 3 downto 0) := "0000";

begin

	InvSel : TTL7486 port map(B(0), SR, B(1), SR, B(2), SR, B(3), SR, T1(0), T1(1), T1(2), T1(3));
	Sumador : TTL7483 port map (A(0), A(1), A(2), A(3), T1(0), T1(1), T1(2), T1(3), SR, Resultado(0), Resultado(1), Resultado(2), Resultado(3), Cout);
	
end arq1;
