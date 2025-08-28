-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Blanca Ramirez
-- 
-- Create Date:    14/02/2024 12:03:14
-- Project Name:   TTL7404
-- Module Name:    TTL7404.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity TTL7404 is
	port(ent1, ent2, ent3, ent4, ent5, ent6 : in std_logic;-- 6 entradas
		 sal1, sal2, sal3, sal4, sal5, sal6: out std_logic);
-- 6 salidas
end TTL7404;

architecture arq1 of TTL7404 is
begin

	sal1 <= not(ent1);
	sal2 <= not(ent2);
	sal3 <= not(ent3);
	sal4 <= not(ent4);
	sal5 <= not(ent5);
	sal6 <= not(ent6);
end arq1;
