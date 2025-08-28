-------------------------------------------------------------------------------
--
-- Company : Universidad Miguel Hernandez
-- Engineer: User
-- 
-- Create Date:    14/03/2024 19:53:27
-- Project Name:   TTL7411
-- Module Name:    TTL7411.vhd
-- Description:
--
-- Additional Comments:
--
-------------------------------------------------------------------------------

-- 3-input AND gate
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           F : out STD_LOGIC);
end AND3;

architecture Behavioral of AND3 is
begin
    F <= A AND B AND C;
end Behavioral;
