-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    20/02/2024 11:11:09
-- Project Name:   TTL7474
-- Module Name:    TTL7474.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity TTL7474 is
	port(D0,D1,CLK,CLR0,CLR1,PRE0,PRE1 : in std_logic;
	 	Q0,QN0,Q1,QN1 : out std_logic);
end TTL7474;

architecture arq1 of TTL7474 is
begin

ff0: process(D0,D1, CLK, CLR0, PRE0)
	 variable tmp: std_logic := '0';

	begin
		if CLR0 = '0' then
		tmp := '0';
		elsif PRE0 = '0' then
		tmp := '1';
		elsif rising_edge(CLK) then
		tmp := D0;
		end if;
		Q0 <= tmp;
		QN0 <= not(tmp);
	end process;
ff1: process(D1, CLK, CLR1, PRE1)
	 variable tmp: std_logic := '0';

	begin
		if CLR1 = '0' then
		tmp := '0';
		elsif PRE1 = '0' then
		tmp := '1';
		elsif rising_edge(CLK) then
		tmp := D1;
		end if;
		Q1 <= tmp;
		QN1 <= not(tmp);
	end process;
end arq1;
