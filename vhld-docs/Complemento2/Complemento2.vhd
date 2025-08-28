-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    15/03/2024 01:45:37
-- Project Name:   Complemento2
-- Module Name:    Complemento2.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;  -- Para std_logic
use IEEE.numeric_std.all;     -- Para unsigned

entity Complemento2 is
   port(s1,s2,s3,s4,cout : in std_logic;
		a,b,c,d : out std_logic);

end Complemento2;

architecture arq1 of Complemento2 is
begin

a <= (s1)XOR(NOT(cout));
b <= (s2)XOR(NOT(cout));
c <= (s3)XOR(NOT(cout));
d <= (s4)XOR(NOT(cout));
end arq1;
