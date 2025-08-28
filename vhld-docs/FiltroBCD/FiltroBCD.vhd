-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:32:37
-- Project Name:   FiltroBCD
-- Module Name:    FiltroBCD.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity FiltroBCD is
   port (
      a1, a2, a3, a4, b1, b2, b3, b4, SR : in std_logic;
      sa1, sa2, sa3, sa4, sb1, sb2, sb3, sb4 : out std_logic
   );
end FiltroBCD;

architecture arq1 of FiltroBCD is
begin
   sa1 <= a1 AND (NOT(a2)) AND NOT(a3);
   sa2 <= NOT(a1) AND a2;
   sa3 <= NOT(a1) AND a3;
   sa4 <= ((NOT(a1)) AND (a4)) OR ((NOT(a2)) AND (NOT(a3)) AND (a4));  

   sb1 <= (b1 AND (NOT(b2)) AND NOT(b3)) XOR (SR);  
   sb2 <= (NOT(b1) AND b2) XOR (SR);  
   sb3 <= (NOT(b1) AND b3) XOR (SR);  
   sb4 <= (((NOT(b1)) AND (b4)) OR ((NOT(b2)) AND (NOT(b3)) AND (b4))) XOR (SR);  

end arq1;
