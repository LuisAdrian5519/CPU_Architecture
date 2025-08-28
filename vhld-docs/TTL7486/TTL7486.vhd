-------------------------------------------------------------------------------
--
-- Company : CETYS Universidad
-- Engineer: Blanca Ramirez
-- 
-- Create Date:    14/02/2024 12:35:25
-- Project Name:   TTL7486
-- Module Name:    TTL7486.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity TTL7486 is
	port(ent1a, ent1b, ent2a, ent2b, ent3a, ent3b, ent4a, ent4b : in std_logic;
		 sal1, sal2, sal3, sal4 : out std_logic);
end TTL7486;

architecture arq1 of TTL7486 is
begin

	sal1 <= ent1a xor ent1b;
	sal2 <= ent2a xor ent2b;
	sal3 <= ent3a xor ent3b;
	sal4 <= ent4a xor ent4b;
end arq1;
