-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 02:31:25
-- Project Name:   sum2b
-- Module Name:    sum2b.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity sum2b is
   port(a,b,c : in std_logic;
		ans : out std_logic);
end sum2b;

architecture arq1 of sum2b is
begin
ans <= (a)AND((b)OR(c));

end arq1;
