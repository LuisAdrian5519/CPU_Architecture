-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:23:37
-- Project Name:   SumadorBCD
-- Module Name:    SumadorBCD.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity SumadorBCD is
   port(A,B,C: in std_logic_vector(3 downto 0);
		R: out std_logic_vector(3 downto 0);
--		cin: in std_logic;
		cout1: out std_logic);
end SumadorBCD;

architecture arq1 of SumadorBCD is
	component TTL7483
	port(a0, a1, a2, a3, b0, b1, b2, b3, cin : in std_logic;
		s0, s1, s2, s3, cout : out std_logic);
	end component;
begin
	sum1 : TTL7483 port map(A(0),A(1),A(2),A(3),B(0),B(1),B(2),B(3),'0',R(0),R(1),R(2),R(3),cout1);
	C(0) <= '0';
	C(1) <= (R(0))AND((R(1)OR(R(2)));
	
	sum2 : TTL7483 port map(R(0),R(1),R(2),R(3),C(0), );
end arq1;
